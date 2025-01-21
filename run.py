
from qgis.PyQt.QtCore import QSettings, QTranslator, QCoreApplication, QProcess, QProcessEnvironment, QUrl, QTimer, Qt, QVariant
from qgis.core import QgsCoordinateReferenceSystem, QgsApplication, QgsVectorTileLayer, Qgis, QgsFields, QgsField, QgsJsonUtils, QgsTaskManager
from qgis.PyQt.QtGui import QIcon, QRegularExpressionValidator, QFontMetrics, QValidator, QDesktopServices, QColor
from qgis.PyQt.QtWidgets import *
from qgis.PyQt.QtCore import QRegularExpression as QRegExp
from qgis.gui import QgsMapToolIdentifyFeature, QgsMapToolIdentify, QgsVertexMarker, QgsMessageBar
import requests
import json
from requests.structures import CaseInsensitiveDict
import re
import os
from .customClasses import LoadByExtent

if float(Qgis.QGIS_VERSION[:4])>3.27:
    from qgis.core import QgsSelectionContext
    #from qgis.gui import Qgis


from qgis.core import QgsVectorLayer, QgsFeature, QgsGeometry, QgsPointXY, QgsProject, QgsApplication, QgsRectangle, QgsCoordinateTransform

class KL_Search_bar:
    def get_toolbar(self) -> QToolBar:
        toolbar = self.iface.mainWindow().findChild(QToolBar, 'KL_Serach_bar')
        
        if not toolbar:
            toolbar = self.iface.addToolBar("Пошук по Kadastr.Live")
            toolbar.setObjectName('KL_Serach_bar')
            #toolbar.setToolTip('Панель для отриманні актуальної інформації про земельні ділянки')
        else:
            self.all_toolbar_actions = [action for action in toolbar.actions()]
            for action in self.all_toolbar_actions:
                self.iface.removeToolBarIcon(action)
            #actions = [action for action in toolbar.actions() if action.isVisible()]
            #print(actions)
            #print(toolbar_actions)
        
        return toolbar
    
    def __init__(self, iface):
        self.marker_remove_timer=QTimer()
        self.iface = iface
        self.first_time_flag=True #для виводу повідомлення про необхідність повторного пошуку
        self.prevInput='' 
        self.markers=[]
        self.plugin_dir = os.path.dirname(__file__)
        self.folder_path=os.path.expanduser('~')
        self.actions = []
        self.all_toolbar_actions = []
        self.isRun=None
        
        self.toolbar = self.get_toolbar() 
        self.toolbar.setToolTip("Пошук ділянки на карті Kadastr.Live за кадастровим номером")
        
        self.layers_list={#звідси буде братися меню та посилання на шари
            "Карта земельних ділянок":{"name":"Kadastr.Live-Parcels","url":"https://cdn.kadastr.live/tiles/maps/kadastr/land_polygons/{z}/{x}/{y}.pbf","style":"Parcels.qml"},#цей запис йде на кнопку
            "Природньо-заповідний фонд":{"name":"Kadastr.Live-PZF","url":"https://cdn.kadastr.live/tiles/maps/dzk_pzf/{z}/{x}/{y}.pbf","style":"PZF.qml"},
            "АТУ":{"name":"Kadastr.Live-ATU","url":"https://cdn.kadastr.live/tiles/maps/dzk_atu/{z}/{x}/{y}.pbf","style":"ATU.qml"},
            "Індексна карта":{"name":"Kadastr.Live-IndexMap","url":"https://cdn.kadastr.live/tiles/maps/dzk_index_map/{z}/{x}/{y}.pbf","style":"Index.qml"},
            "Карта водних ресурсів":{"name":"Kadastr.Live-WaterMap","url":"https://cdn.kadastr.live/tiles/maps/dzk_water_map/{z}/{x}/{y}.pbf","style":"Water.qml"},
            "Кадастрова карта":{"name":"Kadastr.Live-DZK","url":"https://cdn.kadastr.live/tiles/maps/kadastr/{z}/{x}/{y}.pbf","style":"Parcels.qml"}            
            }
        
    def initGui(self):
        #Help
        icon = QIcon(os.path.join(self.plugin_dir,"Icon.png"))
        self.help_action = QAction(icon, 'Kadastr.Live Toolbar', self.iface.mainWindow())
        self.iface.pluginHelpMenu().addAction(self.help_action)
        self.help_action.triggered.connect(self.openHelpFile)
        self.actions.append(self.help_action)
        
        #Поле вводу
        self.cadNum = QLineEdit()
        font_metrics=QFontMetrics(self.cadNum.font())
        self.cadNum.setFixedWidth(font_metrics.width('0' * 24))
        self.cadNum.setPlaceholderText("Введіть кадастровий номер...")
        self.cadNum.setValidator(QRegularExpressionValidator(QRegExp("[\d]{10}:[\d]{2}:[\d]{3}:[\d]{4}"),self.toolbar))
        self.cadNum.textEdited.connect(self.handle_input)        
        self.cadnum_action = self.toolbar.addWidget(self.cadNum)
        self.actions.append(self.cadnum_action)

        #Кнопка пошуку
        icon = QIcon(os.path.join(self.plugin_dir,"Icons","Search.png"))
        self.searchParcel = QAction(icon, "Спочатку додайте карту земельних ділянок",self.iface.mainWindow())        
        self.searchParcel.triggered.connect(self.Search)        
        self.searchParcel.setEnabled(False)
        self.toolbar.addAction(self.searchParcel)        
        self.actions.append(self.searchParcel)
        
        # self.searchParcel.setText("Пошук по кадастровому номеру")
        # self.searchParcel.setEnabled(True)
        # self.cadNum.returnPressed.connect(self.Search)
        
        #Кнопка перейти на КЛ
        icon = QIcon(os.path.join(self.plugin_dir,"Icons","KL-go.png"))
        KLgo = QAction(icon, "Подивитися інформацію про введену ділянку на Kadastr.Live",self.iface.mainWindow())
        KLgo.triggered.connect(self.KLgo)
        KLgo.setEnabled(True)
        self.toolbar.addAction(KLgo)        
        self.actions.append(KLgo)
        
        #Кнопка перейти в ДЗК
        icon = QIcon(os.path.join(self.plugin_dir,"Icons","Land-go.png"))
        LandGo = QAction(icon, "Подивитися інформацію про введену ділянку на land.gov.ua",self.iface.mainWindow())
        LandGo.triggered.connect(self.LandGo)
        LandGo.setEnabled(True)
        self.toolbar.addAction(LandGo)        
        self.actions.append(LandGo)
        
        #Конпка показати площу
        icon = QIcon(os.path.join(self.plugin_dir,"Icons","Area.png"))
        GetArea = QAction(icon, "Показати площу введеної ділянки",self.iface.mainWindow())
        GetArea.triggered.connect(self.GetArea)
        GetArea.setEnabled(True)
        self.toolbar.addAction(GetArea)
        self.actions.append(GetArea)
        
        #Кнопка завантажити в межах екрану
        # icon = QIcon(os.path.join(self.plugin_dir,"Icons","Download.png"))
        # LoadExtent = QAction(icon, "Завантажити ділянки в межах екрану в тимчасовий шар",self.iface.mainWindow())
        # LoadExtent.triggered.connect(self.LoadExtent)
        # LoadExtent.setEnabled(True)
        # self.toolbar.addAction(LoadExtent)
        # self.actions.append(LoadExtent)
        # self.LoadExtent=LoadExtent

        #Кнопка шарів з меню
        icon = QIcon(os.path.join(self.plugin_dir,"Icons","Layers.png"))
        self.mapMenu = QMenu()
        #Наповнення меню шарів
        first_flag=True
        for layername in self.layers_list:
            if first_flag:#перший в списку це кнопка
                self.AddParcelsLayer=QAction(icon,layername)
                first_flag=False
            else:                
                self.mapMenu.addAction(layername)
        first_flag=None
        
        self.mapMenu.triggered.connect(self.addLayer)
        self.AddParcelsLayer.triggered.connect(self.addLayer)        
        self.AddParcelsLayer.setMenu(self.mapMenu)        
        self.AddParcelsLayer.setEnabled(True)
        self.toolbar.addAction(self.AddParcelsLayer)
        self.actions.append(self.AddParcelsLayer)
    
        for action in self.all_toolbar_actions:
            self.toolbar.addAction(action)


    def handle_input(self,text):        #дозволяє не заморочуватися з двокрапками при вводі кадастрового
        if len(text)<len(self.prevInput):
            if self.prevInput[-1]==":":
                self.prevInput=text[:-2]
                self.cadNum.backspace()
        else:        
            self.cadNum.insert(':')
        self.prevInput=self.cadNum.text()
    
    def unload(self):
        for action in self.actions:
            self.toolbar.removeAction(action)
        
        if self.help_action:
            self.iface.pluginHelpMenu().removeAction(self.help_action)
            del self.help_action    
        
        del self.toolbar
        self.remove_all_markers()
    
    def openHelpFile(self):        #відкриває хелп
        pdf_file_path = os.path.join(self.plugin_dir,"Help","Help.pdf")  
        print(pdf_file_path)
        QDesktopServices.openUrl(QUrl.fromLocalFile(pdf_file_path))
        # import subprocess
        # subprocess.Popen(['xdg-open', pdf_file_path])
    
    def LoadExtent(self):
        message_bar = self.iface.messageBar()
        
        def status_changed(status):
            if status==3:
                print("Завершено!")
                self.LoadExtent.setText("Завантажити ділянки в межах екрану в тимчасовий шар")
                self.LoadExtent.setIcon(QIcon(os.path.join(self.plugin_dir,"Icons","Download.png")))
            if status==4:
                if task.isCanceled():
                    print("Відмінено!")
                else:
                    if task.get_failure():
                        
                        failure=task.get_failure()
                    else:
                        failure="Помилка, спробуйте ще раз!"
                    message_item = message_bar.pushMessage(failure, Qgis.MessageLevel.Warning, 5)
                    print(failure)
                    print(task.get_last_action())
                self.LoadExtent.setText("Завантажити ділянки в межах екрану в тимчасовий шар")
                self.LoadExtent.setIcon(QIcon(os.path.join(self.plugin_dir,"Icons","Download.png")))

        for task in QgsApplication.taskManager().activeTasks():#якщо завантаження вже запущено - перервати старе завантаження
            if task.description()=="Завантаження ділянок":
                
                task.cancel()
                return
        
        canvas = self.iface.mapCanvas()
        extent=canvas.extent()
        
        geometry=self.transform_geometry(QgsGeometry.fromRect(extent), canvas.mapSettings().destinationCrs(),"4326")#переводимо ексетнт в правильну СК
        
        #перевірка на розмір завантажуваної ділянки
        geometry_for_measuring=self.transform_geometry(QgsGeometry.fromRect(extent), canvas.mapSettings().destinationCrs(),"3857")
        area_km2  = geometry_for_measuring.area()/1000000 
        if area_km2>150 and not self.isControlOrShift():#якщо завеликий масштаб, вивести помилку
            message_item = message_bar.pushMessage("Завелика ділянка для заватаження", Qgis.MessageLevel.Warning, 5)
            return
        else:
            message_item = message_bar.pushMessage("Зачекайте, триває завантаження...", Qgis.MessageLevel.Info, 5)
            self.LoadExtent.setText("Зупинити завантаження")
            self.LoadExtent.setIcon(QIcon(os.path.join(self.plugin_dir,"Icons","Download_cancel.png")))
        
        x1, y1, x2, y2 = geometry.boundingBox().toRectF().getCoords()
        token_url = f"https://kadastr.live/export/{y1}/{x1}/{y2}/{x2}"
        print(token_url)
        
        task = LoadByExtent("Завантаження ділянок", token_url)        
        
        task.statusChanged.connect(status_changed)
        
        QgsApplication.taskManager().addTask(task)
        
        print('Завантажую ділянки...')#без цього прінта не запускається
    
    def addLayer(self, action=False):#додає шар на основі параметру action що містить посилання на кнопку яку натиснули
        if not isinstance(action, QAction):#якщо нічого не передано підміняє на натискання кнопки "додати шар ділянок" 
            action=self.AddParcelsLayer
            self.searchParcel.setText("Пошук по кадастровому номеру")
            self.searchParcel.setEnabled(True)
            self.cadNum.returnPressed.connect(self.Search)        
        
        name=self.layers_list[action.text()]["name"]
        url=self.layers_list[action.text()]["url"]
        style=self.layers_list[action.text()].get("style")
        
        project = QgsProject.instance()
        for layer in project.mapLayers().values():
            if (layer.providerType()=='xyzvectortiles' or layer.providerType()=='vectortile') and layer.sourcePath()==url:                
                print("Шар вже наявний")
                self.first_time_flag=False
                return layer #вихід якшо вже є такий шар                 
        
        layer = QgsVectorTileLayer("type=xyz&url="+url, name)
        if style:
            layer.loadNamedStyle(os.path.join(self.plugin_dir,"Styles",style))
        layer.triggerRepaint()        
        QgsProject.instance().addMapLayer(layer)
        self.first_time_flag=False
        return layer
        
    def select_parcel_layer(self):   #повертає посилання на шар земельних ділянок, якщо він відсутній додає його
        url=self.layers_list[next(iter(self.layers_list))]["url"]
        layer=self.iface.activeLayer()
        if layer and (layer.providerType()=='xyzvectortiles' or layer.providerType()=='vectortile') and layer.sourcePath()==url:#для того аби не ганяти всі шари, якшо вибраний правильний берем його
            self.first_time_flag=False
            return layer
        project = QgsProject.instance()        
            
        for layer in project.mapLayers().values():
            if (layer.providerType()=='xyzvectortiles' or layer.providerType()=='vectortile') and layer.sourcePath()==url:
                self.iface.setActiveLayer(layer)
                self.first_time_flag=False
                return layer
        #Якщо не знайдено шар, додаєм новий
        return self.addLayer()
    
    def transform_geometry(self, geometry, inCRS, outCRS): #функція повертає нову геометрію в цільовій СК
        def get_crs(variable):# Перевірка чи правильна система кординат, якшо ні повертає правильну            
            if isinstance(variable, QgsCoordinateReferenceSystem):
                return variable  # Система вже правильна            
            # можливо введено код системи
            crs_by_name = QgsCoordinateReferenceSystem(variable)
            if crs_by_name.isValid():
                return crs_by_name            
            # можливо введено номер коду
            try:
                crs_code = int(variable)
                crs_by_code = QgsCoordinateReferenceSystem(crs_code)
                if crs_by_code.isValid():
                    return crs_by_code
            except ValueError:
                pass
            
            return None
        
        inCRS=get_crs(inCRS)
        outCRS=get_crs(outCRS)
        
        if not(inCRS and outCRS):
            return None
        if not isinstance(geometry, QgsGeometry):
            return None
        xform = QgsCoordinateTransform(inCRS, outCRS, QgsProject.instance())
        output_geom=QgsGeometry(geometry)
        output_geom.transform(xform)
        return output_geom
    
    def select_parcel(self, latitude, longitude, keep_selection:bool):
        """
        Функція вибирає ділянку на шарі і виводить кількість вибраних ділянок. Якщо входження keep_selection=True, тодіділянка не буде видалятися з виділеного списку.

        :param latitude: широта
        :type latitude: float
        :param longitude: довгота
        :type longitude: float
        :param keep_selection: Флаг що вказує чи треба зберігати виділення
        :type keep_selection: bool
        :return: 
        """
        layer = self.select_parcel_layer()
        
        SFQ=layer.selectedFeatureCount()#Вихідна кількість виділених обєктів 
        if SFQ==1 or keep_selection:
            for feature in layer.selectedFeatures():
                if feature['cadnum']==self.cadNum.text():
                    SFQ=SFQ-1#якшо в нас повторюється пошук, скидаємо вхідну кількість на одну ділянку
        search_geometry = QgsGeometry().fromPointXY(QgsPointXY(longitude, latitude))
        #print(search_geometry)
        print(layer.crs())
        xform = QgsCoordinateTransform(QgsCoordinateReferenceSystem(4326), QgsCoordinateReferenceSystem(3857), QgsProject.instance())
        Xsearch_geometry = QgsGeometry().fromRect(search_geometry.buffer(0.000001, 1).boundingBox())#Point (23.07821245859079795 48.18902231638761435)
        print(Xsearch_geometry)
        Xsearch_geometry.transform(xform)
        print(Xsearch_geometry)
        context = QgsSelectionContext()
        context.setScale(10000)
        
        if keep_selection:
            layer.selectByGeometry(Xsearch_geometry,context, behavior=Qgis.SelectBehavior.AddToSelection)
        else:
            layer.selectByGeometry(Xsearch_geometry,context)
        #print("Виділених об'єктів: "+str(layer.selectedFeatureCount()))
        
        if keep_selection:
            return layer.selectedFeatureCount()>SFQ
        else:
            return layer.selectedFeatureCount()>0
        
    def mark_point(self,point):
        #self.remove_all_markers()
        canvas = self.iface.mapCanvas()
        
        marker2 = QgsVertexMarker(canvas)
        marker2.setCenter(point)
        marker2.setColor(QColor(0, 0, 0))  
        marker2.setPenWidth(8)
        marker2.setIconSize(30)
        marker2.setIconType(QgsVertexMarker.ICON_X)
        self.markers.append(marker2)
        
        marker = QgsVertexMarker(canvas)
        marker.setCenter(point)
        marker.setColor(QColor(250, 220, 0))  
        marker.setPenWidth(3)
        marker.setIconSize(30)
        marker.setIconType(QgsVertexMarker.ICON_X)
        self.markers.append(marker)
        

        # Function to remove the marker
        def remove_marker():
            canvas.scene().removeItem(marker)
            
            if marker in self.markers:
                self.markers.remove(marker)
            canvas.scene().removeItem(marker2)
            if marker2 in self.markers:
                self.markers.remove(marker2)
            self.marker_remove_timer.stop()  # Stop the timer

        # Create a QTimer to remove the marker after 15 seconds (15000 milliseconds)
        self.marker_remove_timer.timeout.connect(remove_marker)
        self.marker_remove_timer.start(15000)  # Start the timer

    def remove_all_markers(self):
        canvas=self.iface.mapCanvas()
        # for marker in canvas.scene().items():
            # if isinstance(marker, QgsVertexMarker):
                # canvas.scene().removeItem(marker)
        for marker in self.markers:
            canvas.scene().removeItem(marker)
        self.markers.clear()
        self.marker_remove_timer.stop()
    
    def get_area(self, cadnum, timeout = 10, show_msg = False):
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
            token_headers['User-Agent'] = 'QGIS Kadastr.Live search plugin/0.7.3.1'
            token_session = requests.session()            
            token_response = token_session.get(token_url, timeout=timeout)
            
            if token_response.status_code==500:
                print("Помилка 500. спроба 2")
                token_response = token_session.get(token_url, timeout=timeout)
                if token_response.status_code==500:
                    print("No results found for the provided cadnum.")
                    self.message_show("Сервер повернув помилку 500","Зачекайте декілька секунд і спробуйте знову.",QMessageBox.Warning)
                    return None, None
            #token_response.raise_for_status()  # Raise an exception if the request was not successful
            
            respond = json.loads(token_response.text)

            if 'results' in respond and respond['results']:
                area_unit = respond['results'][0]['unit_area']
                area=float(respond['results'][0]['area'])
                if show_msg:
                    self.message_show(f"Площа введеної ділянки {cadnum} - {area} {area_unit}",None,QMessageBox.NoIcon)
                return area, area_unit
            else:
                print("No results found for the provided cadnum.")
                self.message_show("Помилка","За даним кадастровим номером ділянок не знайдено!",QMessageBox.Warning)
                return None, None
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
        
    def isControlOrShift(self):
        ctrl_pressed = Qt.ControlModifier & QApplication.keyboardModifiers()
        shift_pressed = Qt.ShiftModifier & QApplication.keyboardModifiers()
            
        if ctrl_pressed or shift_pressed:
            return True
        else:
            return False
    
    def LandGo(self):
        #print('LandGo')
        if self.validate_input(self.cadNum) and not self.isControlOrShift():
            cadnum=self.cadNum.text()
            QDesktopServices.openUrl(QUrl(f"https://e.land.gov.ua/back/cadaster/?cad_num={cadnum}"))
            return
        else:   
            if not float(Qgis.QGIS_VERSION[:4])>3.27:
                print("Весія не пройшла")                
                self.message_show("Відсутня ділянка для перевірки","Введіть правильний кадастровий номер!",QMessageBox.Warning)
                return
            layer=self.iface.activeLayer()
            
            if layer.providerType()=='xyzvectortiles' or layer.providerType()=='vectortile' :
                if layer.sourcePath()=='https://cdn.kadastr.live/tiles/maps/kadastr/land_polygons/{z}/{x}/{y}.pbf' and layer.selectedFeatureCount()>0:
                    for feature in layer.selectedFeatures():
                        cadnum=feature.attribute('cadnum')
                        QDesktopServices.openUrl(QUrl(f"https://e.land.gov.ua/back/cadaster/?cad_num={cadnum}"))
                    return
            
            elif layer.providerType() == 'ogr' and type(layer) is QgsVectorLayer:
                for feature in layer.selectedFeatures():
                    cadnum=feature.attribute('cadnum')
                    QDesktopServices.openUrl(QUrl(f"https://e.land.gov.ua/back/cadaster/?cad_num={cadnum}"))
                return
                
            elif layer.providerType() == 'memory':
                field_names = [field.name() for field in layer.fields()]
                if 'cadnum' in field_names and layer.selectedFeatureCount()>0:                  
                    for feature in layer.selectedFeatures():
                        cadnum=feature.attribute('cadnum')
                        QDesktopServices.openUrl(QUrl(f"https://e.land.gov.ua/back/cadaster/?cad_num={cadnum}"))
                    return
            
            self.message_show("Помилка","Введіть правильний кадастровий номер, або виберіть ділянки на карті!",QMessageBox.Warning)
            return
    
    def KLgo(self):
        #print('KLgo')
        if self.validate_input(self.cadNum) and not self.isControlOrShift():
            cadnum=self.cadNum.text()
            QDesktopServices.openUrl(QUrl(f"https://kadastr.live/parcel/{cadnum}"))
            return
        else:   
            if not float(Qgis.QGIS_VERSION[:4])>3.27:
                print("Весія не пройшла")                
                self.message_show("Відсутня ділянка для перевірки","Введіть правильний кадастровий номер!",QMessageBox.Warning)
                return
            layer=self.iface.activeLayer()
            if layer.providerType()=='xyzvectortiles' or layer.providerType()=='vectortile':
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
                token_headers['User-Agent'] = 'QGIS Kadastr.Live search plugin/0.7.3.1'
                token_session = requests.session()
                
                token_response = token_session.get(token_url, timeout=timeout)

                #token_response.raise_for_status()  # Raise an exception if the request was not successful
                print(token_response.status_code)
                if token_response.status_code==500:
                    print("Помилка 500. спроба 2")
                    token_response = token_session.get(token_url, timeout=timeout)
                    if token_response.status_code==500:
                        print("No results found for the provided cadnum.")
                        self.message_show("Сервер повернув помилку 500","Зачекайте декілька секунд і спробуйте знову.",QMessageBox.Warning)
                        return None, None, None
                
                respond = json.loads(token_response.text)

                if 'results' in respond and respond['results']:
                    coords = respond['results'][0]['location']
                    latitude = coords[1]
                    longitude = coords[0]
                    area=float(respond['results'][0]['area'])
                    return latitude, longitude, area
                else:
                    print("No results found for the provided cadnum.")
                    #self.message_show("Помилка","За даним кадастровим номером ділянок не знайдено!",QMessageBox.Warning)
                    return None, None, None
            except requests.exceptions.RequestException as e:
                print(f"HTTP request error: {e}")
                raise  # Re-raise the exception for handling at a higher level
        
        def go_to_coordinates(latitude, longitude, area=0.25):#Для версії з хрестиками
            # Get latitude and longitude from the provided cadnum
            area_value=0.25
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
                
                
                #canvas.zoomScale(4000)

                # Refresh the map canvas
                self.mark_point(transformed_point)
                #self.select_parcel(QgsGeometry().fromPointXY(QgsPointXY(longitude,latitude)),False)
                canvas.refresh()
                if area==0:
                    return True
                    
                canvas.setExtent(extent)
                if area_value < 0.25:
                    canvas.zoomScale(500)
                elif 0.25 <= area_value < 1:
                    canvas.zoomScale(2000)
                else:
                    canvas.zoomScale(10000)
                    
                return True
            else:
                return False
        
        if self.validate_input(self.cadNum):
            cadnum=self.cadNum.text()
            
            latitude, longitude, area = get_coordinates_from_cadnum(cadnum)
            
            layer = self.select_parcel_layer()
            
            canvas = self.iface.mapCanvas()
            #canvas.zoomToSelected(layer)
            
            canvas.zoomScale(10000)
            
            if not latitude:
                self.message_show("Не вдалося знайти ділянку з даним кадастровим номером.","Можливо кадастровий номер відсутній, або наявні проблеми з доступом до сервісу Kadastr.live. Перевірте кадастровий номер, і спробуйте ще раз.",QMessageBox.Warning)
                return None
            
            if not float(Qgis.QGIS_VERSION[:4])>3.27:
                print("Весія не пройшла")                
                go_to_coordinates(latitude, longitude, area)
                return
            else:
                go_to_coordinates(latitude, longitude, 0)
            
            if self.isControlOrShift():
                result=self.select_parcel(latitude, longitude, keep_selection=True)
            else:
                result=self.select_parcel(latitude, longitude, keep_selection=False)
            
            if result:
                selected_features = layer.selectedFeatures()
                print(selected_features[0]['cadnum'])                 
                canvas.zoomToSelected(layer)
                if self.first_time_flag:
                    message_bar = self.iface.messageBar()
                    message_item = message_bar.pushMessage("Натисніть пошук ще раз!", Qgis.MessageLevel.Info, 5)
                    self.first_time_flag=False
                
                canvas.zoomScale(canvas.scale()*3)
                print(canvas.scale())
            else:
                self.message_show("Не вдалося перейти до ділянки!","Спробуйте натиснути пошук ще раз, або наблизитися до зони пошуку.",QMessageBox.Warning)
            # if not zoom_to_coordinates(cadnum):
                # return
        else:
            self.message_show("Введіть правильний кадастровий номер!", "Можливо поле вводу пусте або не заповнене до кінця", QMessageBox.Warning)
            return
        
    def GetArea(self):
        #print('GetArea')
        if self.validate_input(self.cadNum) and not self.isControlOrShift():
            cadnum=self.cadNum.text()
            self.get_area(cadnum,10,True)
            return
        else:
            if not float(Qgis.QGIS_VERSION[:4])>3.27:
                print("Весія не пройшла")                
                self.message_show("Відсутня ділянка для перевірки","Введіть правильний кадастровий номер!",QMessageBox.Warning)
                return
            
            layer = self.select_parcel_layer()
            
            if layer.selectedFeatureCount()>0:
                area={}
                total_area=0
                for feature in layer.selectedFeatures():
                    cadnum=feature.attribute('cadnum')
                    area[cadnum]=self.get_area(cadnum,10,False)
                    total_area=total_area+area[cadnum][0]
                msg='Площа для вибраних ділянок:\r\n\r\n'
                for cadNum in area:
                    msg=msg+cadNum+" - "+str(area[cadNum][0])+" "+area[cadNum][1]+"\r\n"                       
                self.message_show(msg+"\r\nЗагальна площа вибраних ділянок - "+str(round(total_area,4))+" га",None,QMessageBox.NoIcon)
                return
            self.message_show("Відсутні ділянки для перевірки","Введіть правильний кадастровий номер, або виберіть ділянки на карті!",QMessageBox.Warning)
            return
    
