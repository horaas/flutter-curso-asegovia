import 'package:estados/controller/usuario_controller.dart';
import 'package:estados/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class Pagina2Page extends StatelessWidget {
  
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UsuarioController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                final user = User(
                  edad: 25,
                  nombre: 'juan',
                  profesiones: ['desarrollo', 'otro']
                );
                userController.loadUser(user);
                Get.snackbar('Usuario', 'el nombre es ${userController.user.value.nombre}', backgroundColor: Colors.white, boxShadows: [
                  const BoxShadow(
                    color: Colors.black38,
                    blurRadius: 10
                  )
                ]);
              },
              child: const Text('Establecer Usuario', style: TextStyle( color: Colors.white ) )
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {

                Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
              },
              child: const Text('cambiar thema', style: TextStyle( color: Colors.white ) )
            ),

            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                userController.changeAgeUser(45);
              },
              child: const Text('Cambiar Edad', style: TextStyle( color: Colors.white ) )
            ),

            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                userController.addProfesionUser();
              },
              child: const Text('Añadir Profesion', style: TextStyle( color: Colors.white ) )
            ),

          ],
        )
     ),
   );
  }
}