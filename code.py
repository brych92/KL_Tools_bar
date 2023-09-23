
from qgis.PyQt.QtCore import QSettings, QTranslator, QCoreApplication, QProcess, QProcessEnvironment, QUrl, QTimer
from qgis.core import QgsCoordinateReferenceSystem, QgsApplication, QgsVectorTileLayer
from qgis.PyQt.QtGui import QIcon, QRegularExpressionValidator, QFontMetrics, QValidator, QDesktopServices, QColor
from qgis.PyQt.QtWidgets import *
from qgis.PyQt.QtCore import QRegularExpression as QRegExp
from qgis.gui import QgsMapToolIdentifyFeature, QgsMapToolIdentify, QgsVertexMarker
import requests
import json
from requests.structures import CaseInsensitiveDict
import re
import os

from qgis.core import QgsVectorLayer, QgsFeature, QgsGeometry, QgsPointXY, QgsProject, QgsApplication, QgsRectangle, QgsCoordinateTransform

class KL_Search_bar:
    def __init__(self, iface):
        self.iface = iface
        self.plugin_dir = os.path.dirname(__file__)
        self.actions = []
        self.isRun=None
        self.folder_path=os.path.expanduser('~')
        self.toolbar = self.iface.addToolBar("Пошук по Kadastr.Live")
        self.toolbar.setObjectName('KL_Serach_bar')
        self.toolbar.setToolTip("Пошук ділянки на карті Kadastr.Live за кадастровим номером")
        
    def initGui(self):
        icon = QIcon(os.path.join(self.plugin_dir,"Search.png"))
        search = QAction(icon, "Пошук введеної ділянки",self.iface.mainWindow())
        search.triggered.connect(self.Search)
        search.setEnabled(True)
        self.cadNum = QLineEdit()
        font_metrics=QFontMetrics(self.cadNum.font())
        self.cadNum.setFixedWidth(font_metrics.width('0' * 24))
        self.cadNum.setPlaceholderText("Введіть кадастровий номер...")
        self.cadNum.setValidator(QRegularExpressionValidator(QRegExp("[\d]{10}:[\d]{2}:[\d]{3}:[\d]{4}"),self.toolbar))
        self.cadNum.returnPressed.connect(self.Search)
        self.toolbar.addWidget(self.cadNum)
        self.toolbar.addAction(search)        
        self.actions.append(search)
        
        icon = QIcon(os.path.join(self.plugin_dir,"KL-go.png"))
        KLgo = QAction(icon, "Подивитися інформацію про введену ділянку на Kadastr.Live",self.iface.mainWindow())
        KLgo.triggered.connect(self.KLgo)
        KLgo.setEnabled(True)
        self.toolbar.addAction(KLgo)        
        self.actions.append(KLgo)
        
        icon = QIcon(os.path.join(self.plugin_dir,"Land-go.png"))
        LandGo = QAction(icon, "Подивитися інформацію про введену ділянку на land.gov.ua",self.iface.mainWindow())
        LandGo.triggered.connect(self.LandGo)
        LandGo.setEnabled(True)
        self.toolbar.addAction(LandGo)        
        self.actions.append(LandGo)
        
        icon = QIcon(os.path.join(self.plugin_dir,"Area.png"))
        GetArea = QAction(icon, "Показати площу введеної ділянки",self.iface.mainWindow())
        GetArea.triggered.connect(self.GetArea)
        GetArea.setEnabled(True)
        self.toolbar.addAction(GetArea)        
        self.actions.append(GetArea)
    def unload(self):
        for action in self.actions:
            self.iface.removeToolBarIcon(action)
        del self.toolbar
    
    def mark_point(self,point):
        
        canvas = self.iface.mapCanvas()
        
        marker2 = QgsVertexMarker(canvas)
        marker2.setCenter(point)
        marker2.setColor(QColor(0, 0, 0))  
        marker2.setPenWidth(8)
        marker2.setIconSize(30)
        marker2.setIconType(QgsVertexMarker.ICON_X)
        
        
        marker = QgsVertexMarker(canvas)
        marker.setCenter(point)
        marker.setColor(QColor(250, 220, 0))  
        marker.setPenWidth(3)
        marker.setIconSize(30)
        marker.setIconType(QgsVertexMarker.ICON_X)
        
        

        # Function to remove the marker
        def remove_marker():
            canvas.scene().removeItem(marker)
            canvas.scene().removeItem(marker2)
            timer.stop()  # Stop the timer

        # Create a QTimer to remove the marker after 15 seconds (15000 milliseconds)
        timer = QTimer()
        timer.timeout.connect(remove_marker)
        timer.start(15000)  # Start the timer

        # Add the marker to the canvas
        #canvas.scene().addItem(marker2)
        #canvas.scene().addItem(marker)
        
    
    def get_area(self,cadnum,timeout=10,show_msg=False):
        """
        Get area as text of area attribute coordinates based on a cadnum.
        

        :param cadnum: The cadnum to search for.
        :param timeout: Timeout for the HTTP request (in seconds).
        :param show_msg: Define rising of message box with area value.
        :return: area as float, area_unit as string
        :raises: requests.exceptions.RequestException if an HTTP request error occurs.
        """
        try:
            token_url = f"https://kadastr.live/search/{cadnum}/"
            token_headers = requests.structures.CaseInsensitiveDict()
            token_headers["Accept"] = "application/json"
            token_headers['User-Agent'] = 'QGIS Kadastr.Live search plugin/0.1'#'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2810.1 Safari/537.36'
            token_session = requests.session()
            
            token_response = token_session.get(token_url, timeout=timeout)

            token_response.raise_for_status()  # Raise an exception if the request was not successful
            
            respond = json.loads(token_response.text)

            if 'results' in respond and respond['results']:
                area_unit = respond['results'][0]['unit_area']
                area=float(respond['results'][0]['area'])
                if show_msg:
                    self.message_show(f"Площа введеної ділянки {cadnum}:{area} {area_unit}",None,QMessageBox.NoIcon)
                return area, area_unit
            else:
                print("No results found for the provided cadnum.")
                self.message_show("Помилка","За даним кадастровим номером ділянок не знайдено!",QMessageBox.Warning)
                return None, None, None
        except requests.exceptions.RequestException as e:
            print(f"HTTP request error: {e}")
            raise  # Re-raise the exception for handling at a higher level
    
    def validate_input(self, element):
        validator = element.validator()
        input_text = element.text()
        if input_text.strip() == "":#чи не пустий
            return False
        if validator is not None:
            state, _, _ = validator.validate(input_text, 0)
            if state == QValidator.Acceptable: #чи проходить валідацію
                return True
            else:
                return False
        else:
            return True
    
    def message_show(self,message,informText,icon):
            msgBox = QMessageBox()
            if icon!='':
                msgBox.setIcon(icon)
            msgBox.setText(message)
            if informText!='':
                msgBox.setInformativeText(informText)
            msgBox.exec()
         
    def LandGo(self):        
        #print('LandGo')
        if self.validate_input(self.cadNum):
            cadnum=self.cadNum.text()
            QDesktopServices.openUrl(QUrl(f"https://e.land.gov.ua/back/cadaster/?cad_num={cadnum}"))
            return
        else:   
            layer=self.iface.activeLayer()
            if layer.providerType()=='vectortile':
                if layer.sourcePath()=='https://cdn.kadastr.live/tiles/maps/kadastr/land_polygons/{z}/{x}/{y}.pbf':
                    if layer.selectedFeatureCount()>0:                        
                        for feature in layer.selectedFeatures():
                            cadnum=feature.attribute('cadnum')
                            QDesktopServices.openUrl(QUrl(f"https://e.land.gov.ua/back/cadaster/?cad_num={cadnum}"))
                        return
            self.message_show("Помилка","Введіть правильний кадастровий номер, або виберіть ділянки на карті!",QMessageBox.Warning)
            return
    
    def KLgo(self):
        #print('KLgo')
        if self.validate_input(self.cadNum):
            cadnum=self.cadNum.text()
            QDesktopServices.openUrl(QUrl(f"https://kadastr.live/parcel/{cadnum}"))
            return
        else:   
            layer=self.iface.activeLayer()
            if layer.providerType()=='vectortile':
                if layer.sourcePath()=='https://cdn.kadastr.live/tiles/maps/kadastr/land_polygons/{z}/{x}/{y}.pbf':
                    if layer.selectedFeatureCount()>0:
                        for feature in layer.selectedFeatures():
                            cadnum=feature.attribute('cadnum')
                            QDesktopServices.openUrl(QUrl(f"https://kadastr.live/parcel/{cadnum}"))
                        return
            self.message_show("Помилка","Введіть правильний кадастровий номер, або виберіть ділянки на карті!",QMessageBox.Warning)
            return
    
    def Search(self):
        def get_coordinates_from_cadnum(cadnum, timeout=10):
            """
            Get latitude and longitude coordinates based on a cadnum.

            :param cadnum: The cadnum to search for.
            :param timeout: Timeout for the HTTP request (in seconds).
            :return: A tuple containing (latitude, longitude) or (None, None) if no results are found or on error.
            :raises: requests.exceptions.RequestException if an HTTP request error occurs.
            """
            try:
                token_url = f"https://kadastr.live/search/{cadnum}/"
                token_headers = requests.structures.CaseInsensitiveDict()
                token_headers["Accept"] = "application/json"
                token_headers['User-Agent'] = 'QGIS Kadastr.Live search plugin/0.1'#'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2810.1 Safari/537.36'
                token_session = requests.session()
                
                token_response = token_session.get(token_url, timeout=timeout)

                token_response.raise_for_status()  # Raise an exception if the request was not successful
                
                respond = json.loads(token_response.text)

                if 'results' in respond and respond['results']:
                    coords = respond['results'][0]['location']
                    latitude = coords[1]
                    longitude = coords[0]
                    area=float(respond['results'][0]['area'])
                    return latitude, longitude, area
                else:
                    print("No results found for the provided cadnum.")
                    self.message_show("Помилка","За даним кадастровим номером ділянок не знайдено!",QMessageBox.Warning)
                    return None, None, None
            except requests.exceptions.RequestException as e:
                print(f"HTTP request error: {e}")
                raise  # Re-raise the exception for handling at a higher level
        
        def zoom_to_coordinates(cadnum):
            # Get latitude and longitude from the provided cadnum
            latitude, longitude, area_value = get_coordinates_from_cadnum(cadnum)
            
            if latitude is not None and longitude is not None:
                # Define the source CRS (WGS 84)
                source_crs = QgsCoordinateReferenceSystem(4326)

                # Get the target CRS from the map canvas
                canvas = self.iface.mapCanvas()
                target_crs = canvas.mapSettings().destinationCrs()

                # Create a coordinate transform
                transform = QgsCoordinateTransform(source_crs, target_crs, QgsProject.instance())

                # Transform the point to the target CRS
                point = QgsPointXY(longitude, latitude)
                #print(point)
                transformed_point = transform.transform(point)

                # Create an extent around the transformed point
                extent = QgsRectangle(transformed_point, transformed_point)
                #print(extent)

                # Set the extent and zoom scale on the map canvas
                canvas.setExtent(extent)
                if area_value < 0.25:
                    canvas.zoomScale(500)
                elif 0.25 <= area_value < 1:
                    canvas.zoomScale(2000)
                else:
                    canvas.zoomScale(10000)
                #canvas.zoomScale(4000)

                # Refresh the map canvas
                self.mark_point(transformed_point)
                canvas.refresh()
                return True
            else:
                return False
        
        def load_kadastr_live():
            """
            Перевіряє чи підключено Kadastr.Live і підключає його якщо не підключено.

            :rtype: bool ісину якщо підключило, неправду - якшо не вже існує
            """
            url='https://cdn.kadastr.live/tiles/maps/kadastr/land_polygons/{z}/{x}/{y}.pbf'
            project = QgsProject.instance()
            for layer in project.mapLayers().values():
                if layer.providerType()=='vectortile':
                    if layer.sourcePath()==url:
                        return True
                      
            vector_tile_layer = QgsVectorTileLayer("type=xyz&url=https://cdn.kadastr.live/tiles/maps/kadastr/land_polygons/{z}/{x}/{y}.pbf", 'Kadastr.Live' )
            vector_tile_layer.loadNamedStyle(os.path.join(os.path.dirname(__file__),"Styles\\Styles.qml"))
            vector_tile_layer.triggerRepaint()
            
            QgsProject.instance().addMapLayer(vector_tile_layer)
            return False

        print(self.cadNum.text())
        load_kadastr_live()
        if self.validate_input(self.cadNum):
            cadnum=self.cadNum.text()
            if not zoom_to_coordinates(cadnum):
                return
        else:   
            self.message_show("Помилка","Введіть правильний кадастровий номер!",QMessageBox.Warning)
            return
        
    def GetArea(self):
        #print('GetArea')
        if self.validate_input(self.cadNum):
            cadnum=self.cadNum.text()
            self.get_area(cadnum,10,True)
            return
        else:   
            layer=self.iface.activeLayer()
            if layer.providerType()=='vectortile':
                if layer.sourcePath()=='https://cdn.kadastr.live/tiles/maps/kadastr/land_polygons/{z}/{x}/{y}.pbf':
                    if layer.selectedFeatureCount()>0:
                        area={}
                        for feature in layer.selectedFeatures():
                            cadnum=feature.attribute('cadnum')
                            area[cadnum]=self.get_area(cadnum,10,False)
                        msg='Площа вибраних ділянок:\r\n'
                        for cadNum in area:
                            msg=msg+cadNum+": "+str(area[cadNum][0])+" "+area[cadNum][1]+"\r\n"                       
                        self.message_show(msg,None,QMessageBox.Warning)
                        return
            self.message_show("Помилка","Введіть правильний кадастровий номер, або виберіть ділянки на карті!",QMessageBox.Warning)
            return
    
