import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:real_time_chat_app/models/user_model.dart';
import 'package:real_time_chat_app/providers/auth_service.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final RefreshController refreshController = RefreshController(initialRefresh: false);
  final List<UserModel> users = [
    UserModel(online: true, uuid: '1', name: 'Juan', email: 'email'),
    UserModel(online: false, uuid: '2', name: 'pedro', email: 'email'),
    UserModel(online: true, uuid: '3', name: 'marmol', email: 'email'),
  ];

  @override
  Widget build(BuildContext context) {
    final authServices = Provider.of<AuthService>(context, listen: false);
    final user = authServices.user;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            AuthService.deleteToken();
            Navigator.restorablePushNamed(context, 'login');
          },
          icon: const Icon(Icons.exit_to_app)),
        title: Text(user?.name ?? 'nombre'),
        centerTitle: true,
        actions: [
          const Padding(
            padding: EdgeInsets.all(25),
            child: Icon(Icons.check_circle, color: Colors.greenAccent),
          ),
        ],
      ),
      body: SmartRefresher(
        onRefresh: () {
          _loadUser();
        },
        controller: refreshController,
        enablePullDown: true,
        header: WaterDropHeader(
          complete: Icon(Icons.check_circle, color: Colors.blue[400],),
          waterDropColor: Colors.blue,
        ),
        child: _UsersListView(users: users)),
    );
  }
  
  void _loadUser() async  {
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    refreshController.refreshCompleted();
  }
}

class _UsersListView extends StatelessWidget {
  const _UsersListView({ required this.users,});

  final List<UserModel> users;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, index) => _UserListTile(user: users[index]),
      separatorBuilder: (_, index) => const Divider(),
      itemCount: users.length,
      physics: const BouncingScrollPhysics(),
    );
  }
}

class _UserListTile extends StatelessWidget {
  final UserModel user;

  const _UserListTile({required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user.name),
      leading: CircleAvatar(child: Text(user.name.substring(0, 2))),
      trailing: CircleAvatar(
        child: Icon(
          Icons.circle,
          color: user.online ? Colors.green : Colors.redAccent,
        ),
      ),
    );
  }
}
