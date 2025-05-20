import 'package:estados/controller/usuario_controller.dart';
import 'package:estados/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Pagina1Page extends StatelessWidget {
  
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    final usrController = Get.put(UsuarioController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        actions: [
          IconButton(onPressed: () {
             
          }, icon: const Icon(Icons.delete))
        ],
      ),
      body: Obx(() => usrController.existeUsuario.value ?  InformacionUsuario(user: usrController.user.value,) : const NoUser(),),
      
      //  true ? InformacionUsuario(user: User(nombre: 'nombre', edad: 1, profesiones: ['ssss']),) : const Center(child: Text('No hay user'),),

     floatingActionButton: FloatingActionButton(
       child: const Icon( Icons.accessibility_new ),
       onPressed: () => Get.toNamed('pagina2')
     ),
   );
  }
}

class NoUser extends StatelessWidget {

  const NoUser({ super.key });

   @override
   Widget build(BuildContext context) {
       return const Center(child: Text('No hay user'));
  }
}

class InformacionUsuario extends StatelessWidget {
  final User user;
  const InformacionUsuario({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text('General', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold ) ),
          const Divider(),

          ListTile( title: Text('Nombre: ${user.nombre}') ),
          ListTile( title: Text('Edad: ${user.edad}') ),

          const Text('Profesiones', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold ) ),
          const Divider(),

          ...user.profesiones.map((profesion) => ListTile(title: Text(profesion),))

        ],
      ),
    );
  }

}