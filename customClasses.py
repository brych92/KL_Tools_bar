from qgis.core import QgsTask, QgsFields, QgsField, QgsSettings,QgsJsonUtils, QgsVectorLayer, QgsProject,\
    QgsProject, Qgis, QgsCoordinateReferenceSystem, QgsCoordinateTransform, QgsPointXY, QgsRectangle, QgsFeature
from qgis.gui import QgisInterface
from qgis.PyQt.QtCore import QVariant, QTimer

from qgis.PyQt.QtWidgets import QDialog, QPushButton, QVBoxLayout, QTextEdit, QMessageBox
import requests
from requests.structures import CaseInsensitiveDict
import json
import re

class MultiLineInputDialog(QDialog):
    def __init__(self, parent = None, icon = None, plugin = None):
        super().__init__(parent)
        
        self.setWindowTitle("Введіть список кадастрових номерів(експериментальна функція)")
        if icon: 
            self.setWindowIcon(icon)
        
        self.plugin = plugin    
        self.layout = QVBoxLayout(self)

        self.text_edit = QTextEdit(self)
        self.text_edit.setAcceptRichText(False)
        self.layout.addWidget(self.text_edit)

        self.button_box = QVBoxLayout()
        self.ok_button = QPushButton("OK", self)
        self.cancel_button = QPushButton("Відміна", self)
        self.button_box.addWidget(self.ok_button)
        self.button_box.addWidget(self.cancel_button)
        self.layout.addLayout(self.button_box)

        self.ok_button.clicked.connect(self.ok)
        self.cancel_button.clicked.connect(self.reject)

    def get_text(self):
        return self.text_edit.toPlainText()

    def ok(self):
        if not self.plugin.warned:
            msgBox = QMessageBox()
            msgBox.setText("Ви хочете використати експериментальну функцію?\n"
                           "Функція може призвести до зависання QGIS, особливо якщо список дуже великий, або кадастровий номер відсутній в базі KL.")
            msgBox.setStandardButtons(QMessageBox.Ok | QMessageBox.Cancel)
            msgBox.setDefaultButton(QMessageBox.Ok)
            ret = msgBox.exec_()
            if ret == QMessageBox.Ok:
                self.plugin.warned = True
                self.accept()
            else:
                self.reject()
        else:
            self.accept()

class BatchSearchTask(QgsTask):
    def __init__(self, dialog_text:str, iface:QgisInterface, plugin = None):
        super().__init__("Пакетний пошук", QgsTask.CanCancel)
        self.dialog_text = dialog_text
        self.results = None
        self.iface = iface
        self.plugin = plugin
        self.max_retries = int(QgsSettings().value("qgis/defaultTileMaxRetry", 5))
        self.networ_timeout = int(int(QgsSettings().value("network/network-timeout", 30000))/1000)

    def run(self):
        self.setProgress(1)
        cadnums_list = self.parse_text(self.dialog_text)
        # print("Кадастрові номери:\n ")
        # print(*cadnums_list, sep='\n')
        if self.isCanceled():
            return False
        if len(cadnums_list) == 0:
            self.setProgress(100)
            return False
        self.setProgress(5)
        result = {'success': {}, 'error': {}}
        step = 90/len(cadnums_list)
        for cadnum in cadnums_list:
            output = self.get_coordinates_from_cadnum(
                cadnum = cadnum, 
                timeout = self.networ_timeout, 
                request_retries = self.max_retries)
            if 'error' not in output:
                result['success'][cadnum] = output['coords']
            else:
                result['error'][cadnum] = output['error']
            self.setProgress(self.progress() + step)
            if self.isCanceled():
                return False
        self.results = result
        self.setProgress(100)
        return True   
        

    def parse_text(self, text:str) -> list:
        """
        Parse text and return a list of cadastral numbers found in it

        :param text: input text
        :return: list of cadastral numbers
        """
        
        cadnum_pattern = re.compile(r'\b\d{10}:\d{2}:\d{3}:\d{4}\b')
        matches = re.findall(cadnum_pattern, text)        
        return list(set(matches))

    def finished(self, result):
        if self.results is None:
            self.iface.messageBar().pushMessage("Помилка!", "В тексті не знайдено кадастрових номерів!", level=Qgis.Warning, duration=5)
            return
        
        if result:
            total_qty = len(self.results['success']) + len(self.results['error'])
            if total_qty == 0:
                self.iface.messageBar().pushMessage("Помилка!", "В тексті не знайдено кадастрових номерів!", level=Qgis.Warning, duration=5)
                return
            
            not_found_cadnums = self.results['error'].keys()
            if len(not_found_cadnums) > 0:
                message = f"Пошук завершено. Знайдено {total_qty-len(not_found_cadnums)} з {total_qty} кадастрових номерів. Відсутні кадастрові номери: {', '.join(not_found_cadnums)}"
                self.iface.messageBar().pushMessage("Увага!", message, level=Qgis.Warning)
            else:
                self.iface.messageBar().pushMessage("Успіх!", f"Всі {total_qty} кадастрові номери знайдені!", level=Qgis.Success, duration=5)
            
            layer = self.plugin.select_parcel_layer()
            layer.removeSelection()
            for cadnum, coords in self.results['success'].items():
                self.Search(coords)

    def Search(self, coords):
        def go_to_coordinates(latitude, longitude, area = 0.25):#Для версії з хрестиками
            if latitude is  None or longitude is  None:
                raise ValueError("Coordinates are None")
            
            source_crs = QgsCoordinateReferenceSystem(4326)
            
            canvas = self.iface.mapCanvas()
            canvas.refresh()
            target_crs = canvas.mapSettings().destinationCrs()
            
            transform = QgsCoordinateTransform(source_crs, target_crs, QgsProject.instance())
            point = QgsPointXY(longitude, latitude)
            transformed_point = transform.transform(point)
            extent = QgsRectangle(transformed_point, transformed_point)
            
            self.plugin.mark_point(transformed_point)
            
            if area==0:
                return True
                
            canvas.setExtent(extent)
            if area < 0.25:
                canvas.zoomScale(500)
            elif 0.25 <= area < 1:
                canvas.zoomScale(2000)
            else:
                canvas.zoomScale(10000)
                
            return True
        
        def go_to_selection(layer, latitude, longitude, area = 0.25):
            go_to_coordinates(latitude, longitude, 0)#чисто щоб хрестик поставило
            canvas = self.iface.mapCanvas()
            canvas.zoomToSelected(layer)
            canvas.zoomScale(canvas.scale()*3)

        latitude, longitude = coords
            
        layer = self.plugin.select_parcel_layer()
        if not self.plugin.QVersion>3.27:
            #print("Весія не пройшла")                
            go_to_coordinates(latitude, longitude)
            return True
        
        result=self.plugin.select_parcel(latitude, longitude, keep_selection=True)
        
        if result:
            QTimer.singleShot(100, lambda: go_to_selection(layer, latitude, longitude))
            return True
        
        
    def get_coordinates_from_cadnum(self, cadnum, timeout=10, request_retries=3):
        """
        Get latitude and longitude coordinates based on a cadnum.

        :param cadnum: The cadnum to search for.
        :param timeout: Timeout for the HTTP request (in seconds).
        :return: {'coords':(lat, lon), 'error': str}.
        :raises: requests.exceptions.RequestException if an HTTP request error occurs.
        """

        token_url = f"https://kadastr.live/search/{cadnum}/"
        token_headers = CaseInsensitiveDict()
        token_headers["Accept"] = "application/json"
        token_headers['User-Agent'] = f'QGIS Kadastr.Live search plugin/{self.plugin.PluginVersion}'
        token_session = requests.session()
        
        #повторні спроби
        for i in range(request_retries):
            token_response = token_session.get(token_url, headers = token_headers, timeout = timeout)        
            if token_response.status_code == 200:
                break            
            if i == request_retries-1:
                return {'coords':(None, None), 'error':token_response.status_code}
        
        respond = json.loads(token_response.text)
        #json.dumps(respond, indent=4, ensure_ascii=False)

        if 'results' in respond and respond['results']:
            coords = respond['results'][0]['location']
            latitude = coords[1]
            longitude = coords[0]
            return {'coords':(latitude, longitude)}
        else:
            return {'coords':(None, None), 'error':'Ділянку не знайдено в базі KL'}


class LoadByExtent(QgsTask):
    def __init__(self, description, token_url, plugin):
        super().__init__(description, QgsTask.CanCancel)        
        self.token_url=token_url
        self.failure_reason=False
        self.last_action=''
        self.plugin = plugin
    
    def get_failure(self):
        return self.failure_reason
        
    def get_last_action(self):
        return self.last_action
        
    def run(self):
        self.setProgress(1)
        token_headers = requests.structures.CaseInsensitiveDict()
        token_headers["Accept"] = "application/json"
        token_headers['User-Agent'] = f'QGIS Kadastr.Live search plugin/{self.plugin.PluginVersion}'
        token_session = requests.session()
        self.last_action='Making request'
        response = token_session.get(self.token_url, stream=True, timeout=30, headers = token_headers)
        self.last_action=f'request done {response.status_code}'
        if response.status_code != 200:
            self.last_action='Wrong code, return...'
            self.failure_reason=f'Код статусу відповіді {response.status_code}'
            return False
        self.last_action='code checking pass'
        rawData=b''        
        progress=3
        self.setProgress(progress)
        self.last_action='counting total size'
        total_size = int(response.headers.get('content-length', 0))
        step=(70-progress)/(total_size/1024)
        self.last_action='reading first chunk of data'
        i=1
        for data in response.iter_content(chunk_size=1024):
            if self.isCanceled():
                self.failure_reason='Відмінено'
                return False
            self.last_action=f'reading {i} chunk of data'
            i += 1
            rawData += data
            progress += step
            self.setProgress(round(progress,0))
        
        json= rawData.decode('utf-8')
        self.last_action='creating fields'
        fields = QgsFields()
        
        a=QgsField("cadnum", QVariant.String)
        a.setAlias('Кадастровий номер')
        fields.append(a)
        a=QgsField("category", QVariant.String)
        a.setAlias('Категорія земель')
        fields.append(a)
        a=QgsField("purpose_code", QVariant.String)
        a.setAlias('Код цільового призначення')
        fields.append(a)
        a=QgsField("purpose", QVariant.String)
        a.setAlias('Цільове призначення')
        fields.append(a)
        a=QgsField("use", QVariant.String)
        a.setAlias('Цільове використання')
        fields.append(a)
        a=QgsField("area", QVariant.String)
        a.setAlias('Площа')
        fields.append(a)
        a=QgsField("unit_area", QVariant.String)
        a.setAlias('Одиниці площі')
        fields.append(a)
        a=QgsField("ownershipcode", QVariant.String)
        a.setAlias('Код форми власності')
        fields.append(a)
        a=QgsField("ownership", QVariant.String)
        a.setAlias('Форма власності')
        fields.append(a)
        a=QgsField("id", QVariant.String)
        a.setAlias('ID')
        fields.append(a)
        a=QgsField("address", QVariant.String)
        a.setAlias('Адреса земельної ділянки')
        fields.append(a)
        # fields.append(QgsField("category", QVariant.String))
        # fields.append(QgsField("purpose_code", QVariant.String))
        # fields.append(QgsField("purpose", QVariant.String))
        # fields.append(QgsField("use", QVariant.String))
        # fields.append(QgsField("area", QVariant.String))
        # fields.append(QgsField("unit_area", QVariant.String))
        # fields.append(QgsField("ownershipcode", QVariant.String))
        # fields.append(QgsField("ownership", QVariant.String))
        # fields.append(QgsField("id", QVariant.String))  
        # fields.append(QgsField("address", QVariant.String)) 
              
        progress += 10
        self.setProgress(progress)
        
        layer = QgsVectorLayer("Polygon?crs=EPSG:4326", "Завантаження по екстенту", "memory")
        layer.startEditing()        
        layer.dataProvider().addAttributes(fields)
        progress += 10
        self.setProgress(progress)
        self.last_action='adding features'
        feature_list = QgsJsonUtils.stringToFeatureList(json, fields)
        if len(feature_list)<1:
            self.failure_reason=f"В межах карти відсутні об'єкти"
            return False
        step=(94-progress)/len(feature_list)
        for feature in feature_list:
            layer.dataProvider().addFeature(feature)
            progress+=step
            self.setProgress(round(progress,0))               
        
        layer.updateExtents()
        self.setProgress(96)
        layer.commitChanges()
        self.setProgress(98)
        QgsProject.instance().addMapLayer(layer)
        self.setProgress(100)
        return True     

