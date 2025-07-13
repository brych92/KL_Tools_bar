
from qgis.PyQt.QtCore import QSettings, QTranslator, QCoreApplication, QProcess, QProcessEnvironment, QUrl, QTimer, Qt, QVariant
from qgis.core import QgsCoordinateReferenceSystem, QgsApplication, QgsVectorTileLayer, QgsRasterLayer, Qgis, QgsMapLayer, QgsFields, QgsField, QgsJsonUtils, QgsTaskManager
from qgis.core import QgsVectorLayer, QgsFeature, QgsGeometry, QgsPointXY, QgsProject, QgsApplication, QgsRectangle, QgsCoordinateTransform
from qgis.PyQt.QtGui import QIcon, QRegularExpressionValidator, QFontMetrics, QValidator, QDesktopServices, QColor
from qgis.PyQt.QtWidgets import *
from qgis.PyQt.QtCore import QRegularExpression as QRegExp
from qgis.gui import QgsMapToolIdentifyFeature, QgsMapToolIdentify, QgsVertexMarker, QgsMessageBar, QgsMapCanvas

import requests, socket
from requests import Session, Request
from urllib3.util.retry import Retry
from requests.adapters import HTTPAdapter

import json
from requests.structures import CaseInsensitiveDict
import re
import os
from .customClasses import LoadByExtent, MultiLineInputDialog, BatchSearchTask
from typing import cast

if float(Qgis.QGIS_VERSION[:4])>3.27: # type: ignore
    from qgis.core import QgsSelectionContext

from .sidefunctions import get_toolbar, get_QGIS_ver, get_plugin_version, \
    getUpdatedUrls, log, transform_geometry, get_base_url, save_base_url

        

class KL_Search_bar:
    def __init__(self, iface):
        self.iface = iface
        self.pluginName = 'KL Search bar'
        self.mBar: QgsMessageBar = self.iface.messageBar()
        

        self.plugin_dir = os.path.dirname(__file__)
        self.folder_path = os.path.expanduser('~')

        self.session = self.getSession()
        self.noConnection = False
        self.baseurl = get_base_url()
        self.don_not_update_connection = False

        self.QVersion = get_QGIS_ver()
        self.PluginVersion = get_plugin_version()

        self.batchSearchTask = None #заглушка під таск пакетниого пошуку

        self.prevInput = '' 
        self.marker_remove_timer = QTimer() #таймер для видалення маркерів
        self.markers = []
        
        self.warned = False #попередження в першому виклику за пакетний пошук  

        self.actions = []
        self.all_toolbar_actions = []
        
        self.toolbar = get_toolbar(self)
        self.toolbar.setToolTip("Пошук ділянки на карті Kadastr.Live за кадастровим номером\nКлацніть двічі для пакетного пошуку")        
        
        self.layers_dict = getUpdatedUrls(self.baseurl)
        
    def initGui(self):
        #Help
        icon = QIcon(os.path.join(self.plugin_dir,"Icon.png"))
        self.help_action = QAction(icon, 'Kadastr.Live Toolbar', self.iface.mainWindow())
        self.iface.pluginHelpMenu().addAction(self.help_action)
        self.help_action.triggered.connect(self.openHelpFile)
        self.actions.append(self.help_action)
        
        #Поле вводу
        self.cadNum = QLineEdit(self.toolbar)
        font_metrics = QFontMetrics(self.cadNum.font())
        self.cadNum.setFixedWidth(font_metrics.width('0' * 24))
        self.cadNum.setPlaceholderText("Введіть кадастровий номер...")
        self.cadNum.setValidator(QRegularExpressionValidator(QRegExp("[\d]{10}:[\d]{2}:[\d]{3}:[\d]{4}"),self.toolbar))
        self.cadNum.textEdited.connect(self.handle_input)
        self.cadNum.returnPressed.connect(self.Search)
        self.cadNum.mouseDoubleClickEvent = lambda a0: self.batch_search()
        self.cadnum_action = self.toolbar.addWidget(self.cadNum)
        self.actions.append(self.cadnum_action)

        #Кнопка пошуку
        icon = QIcon(os.path.join(self.plugin_dir,"Icons","Search.png"))
        self.SearchWindows_icon = icon
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
        
        #Кнопка перейти в e-constructio
        icon = QIcon(os.path.join(self.plugin_dir,"Icons","E-constr.png"))
        buildGO = QAction(icon, "Подивитися інформацію про введену ділянку на e-construction.gov.ua",self.iface.mainWindow())
        buildGO.triggered.connect(self.BuildGo)
        buildGO.setEnabled(True)
        self.toolbar.addAction(buildGO)        
        self.actions.append(buildGO)

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
        LoadExtent.triggered.connect(self.LoadByExtent)
        LoadExtent.setEnabled(True)
        self.toolbar.addAction(LoadExtent)
        self.actions.append(LoadExtent)
        self.LoadExtent=LoadExtent

        #Наповнення меню шарів
        icon = QIcon(os.path.join(self.plugin_dir,"Icons","Layers.png"))
        self.mapMenu = QMenu(self.toolbar)
        
        self.AddParcelsLayer=QAction(icon, next(iter(self.layers_dict.keys())))
        for layername in list(self.layers_dict.keys())[1:]:
            if self.layers_dict[layername]["name"]=='*':
                self.mapMenu.addSeparator()
            else:
                self.mapMenu.addAction(layername)
        
        self.mapMenu.triggered.connect(self.addLayer)
        self.AddParcelsLayer.triggered.connect(self.addLayer)
        self.AddParcelsLayer.setMenu(self.mapMenu)
        self.toolbar.addAction(self.AddParcelsLayer)
        self.actions.append(self.AddParcelsLayer)
    
        for action in self.all_toolbar_actions:
            self.toolbar.addAction(action)
    
    def getSession(self):
        '''Повертає сесію з налаштуваннями для KL API'''
        retry = Retry(
            total=3,                # до 5 спроб на всі помилки
            connect=2, read=2,      # окремі ліміти на конект/читання
            backoff_factor=0.5,     # 0.5 s, 1 s, 2 s…
            status_forcelist=[429, 500, 502, 503, 504],
            allowed_methods=["GET"],    # тільки GET
            respect_retry_after_header=True,
        )

        session = Session()
        session.mount('https://', HTTPAdapter(max_retries = retry)) # type: ignore
        session.headers.update(
            {
                "Accept": "application/json",
                "User-Agent": f"QGIS Kadastr.Live search plugin/{get_plugin_version()}"}
        )
        
        return session
    
    def getBaseUrl(self) -> str:
        '''
        Повертає базовий URL сервісу, який можна використовувати для пошуку
        При помилці доступу повертає None
        '''
        urls = ["https://kadastr.live", "https://kadastr.space"]
    
        for url in urls:
            try:
                response = self.session.get(url+"/about", timeout=5)
                if response.status_code == 200:
                    log(f"Доступ до сервісу отримано через: {url}", 0)
                    return url.split("//")[1]
            
            except requests.RequestException:
                pass
        log("Не вдалося отримати доступ до сервісу KL, перевірте налаштування мережі, або спробуйте VPN", 2)
                
        return None 

    def handle_input(self,text):
        """
        дозволяє не заморочуватися з двокрапками при вводі кадастрового номера
        
        функція викликається при кожному натисканні на клавішу при вводі кадастрового номера
        і додає двокрапку, якщо це необхідно
        """
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
    
    def openHelpFile(self):
        """Відкриває хелп файл, що знаходиться в папці з плагіном"""
        pdf_file_path = os.path.join(self.plugin_dir,"Help","Help.pdf")
        QDesktopServices.openUrl(QUrl.fromLocalFile(pdf_file_path))
    
    def LoadByExtent(self) -> None:
        """Завантажує ділянки в межах екрану в тимчасовий шар"""
        message_bar:QgsMessageBar = self.iface.messageBar()
        
        def status_changed(status):
            if status==3:
                message_bar.pushSuccess(self.pluginName, "Завантаження ділянок завершено!")
                
                self.LoadExtent.setText("Завантажити ділянки в межах екрану в тимчасовий шар")
                self.LoadExtent.setIcon(QIcon(os.path.join(self.plugin_dir,"Icons","Download.png")))
            if status==4:
                if self.task.isCanceled():
                    message_bar.pushInfo(self.pluginName, "Завантаження ділянок відмінено користувачем!")
                else:
                    if self.task.get_failure() != '':
                        failure=self.task.get_failure()
                    else:
                        failure="Помилка, спробуйте ще раз!"
                    message_bar.pushWarning(self.pluginName, failure)
                    
                self.LoadExtent.setText("Завантажити ділянки в межах екрану в тимчасовий шар")
                self.LoadExtent.setIcon(QIcon(os.path.join(self.plugin_dir,"Icons","Download.png")))

        for task in QgsApplication.taskManager().activeTasks():#якщо завантаження вже запущено - перервати старе завантаження
            if task.description()=="Завантаження ділянок":
                task.cancel()
                return
        
        canvas = self.iface.mapCanvas()
        extent=canvas.extent()
        
        geometry=transform_geometry(QgsGeometry.fromRect(extent), canvas.mapSettings().destinationCrs(),"4326")#переводимо ексетнт в правильну СК
        if geometry is None:
            message_bar.pushWarning(self.pluginName, "Помилка!Неможливо визначити розмір ділянки")
            return
        #перевірка на розмір завантажуваної ділянки
        geometry_for_measuring=transform_geometry(QgsGeometry.fromRect(extent), canvas.mapSettings().destinationCrs(),"3857")
        if geometry_for_measuring is None:
            message_bar.pushWarning(self.pluginName, "Помилка!Неможливо визначити розмір ділянки")
            return
        area_km2  = geometry_for_measuring.area()/1000000 
        if area_km2>150 and not self.isControlOrShift():#якщо завеликий масштаб, вивести помилку
            message_bar.pushWarning(self.pluginName, "Завелика ділянка для заватаження")
            return
        else:
            message_bar.pushInfo(self.pluginName, "Зачекайте, триває завантаження...")
            self.LoadExtent.setText("Зупинити завантаження")
            self.LoadExtent.setIcon(QIcon(os.path.join(self.plugin_dir,"Icons","Download_cancel.png")))
        
        x1, y1, x2, y2 = geometry.boundingBox().toRectF().getCoords()
        token_url = f"https://{self.baseurl}/export/{y1}/{x1}/{y2}/{x2}"
        #print(token_url)
        
        self.task = LoadByExtent("Завантаження ділянок", token_url, self)        
        
        self.task.statusChanged.connect(status_changed)
        
        QgsApplication.taskManager().addTask(self.task)
    
    def addLayer(self, action=False) -> QgsMapLayer:
        """
        Додає шар на карту на основі параметру `action`, що містить посилання на кнопку, яку натиснули.
        
        Якщо `action` не передано або не є об'єктом `QAction`, замінює його на натискання кнопки 
        "додати шар ділянок". В цьому випадку, активує пошук по кадастровому номеру.

        Використовує `layers_dict` для отримання інформації про шар: `name`, `url`, `
        """
        if not isinstance(action, QAction):#якщо нічого не передано підміняє на натискання кнопки "додати шар ділянок" 
            action=self.AddParcelsLayer
            # self.searchParcel.setText("Пошук по кадастровому номеру")
            # self.searchParcel.setEnabled(True)
            # self.cadNum.returnPressed.connect(self.Search)        
        
        name = self.layers_dict[action.text()]["name"]
        url = self.layers_dict[action.text()]["url"]
        style = self.layers_dict[action.text()].get("style")
        extent = self.layers_dict[action.text()].get("extent")
        
        project = QgsProject.instance()
        for layer in project.mapLayers().values():
            if type(layer)==QgsVectorTileLayer and layer.sourcePath()==url:                
                self.mBar.pushMessage(f"Шар «{name}» вже наявний в проекті!", Qgis.Warning, 5)
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
        
        if url.endswith(".pbf"):
            layer = QgsVectorTileLayer("type=xyz&url="+url, name)
            if style:
                
                if self.QVersion<=3.2814:
                    style27 = style.replace(".qml","_27.qml")
                    style_file = os.path.join(self.plugin_dir,"Styles",style27)
                    if os.path.exists(style_file):
                        layer.loadNamedStyle(style_file)
                    else:
                        layer.loadNamedStyle(os.path.join(self.plugin_dir,"Styles",style))
                else:
                    layer.loadNamedStyle(os.path.join(self.plugin_dir,"Styles",style))
        else:
            layer = QgsRasterLayer(f"type=xyz&url={url}&zmin=7&zmax=15", name, "wms")
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
        
        url=self.layers_dict[next(iter(self.layers_dict))]["url"]
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
    
    def update_existing_layers(self, oldBaseUrl, newUrl):
        project = QgsProject.instance()
        for layer in project.mapLayers().values():
            layer1 = cast(QgsMapLayer, layer)
            if (layer.providerType()=='xyzvectortiles' or layer.providerType()=='vectortile') and oldBaseUrl in layer.sourcePath():
                new_url = layer.sourcePath().replace(oldBaseUrl, newUrl)
                layer.setDataSource(new_url, layer.name(), layer.providerType())

    def updateBaseUrl(self):
        if not self.don_not_update_connection:
            MBOX =  QMessageBox.question(self.iface.mainWindow(), "Ресурс недоступний", "Спробувати оновити налаштування підключення до Kadastr.live?",QMessageBox.Yes | QMessageBox.No | QMessageBox.Cancel)
            if MBOX == QMessageBox.No:
                self.don_not_update_connection = True
                log("Користувач вибрав не змінювати налаштування підключення", 0)
                return False
            if MBOX == QMessageBox.Cancel:
                log("Користувач закрив діалог", 0)
                return False
        
        newBaseUrl = self.getBaseUrl()
        oldBaseUrl = self.baseurl
        if newBaseUrl is None:
            return False
        
        if newBaseUrl != self.baseurl:
            self.baseurl = newBaseUrl
            save_base_url(self.baseurl)
            self.layers_dict = getUpdatedUrls(self.baseurl)
            MBOX =  QMessageBox.question(self.iface.mainWindow(), "Налаштування з'єднання оновлено", "Спробувати оновити налаштування підключення в уже наявних шарах?")
            if MBOX == QMessageBox.Yes:
                log("Користувач змінює налаштування url шарів", 0)
                self.update_existing_layers(oldBaseUrl, newBaseUrl)
            return True
        
        return False

    def sessionGetResponse(self, url):
        BLOCK_STATUSES = {403, 404, 410, 451, 502, 503, 504}
        try:
            r = self.session.get(url)
            if r.status_code in BLOCK_STATUSES:
                raise requests.exceptions.HTTPError(f"blocked: {r.status_code}")
            r.raise_for_status()
            return r
        except (requests.exceptions.ConnectionError,
                requests.exceptions.Timeout,
                requests.exceptions.TooManyRedirects,
                requests.exceptions.HTTPError, socket.gaierror) as e:
            log(f"Помилка доступу до '{url}': {e}", 1)
            if self.updateBaseUrl():                
                self.mBar.pushWarning(self.pluginName, "Помилка доступу до сервісу, спробуйте ще раз")
                return None
        # Усе інше — просто лог і None
        except requests.exceptions.RequestException as e:
            self.mBar.pushWarning(self.pluginName, "Помилка доступу до сервісу, перевірте налаштування мережі, або увімкніть VPN")
            log(f"Помилка доступу до '{url}': {e}", 1)
            return None

    def get_area(self, cadnum, timeout = 10, show_msg = False):
        """
        Get area as text of area attribute coordinates based on a cadnum.
        :param cadnum: The cadnum to search for.
        :param timeout: Timeout for the HTTP request (in seconds).
        :param show_msg: Define rising of message box with area value.
        :return: area as float, area_unit as string
        :raises: requests.exceptions.RequestException if an HTTP request error occurs.
        """        
        token_url = f"https://{self.baseurl}/search/{cadnum}/"
        token_response = self.sessionGetResponse(token_url)
        if token_response is None:
            return None, None
        # session: Session = self.session       
        # token_response = session.get(token_url)#, timeout=timeout, headers = self.headers)
        
        # if token_response.status_code==500:
        #     print("Помилка 500. спроба 2")
        #     token_response = session.get(token_url, timeout=timeout)
        #     if token_response.status_code==500:
        #         self.mBar.pushMessage("Помилка",f"Сервер повернув помилку 500 при пошуку кадастрового номера {cadnum}. Зачекайте декілька секунд і спробуйте знову.", level=Qgis.Warning, duration=5)
        #         return None, None
        
        respond = json.loads(token_response.text)

        if 'results' in respond and respond['results']:
            area_unit = respond['results'][0]['unit_area']
            area=float(respond['results'][0]['area'])
            if show_msg:
                self.message_show(f"Площа введеної ділянки {cadnum} - {area} {area_unit}",None,QMessageBox.NoIcon)
            return area, area_unit
        else:
            self.mBar.pushMessage("Помилка", "За даним кадастровим номером ділянок не знайдено!", level=Qgis.Warning, duration=5)
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
    
    def getSelectedCadnums(self):
        if not self.QVersion>3.27:      
            self.mBar.pushMessage("Відсутня ділянка для перевірки","Введіть правильний кадастровий номер!", level=Qgis.Warning, duration=5)
            return None
        
        layer=self.iface.activeLayer()
        if type(layer) is QgsVectorLayer:
            if layer.dataProvider().fieldNameIndex('cadnum') != -1:
                selected_features = layer.selectedFeatures()
                cadnums = [feature['cadnum'] for feature in selected_features]
                return cadnums
        
        if type(layer) is QgsVectorTileLayer:
            if layer.dataProvider().fieldNameIndex('cadnum') != -1:
                return True
        return False

    def BuildGo(self):
        if self.validate_input(self.cadNum) and not self.isControlOrShift():
            cadnum=self.cadNum.text()
            QDesktopServices.openUrl(QUrl(f"https://e-construction.gov.ua/search_in_registers?search={cadnum}"))
            return
        else:   
            if not self.QVersion>3.27:      
                self.mBar.pushMessage("Відсутня ділянка для перевірки","Введіть правильний кадастровий номер!", level=Qgis.Warning, duration=5)
                return
            layer=self.iface.activeLayer()
            
            if layer.providerType()=='xyzvectortiles' or layer.providerType()=='vectortile' :
                if layer.sourcePath()==f'https://cdn.{self.baseurl}/tiles/maps/kadastr/land_polygons/'+'{z}/{x}/{y}.pbf' and layer.selectedFeatureCount()>0:
                    for feature in layer.selectedFeatures():
                        cadnum=feature.attribute('cadnum')
                        QDesktopServices.openUrl(QUrl(f"https://e-construction.gov.ua/search_in_registers?search={cadnum}"))
                    return
            
            elif layer.providerType() == 'ogr' and type(layer) is QgsVectorLayer:
                for feature in layer.selectedFeatures():
                    cadnum=feature.attribute('cadnum')
                    QDesktopServices.openUrl(QUrl(f"https://e-construction.gov.ua/search_in_registers?search={cadnum}"))
                return
                
            elif layer.providerType() == 'memory':
                field_names = [field.name() for field in layer.fields()]
                if 'cadnum' in field_names and layer.selectedFeatureCount()>0:                  
                    for feature in layer.selectedFeatures():
                        cadnum=feature.attribute('cadnum')
                        QDesktopServices.openUrl(QUrl(f"https://e-construction.gov.ua/search_in_registers?search={cadnum}"))
                    return
            
            self.mBar.pushMessage("Помилка", "Введіть правильний кадастровий номер, або виберіть ділянки на карті!", level=Qgis.Warning)
            return
    
    def LandGo(self):
        if self.validate_input(self.cadNum) and not self.isControlOrShift():
            cadnum=self.cadNum.text()
            QDesktopServices.openUrl(QUrl(f"https://e.land.gov.ua/back/cadaster/?cad_num={cadnum}"))
            return
        else:   
            if not self.QVersion>3.27:      
                self.mBar.pushMessage("Відсутня ділянка для перевірки","Введіть правильний кадастровий номер!", level=Qgis.Warning, duration=5)
                return
            layer=self.iface.activeLayer()
            
            if layer.providerType()=='xyzvectortiles' or layer.providerType()=='vectortile' :
                if layer.sourcePath()==f'https://cdn.{self.baseurl}/tiles/maps/kadastr/land_polygons/'+'{z}/{x}/{y}.pbf' and layer.selectedFeatureCount()>0:
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
            
            self.mBar.pushMessage("Помилка", "Введіть правильний кадастровий номер, або виберіть ділянки на карті!", level=Qgis.Warning)
            return
    
    def KLgo(self):
        #print('KLgo')
        if self.validate_input(self.cadNum) and not self.isControlOrShift():
            cadnum=self.cadNum.text()
            QDesktopServices.openUrl(QUrl(f"https://{self.baseurl}/parcel/{cadnum}"))
            return
        else:   
            if not self.QVersion>3.27:
                print("Весія не пройшла")
                self.mBar.pushMessage("Відсутня ділянка для перевірки","Введіть правильний кадастровий номер!", level=Qgis.Warning, duration=5)
                return
            layer=self.iface.activeLayer()
            if layer.providerType()=='xyzvectortiles' or layer.providerType()=='vectortile':
                if layer.sourcePath()==f'https://cdn.{self.baseurl}/tiles/maps/kadastr/land_polygons/'+'{z}/{x}/{y}.pbf' and layer.selectedFeatureCount()>0:
                    for feature in layer.selectedFeatures():
                        cadnum=feature.attribute('cadnum')
                        QDesktopServices.openUrl(QUrl(f"https://{self.baseurl}/parcel/{cadnum}"))
                    return
            self.mBar.pushMessage("Помилка","Введіть правильний кадастровий номер, або виберіть ділянки на карті!", level=Qgis.Warning, duration=5)
            return
    
    def batch_search(self):
        self.dialog = MultiLineInputDialog(self.iface.mainWindow(), self.SearchWindows_icon, plugin = self)
        if self.dialog.exec_() == QDialog.Accepted:            
            text = self.dialog.get_text()
            self.batchSearchTask = BatchSearchTask(text, self.iface, plugin = self)
            QgsApplication.taskManager().addTask(self.batchSearchTask)
            return
        else:
            pass
            #print("Dialog canceled")
        
        
    def Search(self, cadnum = None, batch_search = False):
        def get_coordinates_from_cadnum(cadnum, timeout=10):
            """
            Get latitude and longitude coordinates based on a cadnum.

            :param cadnum: The cadnum to search for.
            :param timeout: Timeout for the HTTP request (in seconds).
            :return: A tuple containing (latitude, longitude) or (None, None) if no results are found or on error.
            :raises: requests.exceptions.RequestException if an HTTP request error occurs.
            """
            try:
                token_url = f"https://{self.baseurl}/search/{cadnum}/"
                # token_headers = requests.structures.CaseInsensitiveDict()
                # token_headers["Accept"] = "application/json"
                # token_headers['User-Agent'] = f'QGIS Kadastr.Live search plugin/{self.PluginVersion}'
                # token_session = requests.session()
                
                # token_response = token_session.get(token_url, headers = token_headers, timeout=timeout)
                token_response = self.sessionGetResponse(token_url)
                if token_response is None:
                    return None, None, None

                if token_response.status_code==500:                    
                    if not batch_search:
                        self.mBar.pushMessage("Помилка 500","Зачекайте декілька секунд і спробуйте знову.", Qgis.Warning, 5)
                    return None, None, None
                
                respond = json.loads(token_response.text)

                if 'results' in respond and respond['results']:
                    coords = respond['results'][0]['location']
                    latitude = coords[1]
                    longitude = coords[0]
                    area=float(respond['results'][0]['area'])
                    return latitude, longitude, area
                else:
                    if not batch_search:
                        self.mBar.pushMessage("Помилка",f"Кадастровий номер {cadnum} не знайдено", level=Qgis.Warning, duration=5)
                    return None, None, None
            except requests.exceptions.RequestException as e:
                self.mBar.pushMessage("Kadastr.Live: HTTP Error", str(e), level=Qgis.Critical, duration=10)
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

        if not cadnum and not self.validate_input(self.cadNum):
            self.mBar.pushMessage("Неправильний кадастровий номер!", "Введіть правильний кадастровий номер! Можливо поле вводу пусте або не заповнене до кінця", level=Qgis.Warning, duration=5)
            return False
        
        if not cadnum:
            cadnum = self.cadNum.text()

        if not cadnum and self.validate_input(self.cadNum) or cadnum:
            
        
            latitude, longitude, area = get_coordinates_from_cadnum(cadnum)
            
            layer = self.select_parcel_layer()
            
            if not latitude or not longitude:
                if not batch_search:
                    self.mBar.pushMessage("Помилка", f"Не вдалося знайти ділянку з даним кадастровим номером {cadnum}. Можливо ділянка відсутня, або наявні проблеми з доступом до сервісу Kadastr.live. Перевірте кадастровий номер, і спробуйте ще раз.", Qgis.Warning, 10)
                return False
            
            if not self.QVersion>3.27:
                #print("Весія не пройшла")                
                go_to_coordinates(latitude, longitude, area)
                return True

            if self.isControlOrShift() or batch_search:
                result=self.select_parcel(latitude, longitude, keep_selection=True)
            else:
                result=self.select_parcel(latitude, longitude, keep_selection=False)
            
            if result:
                QTimer.singleShot(100, lambda: go_to_selection(layer, latitude, longitude, area))
                return True
            else:
                if not batch_search:
                    self.mBar.pushMessage("Не вдалося перейти до ділянки!", "Спробуйте натиснути пошук ще раз, або наблизитися до зони пошуку.", level=Qgis.Warning, duration=5)
                    return False
        else:
            pass
        
    def GetArea(self):
        #print('GetArea')
        if self.validate_input(self.cadNum) and not self.isControlOrShift():
            cadnum=self.cadNum.text()
            self.get_area(cadnum,10,True)
            return
        else:
            if not self.QVersion>3.27:             
                self.mBar.pushMessage("Відсутня ділянка для перевірки", "Введіть правильний кадастровий номер!", Qgis.Warning, 5)
                return
            
            layer = self.select_parcel_layer()
            
            if layer.selectedFeatureCount()>0:
                area={}
                total_area=0
                for feature in layer.selectedFeatures():
                    cadnum=feature.attribute('cadnum')
                    area[cadnum]=self.get_area(cadnum,10,False)
                    if area[cadnum][0] is not None:
                        total_area=total_area+area[cadnum][0]
                    else:
                        area[cadnum] = ("Помилка доступу",'')
                        
                
                msg='Площа для вибраних ділянок:\r\n\r\n'
                for cadNum in area:
                    msg=msg+cadNum+" - "+str(area[cadNum][0])+" "+area[cadNum][1]+"\r\n"                       
                self.message_show(msg+"\r\nЗагальна площа вибраних ділянок - "+str(round(total_area,4))+" га",None,QMessageBox.NoIcon)
                return
            self.mBar.pushMessage("Відсутні ділянки для перевірки", "Введіть правильний кадастровий номер, або виберіть ділянки на карті!", level=Qgis.Warning, duration=5)
            return
    

