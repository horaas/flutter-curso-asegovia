import 'package:estados/bloc/user/user_bloc.dart';
import 'package:estados/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Pagina1Page extends StatelessWidget {
  
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        actions: [
          IconButton(onPressed: () {
             BlocProvider.of<UserBloc>(context, listen: false).add(RemoveUser());
          }, icon: const Icon(Icons.delete))
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        
        return state.exitUser ? InformacionUsuario(user: state.user!,) : const Center(child: Text('No hay user'),);
      },),

     floatingActionButton: FloatingActionButton(
       child: const Icon( Icons.accessibility_new ),
       onPressed: () => Navigator.pushNamed(context, 'pagina2')
     ),
   );
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