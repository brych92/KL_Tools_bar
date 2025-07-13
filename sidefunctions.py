import os
from qgis.core import Qgis, QgsCoordinateReferenceSystem, QgsGeometry, QgsCoordinateTransform, QgsProject
from qgis.PyQt.QtWidgets import QToolBar
from typing import Union


import requests
from requests import Session, Request
from requests.structures import CaseInsensitiveDict
from urllib3.util.retry import Retry
from requests.adapters import HTTPAdapter

from qgis.core import QgsMessageLog
from qgis.PyQt.QtCore import QSettings

logging_enabled = 'All'

plugin_dir = os.path.dirname(__file__)

def save_base_url(url):
    settings = QSettings()
    settings.setValue("KL_base_url", url)
    settings.sync()

def get_base_url():
    settings = QSettings()
    url = settings.value("KL_base_url")
    if url:
        return url
    else:
        save_base_url('kadastr.live')
        return 'kadastr.live'    


def get_toolbar(plugin) -> QToolBar:
    """Функція повертає панель інструментів для пошуку ділянок на Kadastr.Live"""
    toolbar = plugin.iface.mainWindow().findChild(QToolBar, 'KL_Serach_bar')        
    if not toolbar:
        toolbar = plugin.iface.addToolBar("Пошук по Kadastr.Live")
        toolbar.setObjectName('KL_Serach_bar')
        #toolbar.setToolTip('Панель для отриманні актуальної інформації про земельні ділянки')
    else:
        plugin.all_toolbar_actions = [action for action in toolbar.actions()]
        for action in plugin.all_toolbar_actions:
            plugin.iface.removeToolBarIcon(action)
        #actions = [action for action in toolbar.actions() if action.isVisible()]        
    return toolbar

def get_QGIS_ver() -> float:
    """
    Повертає версію QGIS, але у вигляді числа, наприклад з "3.28.15" буде 3.2815
    """
    ver1, ver2, ver3 = Qgis.QGIS_VERSION.split('-')[0].split('.')
    return float(f'{ver1}.{ver2.zfill(2)}{ver3.zfill(2)}')

def get_plugin_version() -> str:
    """
    Повертає версію плагіна, зчитану з файлу metadata.txt
    """
    # Шлях до файлу metadata.txt
    metadata_file = os.path.join(plugin_dir, 'metadata.txt')
    
    # Читаємо файл metadata.txt
    version = "Unknown"
    try:
        with open(metadata_file, 'r', encoding='utf-8') as f:
            for line in f:
                if line.startswith('version='):
                    version = line.strip().split('=')[1].strip()
                    break
    except Exception as e:
        print(f"Помилка при читанні metadata.txt: {e}")
    
    return version

def log(text: str, level: int = Qgis.Info) -> None:
    if logging_enabled == 'All':
        QgsMessageLog.logMessage(
            message = text, 
            tag = "KL Search bar", 
            level = level)
        return
    if logging_enabled == 'Warning':
        if level >= Qgis.Warning:
            QgsMessageLog.logMessage(
                message = text, 
                tag = "KL Search bar", 
                level = level)
        return
    if logging_enabled == 'Error':
        if level >= Qgis.Critical:
            QgsMessageLog.logMessage(
                message = text, 
                tag = "KL Search bar", 
                level = level)

def getUpdatedUrls(baseUrl):
    return {#звідси буде братися меню та посилання на шари
        "Карта земельних ділянок":{
            "name":"Kadastr.Live-Parcels",
            "url":f"https://cdn.{baseUrl}/tiles/maps/kadastr/land_polygons/{{z}}/{{x}}/{{y}}.pbf",
            "style":"Parcels.qml",
            "extent":(2419945,4501250,5484118,6867501)
            },#цей запис йде на кнопку
        "АТУ":{
            "name":"Kadastr.Live-ATU",
            "url":f"https://vector.{baseUrl}/maps/dani-administrativno-teritorialnogo-ustroiu/{{z}}/{{x}}/{{y}}.pbf",
            "style":"ATU.qml",
            "extent":(2419945,4501250,5484118,6867501)
            },
        "Індексна карта":{
            "name":"Kadastr.Live-IndexMap",
            "url":f"https://vector.{baseUrl}/maps/indeksna-kadastrova-karta/{{z}}/{{x}}/{{y}}.pbf",
            "style":"Index.qml",
            "extent":(2419945,4501250,5484118,6867501)},
        "Кадастрова карта":{
            "name":"Kadastr.Live-DZK",
            "url":f"https://cdn.{baseUrl}/tiles/maps/kadastr/{{z}}/{{x}}/{{y}}.pbf",
            "style":"Parcels.qml",
            "extent":(2419945,4501250,5484118,6867501)},            
        "sep0":{"name":"*"},
        "Природньо-заповідний фонд":{
            "name":"Kadastr.Live-PZF",
            "url":f"https://vector.{baseUrl}/maps/mezhi-prirodo-zapovidnogo-fondu/{{z}}/{{x}}/{{y}}.pbf",
            "style":"PZF.qml",
            "extent":(2419945,4501250,5484118,6867501)},
        "sep1":{"name":"*"},
        "Карта водних ресурсів Загальна":{
            "name":"Kadastr.Live-WaterMap",
            "url":f"https://vector.{baseUrl}/maps/vodnii-kadastr/{{z}}/{{x}}/{{y}}.pbf",
            "style":"Water.qml",
            "extent":(2419945,4501250,5484118,6867501)},
        #"Карта річок":{"name":"Kadastr.Live-RiverLine","url":"https://vector.{self.baseurl}/maps/richki/{{z}}/{{x}}/{{y}}.pbf","style":"RiverLine.qml","extent":(2419945,4501250,5484118,6867501)},
        #"Басейни та водокористування":{"name":"Kadastr.Live-WaterMap","url":"https://vector.{self.baseurl}/maps/vodogospodarstva/{{z}}/{{x}}/{{y}}.pbf","style":"vodogospodarstva.qml","extent":(2419945,4501250,5484118,6867501)},
        "Sep2":{"name":"*"},
        "Функц. призначення м.Київ":{
            "name":"Kadastr.Live-Kyiv_Func",
            "url":f"https://vector.{baseUrl}/maps/dani-mistobudivnogo-kadastru-misto-kiiv/{{z}}/{{x}}/{{y}}.pbf",
            "style":"Kyiv_Func.qml",
            "extent":(3370113,3422430,6490174,6540480)},
        "Функц. призначення м.Житомир":{
            "name":"Kadastr.Live-Zhutomir_Func",
            "url":f"https://vector.{baseUrl}/maps/dani-mistobudivnogo-kadastru-misto-zhitomir/{{z}}/{{x}}/{{y}}.pbf",
            "style":"Zhutomir_Func.qml","extent":(3178527,3204686,6477354,6502507)},
        "Функц. призначення м.Хмельницький":{
            "name":"Kadastr.Live-Khmelnitskii_Func",
            "url":f"https://vector.{baseUrl}/maps/dani-mistobudivnogo-kadastru-misto-khmelnitskii/{{z}}/{{x}}/{{y}}.pbf",
            "style":"Khmelnitskii_Func.qml",
            "extent":(2992135,3018294,6332537,6357690)},
        "Функц. призначення м.Рівне":{
            "name":"Kadastr.Live-Rivne_Func",
            "url":f"https://vector.{baseUrl}/maps/dani-mistobudivnogo-kadastru-misto-rivne/{{z}}/{{x}}/{{y}}.pbf",
            "style":"Rivne_Func.qml",
            "extent":(2909552,2933279,6541101,6563916)},
        "Sep3":{"name":"*"},
        "Грунти(растр)":{
            "name":"Kadastr.Live-Grunt",
            "url":f"https://cdn.{baseUrl}/proxy/grunt/{{z}}/{{x}}/{{y}}.png",
            "extent":(2419945,4501250,5484118,6867501)}
        }

def transform_geometry(geometry: QgsGeometry, inCRS, outCRS): 
    '''функція повертає нову геометрію в цільовій СК'''
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

def getSessionData() -> dict:
    """
    Функція перевіряє доступ до сервісів kadastr.live та kadastr.space, 
    якщо доступу нема ні до того ні іншого - поверне None

    """
    retry = Retry(
        total=5,                # до 5 спроб на всі помилки
        connect=3, read=3,      # окремі ліміти на конект/читання
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
    
    urls = [ "https://kadastr.live", "https://kadastr.space"]
    
    for url in urls:
        try:
            response = session.get(url+"/about", timeout=5)
            if response.status_code == 200:
                print("Доступ до сервісу:", url)
                return {
                    "session":session,
                    "url":url
                }
        except requests.RequestException:
            print("Немає доступу до сервісу")
            pass
    
    return None # type: ignore
