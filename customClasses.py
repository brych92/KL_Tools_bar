from qgis.core import QgsTask, QgsApplication, QgsTaskManager, QgsFields, QgsField, QgsJsonUtils, QgsVectorLayer, QgsProject, QgsProject
from qgis.PyQt.QtCore import QVariant
import requests
import json
import os

class LoadByExtent(QgsTask):
    def __init__(self, description, token_url):
        super().__init__(description, QgsTask.CanCancel)        
        self.token_url=token_url
        self.failure_reason=False
        self.last_action=''
    
    def get_failure(self):
        return self.failure_reason
        
    def get_last_action(self):
        return self.last_action
        
    def run(self):
        self.setProgress(1)
        token_headers = requests.structures.CaseInsensitiveDict()
        token_headers["Accept"] = "application/json"
        token_headers['User-Agent'] = 'QGIS Kadastr.Live search plugin/0.7.3.1'
        token_session = requests.session()
        self.last_action='Making request'
        response = token_session.get(self.token_url, stream=True, timeout=30)
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

