
from qgis.PyQt.QtCore import QSettings, QTranslator, QCoreApplication, QProcess, QProcessEnvironment, QUrl, QTimer, Qt, QVariant
from qgis.core import QgsCoordinateReferenceSystem, QgsApplication, QgsVectorTileLayer, Qgis, QgsFields, QgsField, QgsJsonUtils, QgsTaskManager
from qgis.PyQt.QtGui import QIcon, QRegularExpressionValidator, QFontMetrics, QValidator, QDesktopServices, QColor
from qgis.PyQt.QtWidgets import *
from qgis.PyQt.QtCore import QRegularExpression as QRegExp
from qgis.gui import QgsMapToolIdentifyFeature, QgsMapToolIdentify, QgsVertexMarker, QgsMessageBar, QgsMapCanvas
import requests
import json
from requests.structures import CaseInsensitiveDict
import re
import os
from .customClasses import LoadByExtent
from typing import cast

if float(Qgis.QGIS_VERSION[:4])>3.27:
    from qgis.core import QgsSelectionContext


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
    
    def get_QGIS_ver(self):
        ver1, ver2, ver3 = Qgis.QGIS_VERSION.split('-')[0].split('.')
        if len(ver2)==1:
            ver2=f'0{ver2}'
        if len(ver3)==1:
            ver3=f'0{ver3}'
        return float(f'{ver1}.{ver2}{ver3}')

    def __init__(self, iface):
        self.marker_remove_timer=QTimer()
        self.iface = iface

        self.QVersion = self.get_QGIS_ver()

        self.prevInput='' 
        self.markers=[]
        self.plugin_dir = os.path.dirname(__file__)
        self.folder_path=os.path.expanduser('~')
        self.actions = []
        self.all_toolbar_actions = []
        
        self.toolbar = self.get_toolbar() 
        self.toolbar.setToolTip("Пошук ділянки на карті Kadastr.Live за кадастровим номером")
        
        self.layers_list={#звідси буде братися меню та посилання на шари
            "Карта земельних ділянок":{"name":"Kadastr.Live-Parcels","url":"https://cdn.kadastr.live/tiles/maps/kadastr/land_polygons/{z}/{x}/{y}.pbf","style":"Parcels.qml","extent":(2419945,4501250,5484118,6867501)},#цей запис йде на кнопку
            "АТУ":{"name":"Kadastr.Live-ATU","url":"https://cdn.kadastr.live/tiles/maps/dzk_atu/{z}/{x}/{y}.pbf","style":"ATU.qml","extent":(2419945,4501250,5484118,6867501)},
            "Індексна карта":{"name":"Kadastr.Live-IndexMap","url":"https://cdn.kadastr.live/tiles/maps/dzk_index_map/{z}/{x}/{y}.pbf","style":"Index.qml","extent":(2419945,4501250,5484118,6867501)},
            "Кадастрова карта":{"name":"Kadastr.Live-DZK","url":"https://cdn.kadastr.live/tiles/maps/kadastr/{z}/{x}/{y}.pbf","style":"Parcels.qml","extent":(2419945,4501250,5484118,6867501)},
            "sep0":{"name":"*"},
            "Природньо-заповідний фонд":{"name":"Kadastr.Live-PZF","url":"https://cdn.kadastr.live/tiles/maps/dzk_pzf/{z}/{x}/{y}.pbf","style":"PZF.qml","extent":(2419945,4501250,5484118,6867501)},
            "Карта водних ресурсів":{"name":"Kadastr.Live-WaterMap","url":"https://cdn.kadastr.live/tiles/maps/dzk_water_map/{z}/{x}/{y}.pbf","style":"Water.qml","extent":(2419945,4501250,5484118,6867501)},
            "Sep1":{"name":"*"},
            "Функц. призначення м.Київ":{"name":"Kadastr.Live-Kyiv_Func","url":"https://vector.kadastr.live/maps/dani-mistobudivnogo-kadastru-misto-kiiv/{z}/{x}/{y}.pbf","style":"Kyiv_Func.qml", "extent":(3370113,3422430,6490174,6540480)},
            "Функц. призначення м.Житомир":{"name":"Kadastr.Live-Zhutomir_Func","url":"https://vector.kadastr.live/maps/dani-mistobudivnogo-kadastru-misto-zhitomir/{z}/{x}/{y}.pbf","style":"Zhutomir_Func.qml","extent":(3178527,3204686,6477354,6502507)},
            "Функц. призначення м.Хмельницький":{"name":"Kadastr.Live-Khmelnitskii_Func","url":"https://vector.kadastr.live/maps/dani-mistobudivnogo-kadastru-misto-khmelnitskii/{z}/{x}/{y}.pbf","style":"Khmelnitskii_Func.qml","extent":(2992135,3018294,6332537,6357690)},
            "Функц. призначення м.Рівне":{"name":"Kadastr.Live-Rivne_Func","url":"https://vector.kadastr.live/maps/dani-mistobudivnogo-kadastru-misto-rivne/{z}/{x}/{y}.pbf","style":"Rivne_Func.qml","extent":(2909552,2933279,6541101,6563916)},
            }
        
    def initGui(self):
        #Help
        icon = QIcon(os.path.join(self.plugin_dir,"Icon.png"))
        self.help_action = QAction(icon, 'Kadastr.Live Toolbar', self.iface.mainWindow())
        self.iface.pluginHelpMenu().addAction(self.help_action)
        self.help_action.triggered.connect(self.openHelpFile)
        self.actions.append(self.help_action)
        
        #Поле вводу
        self.cadNum = QLineEdit(self.toolbar)
        font_metrics=QFontMetrics(self.cadNum.font())
        self.cadNum.setFixedWidth(font_metrics.width('0' * 24))
        self.cadNum.setPlaceholderText("Введіть кадастровий номер...")
        self.cadNum.setValidator(QRegularExpressionValidator(QRegExp("[\d]{10}:[\d]{2}:[\d]{3}:[\d]{4}"),self.toolbar))
        self.cadNum.textEdited.connect(self.handle_input)
        self.cadNum.returnPressed.connect(self.Search)
        self.cadnum_action = self.toolbar.addWidget(self.cadNum)
        self.actions.append(self.cadnum_action)

        #Кнопка пошуку
        icon = QIcon(os.path.join(self.plugin_dir,"Icons","Search.png"))
        self.searchParcel = QAction(icon, "Пошук по кадастровому номеру", self.iface.mainWindow())        
        self.searchParcel.triggered.connect(self.Search)
        self.searchParcel.setEnabled(True)
        self.toolbar.addAction(self.searchParcel)        
        self.actions.append(self.searchParcel)
        
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
        GetArea = QAction(icon, "Показати площу введеної ділянки", self.iface.mainWindow())
        GetArea.triggered.connect(self.GetArea)
        GetArea.setEnabled(True)
        self.toolbar.addAction(GetArea)
        self.actions.append(GetArea)
        
        #Кнопка завантажити в межах екрану
        icon = QIcon(os.path.join(self.plugin_dir,"Icons","Download.png"))
        LoadExtent = QAction(icon, "Завантажити ділянки в межах екрану в тимчасовий шар", self.iface.mainWindow())
        LoadExtent.triggered.connect(self.LoadExtent)
        LoadExtent.setEnabled(True)
        self.toolbar.addAction(LoadExtent)
        self.actions.append(LoadExtent)
        self.LoadExtent=LoadExtent

        #Кнопка шарів з меню
        icon = QIcon(os.path.join(self.plugin_dir,"Icons","Layers.png"))
        self.mapMenu = QMenu(self.toolbar)
        #Наповнення меню шарів
        first_flag=True
        for layername in self.layers_list:
            if first_flag:#перший в списку це кнопка
                self.AddParcelsLayer=QAction(icon,layername)
                first_flag=False
            else:                
                if self.layers_list[layername]["name"]=='*':
                    self.mapMenu.addSeparator()
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

    #дозволяє не заморочуватися з двокрапками при вводі кадастрового
    def handle_input(self,text):
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
        QDesktopServices.openUrl(QUrl.fromLocalFile(pdf_file_path))
    
    def LoadExtent(self):
        message_bar = self.iface.messageBar()
        
        def status_changed(status):
            if status==3:
                message_bar.pushMessage("Успішно!", "Завантаження ділянок завершено!",Qgis.MessageLevel.Success, 5)
                
                self.LoadExtent.setText("Завантажити ділянки в межах екрану в тимчасовий шар")
                self.LoadExtent.setIcon(QIcon(os.path.join(self.plugin_dir,"Icons","Download.png")))
            if status==4:
                if self.task.isCanceled():
                    message_bar.pushMessage("Відмінено!", "Завантаження ділянок відмінено користувачем!",Qgis.MessageLevel.Info, 5)
                else:
                    if self.task.get_failure():
                        failure=self.task.get_failure()
                    else:
                        failure="Помилка, спробуйте ще раз!"
                    message_bar.pushMessage(failure, Qgis.MessageLevel.Warning, 5)
                    
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
        
        self.task = LoadByExtent("Завантаження ділянок", token_url)        
        
        self.task.statusChanged.connect(status_changed)
        
        QgsApplication.taskManager().addTask(self.task)
    
    def addLayer(self, action=False):#додає шар на основі параметру action що містить посилання на кнопку яку натиснули
        if not isinstance(action, QAction):#якщо нічого не передано підміняє на натискання кнопки "додати шар ділянок" 
            action=self.AddParcelsLayer
            self.searchParcel.setText("Пошук по кадастровому номеру")
            self.searchParcel.setEnabled(True)
            self.cadNum.returnPressed.connect(self.Search)        
        
        name = self.layers_list[action.text()]["name"]
        url = self.layers_list[action.text()]["url"]
        style = self.layers_list[action.text()].get("style")
        extent = self.layers_list[action.text()].get("extent")
        
        project = QgsProject.instance()
        for layer in project.mapLayers().values():
            if type(layer)==QgsVectorTileLayer and layer.sourcePath()==url:                
                self.iface.messageBar().pushMessage(f"Шар «{name}» вже наявний в проекті!", Qgis.Warning, 5)
                
                self.iface.setActiveLayer(layer)
                project.layerTreeRoot().findLayer(layer.id()).setItemVisibilityChecked(True)

                crsDest = self.iface.mapCanvas().mapSettings().destinationCrs()
                transform = QgsCoordinateTransform(QgsCoordinateReferenceSystem(3857), crsDest, project)
                l_extent = layer.extent()
                l_extent = transform.transformBoundingBox(l_extent)
                if not l_extent.contains(self.iface.mapCanvas().extent()):
                    self.iface.mapCanvas().setExtent(l_extent)
                layer.triggerRepaint()
                return layer #вихід якшо вже є такий шар
        
        layer = QgsVectorTileLayer("type=xyz&url="+url, name)
        if style:
            
            if self.QVersion<=3.2810:
                style27 = style.replace(".qml","_27.qml")
                style_file = os.path.join(self.plugin_dir,"Styles",style27)
                if os.path.exists(style_file):
                    layer.loadNamedStyle(style_file)
                else:
                    layer.loadNamedStyle(os.path.join(self.plugin_dir,"Styles",style))
            else:
                layer.loadNamedStyle(os.path.join(self.plugin_dir,"Styles",style))
        if extent:
            layer.setExtent(QgsRectangle(extent[0],extent[2],extent[1],extent[3]))

            crsDest = self.iface.mapCanvas().mapSettings().destinationCrs()
            transform = QgsCoordinateTransform(QgsCoordinateReferenceSystem(3857), crsDest, project)
            
            l_extent = transform.transformBoundingBox(layer.extent())
            if not l_extent.contains(self.iface.mapCanvas().extent()):
                    self.iface.mapCanvas().setExtent(l_extent)
        
        QgsProject.instance().addMapLayer(layer)
        layer.triggerRepaint()        
        return layer
        
    def select_parcel_layer(self):   #повертає посилання на шар земельних ділянок, якщо він відсутній додає його
        url=self.layers_list[next(iter(self.layers_list))]["url"]
        layer=self.iface.activeLayer()
        project = QgsProject.instance()

        if layer and (layer.providerType()=='xyzvectortiles' or layer.providerType()=='vectortile') and layer.sourcePath()==url:#для того аби не ганяти всі шари, якшо вибраний правильний берем його
            project.layerTreeRoot().findLayer(layer.id()).setItemVisibilityChecked(True)
            return layer
            
        for layer in project.mapLayers().values():
            if (layer.providerType()=='xyzvectortiles' or layer.providerType()=='vectortile') and layer.sourcePath()==url:
                self.iface.setActiveLayer(layer)
                project.layerTreeRoot().findLayer(layer.id()).setItemVisibilityChecked(True)
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
        output_geom = QgsGeometry(geometry)
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
        
        xform = QgsCoordinateTransform(QgsCoordinateReferenceSystem(4326), QgsCoordinateReferenceSystem(3857), QgsProject.instance())
        Xsearch_geometry = QgsGeometry().fromRect(search_geometry.buffer(0.000001, 1).boundingBox())#Point (23.07821245859079795 48.18902231638761435)
        
        Xsearch_geometry.transform(xform)
        context = QgsSelectionContext()
        context.setScale(5000)
        
        if keep_selection:
            layer.selectByGeometry(Xsearch_geometry,context, behavior=Qgis.SelectBehavior.AddToSelection)
        else:
            layer.selectByGeometry(Xsearch_geometry,context)
        
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
                    self.iface.messageBar().pushMessage("Помилка","Сервер повернув помилку 500. Зачекайте декілька секунд і спробуйте знову.", level=Qgis.Warning, duration=5)
                    return None, None
            
            respond = json.loads(token_response.text)

            if 'results' in respond and respond['results']:
                area_unit = respond['results'][0]['unit_area']
                area=float(respond['results'][0]['area'])
                if show_msg:
                    self.message_show(f"Площа введеної ділянки {cadnum} - {area} {area_unit}",None,QMessageBox.NoIcon)
                return area, area_unit
            else:
                self.iface.messageBar().pushMessage("Помилка", "За даним кадастровим номером ділянок не знайдено!", level=Qgis.Warning, duration=5)
                return None, None
        except requests.exceptions.RequestException as e:
            self.iface.messageBar().pushMessage("Kadastr.Live: HTTP Error", str(e), level=Qgis.Critical, duration=10)
            return None, None
    
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
        if self.validate_input(self.cadNum) and not self.isControlOrShift():
            cadnum=self.cadNum.text()
            QDesktopServices.openUrl(QUrl(f"https://e.land.gov.ua/back/cadaster/?cad_num={cadnum}"))
            return
        else:   
            if not self.QVersion>3.27:      
                self.iface.messageBar().pushMessage("Відсутня ділянка для перевірки","Введіть правильний кадастровий номер!", level=Qgis.Warning, duration=5)
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
            
            self.iface.messageBar().pushMessage("Помилка", "Введіть правильний кадастровий номер, або виберіть ділянки на карті!", level=Qgis.Warning)
            return
    
    def KLgo(self):
        #print('KLgo')
        if self.validate_input(self.cadNum) and not self.isControlOrShift():
            cadnum=self.cadNum.text()
            QDesktopServices.openUrl(QUrl(f"https://kadastr.live/parcel/{cadnum}"))
            return
        else:   
            if not self.QVersion>3.27:
                print("Весія не пройшла")                
                self.iface.messageBar().pushMessage("Відсутня ділянка для перевірки","Введіть правильний кадастровий номер!", level=Qgis.Warning, duration=5)
                return
            layer=self.iface.activeLayer()
            if layer.providerType()=='xyzvectortiles' or layer.providerType()=='vectortile':
                if layer.sourcePath()=='https://cdn.kadastr.live/tiles/maps/kadastr/land_polygons/{z}/{x}/{y}.pbf':
                    if layer.selectedFeatureCount()>0:
                        for feature in layer.selectedFeatures():
                            cadnum=feature.attribute('cadnum')
                            QDesktopServices.openUrl(QUrl(f"https://kadastr.live/parcel/{cadnum}"))
                        return
            self.iface.messageBar().pushMessage("Помилка","Введіть правильний кадастровий номер, або виберіть ділянки на карті!", level=Qgis.Warning, duration=5)
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
                
                if token_response.status_code==500:
                    print("Помилка 500. спроба 2")
                    token_response = token_session.get(token_url, timeout=timeout)
                    if token_response.status_code==500:
                        self.iface.messageBar().pushMessage("Помилка 500","Зачекайте декілька секунд і спробуйте знову.", Qgis.Warning, 5)
                        return None, None, None
                
                respond = json.loads(token_response.text)

                if 'results' in respond and respond['results']:
                    coords = respond['results'][0]['location']
                    latitude = coords[1]
                    longitude = coords[0]
                    area=float(respond['results'][0]['area'])
                    return latitude, longitude, area
                else:
                    
                    return None, None, None
            except requests.exceptions.RequestException as e:
                self.iface.messageBar().pushMessage("Kadastr.Live: HTTP Error", str(e), level=Qgis.Critical, duration=10)
                return None, None, None
        
        def go_to_coordinates(latitude, longitude, area = 0.25):#Для версії з хрестиками
            
            latitude, longitude, area_value = get_coordinates_from_cadnum(cadnum)
            
            if latitude is  None or longitude is  None:
                return False
            
            source_crs = QgsCoordinateReferenceSystem(4326)
            
            canvas = self.iface.mapCanvas()
            canvas.refresh()
            target_crs = canvas.mapSettings().destinationCrs()
            
            transform = QgsCoordinateTransform(source_crs, target_crs, QgsProject.instance())
            point = QgsPointXY(longitude, latitude)
            transformed_point = transform.transform(point)
            extent = QgsRectangle(transformed_point, transformed_point)
            
            self.mark_point(transformed_point)
            
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
        
        def go_to_selection(layer, latitude, longitude, area = 0.25):
            go_to_coordinates(latitude, longitude, 0)#чисто щоб хрестик поставило
            canvas = self.iface.mapCanvas()
            canvas.zoomToSelected(layer)
            canvas.zoomScale(canvas.scale()*3)

        if self.validate_input(self.cadNum):
            cadnum=self.cadNum.text()
            
            latitude, longitude, area = get_coordinates_from_cadnum(cadnum)
            
            layer = self.select_parcel_layer()
            
            if not latitude or not longitude:
                self.iface.messageBar().pushMessage("Помилка", "Не вдалося знайти ділянку з даним кадастровим номером. Можливо кадастровий номер відсутній, або наявні проблеми з доступом до сервісу Kadastr.live. Перевірте кадастровий номер, і спробуйте ще раз.", Qgis.Warning, 10)
                return None
            
            if not self.QVersion>3.27:
                print("Весія не пройшла")                
                go_to_coordinates(latitude, longitude, area)
                return

            if self.isControlOrShift():
                result=self.select_parcel(latitude, longitude, keep_selection=True)
            else:
                result=self.select_parcel(latitude, longitude, keep_selection=False)
            
            if result:
                QTimer.singleShot(100, lambda: go_to_selection(layer, latitude, longitude, area))
            else:
                self.iface.messageBar().pushMessage("Не вдалося перейти до ділянки!", "Спробуйте натиснути пошук ще раз, або наблизитися до зони пошуку.", level=Qgis.Warning, duration=5)
        else:
            self.iface.messageBar().pushMessage("Неправильний кадастровий номер!", "Введіть правильний кадастровий номер! Можливо поле вводу пусте або не заповнене до кінця", level=Qgis.Warning, duration=5)
            return
        
    def GetArea(self):
        #print('GetArea')
        if self.validate_input(self.cadNum) and not self.isControlOrShift():
            cadnum=self.cadNum.text()
            self.get_area(cadnum,10,True)
            return
        else:
            if not self.QVersion>3.27:             
                self.iface.messageBar().pushMessage("Відсутня ділянка для перевірки", "Введіть правильний кадастровий номер!", Qgis.Warning, 5)
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
            self.iface.messageBar().pushMessage("Відсутні ділянки для перевірки", "Введіть правильний кадастровий номер, або виберіть ділянки на карті!", level=Qgis.Warning, duration=5)
            return
    
