import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:real_time_chat_app/models/user_model.dart';
import 'package:real_time_chat_app/providers/auth_service.dart';
import 'package:real_time_chat_app/providers/chat_service.dart';
import 'package:real_time_chat_app/providers/socket_provider.dart';
import 'package:real_time_chat_app/providers/user_services.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final RefreshController refreshController = RefreshController(initialRefresh: false);
  final usersServices = UserServices();

  List<UserModel> users = [];

  @override
  void initState() {
    _loadUser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final authServices = Provider.of<AuthService>(context, listen: false);
    final user = authServices.user;
    final socketService = Provider.of<SocketProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            socketService.disconnect();
            AuthService.deleteToken();
            Navigator.restorablePushNamed(context, 'login');
          },
          icon: const Icon(Icons.exit_to_app)),
        title: Text(user?.name ?? 'nombre'),
        centerTitle: true,
        actions: [
           Padding(
            padding: const EdgeInsets.all(25),
            child: socketService.serverStatus == ServerStatus.online ? const Icon(Icons.check_circle, color: Colors.greenAccent) : Icon(Icons.sick, color: Colors.red[300], size: 25,),
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
    // await Future.delayed(const Duration(milliseconds: 1000));
    users = await usersServices.getUsers();
    setState(() {});
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
      onTap: () {
        final chatService = Provider.of<ChatService>(context, listen: false);
        chatService.userTo = user;
        Navigator.pushNamed(context, 'chat');
      },
    );
  }
}
