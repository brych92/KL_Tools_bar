import os
import platform
import ctypes
import zipfile
import pathlib

def get_desktop_path():
    system = platform.system()
    
    if system == "Windows":
        # Для врахування OneDrive та локалізації
        try:
            # Використовуємо API Windows для отримання правильного шляху
            csidl_desktop = 0x0000  # CSIDL_DESKTOP
            path = ctypes.create_unicode_buffer(512)
            ctypes.windll.shell32.SHGetFolderPathW(None, csidl_desktop, None, 0, path)
            return path.value
        except Exception as e:
            print(f"Error retrieving desktop path on Windows: {e}")
            return os.path.join(os.environ['USERPROFILE'], 'Desktop')
    
    elif system == "Linux":
        return os.path.join(os.environ['HOME'], 'Desktop')
    
    else:
        raise NotImplementedError(f"Unsupported OS: {system}")

def get_version_from_metadata():
    '''
    get version form metadata.txt in current folder
    '''
    try:
        with open("metadata.txt", "r") as f:
            for line in f:
                if line.startswith("version="):
                    return "_"+line.split("=")[1].strip()
    except IOError:
        return ""

def zipdir(path, ziph, folder_name):
    # ziph is zipfile handle
    print(path)
    for root, dirs, files in os.walk(path):
        # exclude subfolders .git __pycache__ and sources
        dirs[:] = [d for d in dirs if d not in ['.git', '__pycache__', '__sources']] 
        for file in files:
            if file != '.gitignore' and file != 'make.py':
                file_path = os.path.join(root, file)
                ziph.write(file_path, os.path.join(folder_name, os.path.relpath(file_path, path)))

if __name__ == '__main__':
    cwd = os.getcwd()
    pathlib.Path()
    desktop_path = get_desktop_path()
    if not os.path.exists(desktop_path):
        print(f"Desktop path does not exist")
    version = get_version_from_metadata()
    folder_name = os.path.basename(cwd)
    zip_file_path = os.path.join(desktop_path, f'{folder_name}{version}.zip')
    zipf = zipfile.ZipFile(zip_file_path, 'w', zipfile.ZIP_DEFLATED)
    zipdir(cwd, zipf, folder_name)
    
    zipf.close()

    print(f'\r\n\r\nCreated {zip_file_path}\r\n\r\n')

