# Proceso de subida de la app a tienda

### 1. cambiar el bundle de la app
instalar 

flutter pub add -d change_app_package_name

correr el comando 

#### android 
dart run change_app_package_name:main com.pruebacambio.dev.onlie --android

#### ios
dart run change_app_package_name:main com.pruebacambio.dev.onlie --ios

probar que se compile correctamente


2 cambiar el icono 
lanzar 
flutter pub add -d flutter_launcher_icons

poner las configuraciones en el yml
flutter_launcher_icons:
  android: "launcher_icon"
  ios: true
  image_path: "assets/icon/icon.png"
  min_sdk_android: 21 # android min sdk min:16, default 21
  web:
    generate: true
    image_path: "assets/icon/icon.png"
    background_color: "#hexcode"
    theme_color: "#hexcode"
  windows:
    generate: true
    image_path: "assets/icon/icon.png"
    icon_size: 48 # min:48, max:256, default: 48
  macos:
    generate: true
    image_path: "assets/icon/icon.png"



correr elcomando para el icono

dart run flutter_launcher_icons

3 crear el splash cambiar el icono 

flutter pub add flutter_native_splash


