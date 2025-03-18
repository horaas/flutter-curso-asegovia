# push_app

A new Flutter project.
git clean --ffdx && git reset --hard
git lfs uninstall && git reset --hard && git lfs install && git lfs pull

flutter pub add firebase_messaging
flutter pub add firebase_core  
flutter pub add flutter_local_notifications

se debe configurar con los siquientes pasoso

dart pub global activate flutterfire_cli
colocar esto en las variables de entorno si no reconoce
C:\Users\horacio\AppData\Local\Pub\Cache\bin
refreshenv

flutterfire configure

seleccionae el proyeto
seleccionar para androi-ios


al instalar flutter_local_notifications se debe realizar los siguietes pasos
1 añadir isCoreLibraryDesugaringEnabled = true en la compileOptions dentro de android en el android/app/build.gradle.kts
1 añadir coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4") en dependencies  en el android/app/build.gradle.kts