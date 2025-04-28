import 'package:flutter/material.dart';
import 'package:real_time_chat_app/models/user_model.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final List<UserModel> users = [
    UserModel(online: true, uuid: '1', nombre: 'Juan', email: 'email'),
    UserModel(online: false, uuid: '2', nombre: 'pedro', email: 'email'),
    UserModel(online: true, uuid: '3', nombre: 'marmol', email: 'email'),
    UserModel(online: true, uuid: '1', nombre: 'Juan', email: 'email'),
    UserModel(online: false, uuid: '2', nombre: 'pedro', email: 'email'),
    UserModel(online: true, uuid: '3', nombre: 'marmol', email: 'email'),
    UserModel(online: true, uuid: '1', nombre: 'Juan', email: 'email'),
    UserModel(online: false, uuid: '2', nombre: 'pedro', email: 'email'),
    UserModel(online: true, uuid: '3', nombre: 'marmol', email: 'email'),
    UserModel(online: true, uuid: '1', nombre: 'Juan', email: 'email'),
    UserModel(online: false, uuid: '2', nombre: 'pedro', email: 'email'),
    UserModel(online: true, uuid: '3', nombre: 'marmol', email: 'email'),
    UserModel(online: true, uuid: '1', nombre: 'Juan', email: 'email'),
    UserModel(online: false, uuid: '2', nombre: 'pedro', email: 'email'),
    UserModel(online: true, uuid: '3', nombre: 'marmol', email: 'email'),
    UserModel(online: true, uuid: '1', nombre: 'Juan', email: 'email'),
    UserModel(online: false, uuid: '2', nombre: 'pedro', email: 'email'),
    UserModel(online: true, uuid: '3', nombre: 'marmol', email: 'email'),
    UserModel(online: true, uuid: '1', nombre: 'Juan', email: 'email'),
    UserModel(online: false, uuid: '2', nombre: 'pedro', email: 'email'),
    UserModel(online: true, uuid: '3', nombre: 'marmol', email: 'email'),
    UserModel(online: true, uuid: '1', nombre: 'Juan', email: 'email'),
    UserModel(online: false, uuid: '2', nombre: 'pedro', email: 'email'),
    UserModel(online: true, uuid: '3', nombre: 'marmol', email: 'email'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.exit_to_app),
        title: const Text('Name'),
        centerTitle: true,
        actions: [
          const Padding(
            padding: EdgeInsets.all(25),
            child: Icon(Icons.check_circle, color: Colors.greenAccent),
          ),
        ],
      ),
      body: ListView.separated(
        itemBuilder:
            (_, index) => ListTile(
              title: Text(users[index].nombre),
              leading: CircleAvatar(
                child: Text(users[index].nombre.substring(0, 2)),
              ),
              trailing: CircleAvatar(
                child: Icon(
                  Icons.circle,
                  color: users[index].online ? Colors.green : Colors.redAccent,
                ),
              ),
            ),
        separatorBuilder: (_, index) => const Divider(),
        itemCount: users.length,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
