import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_app/blocs/notifications/notifications_bloc.dart';
    
class HomeScreen extends StatelessWidget {

  const HomeScreen({ super.key });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select((NotificationsBloc notification) {
          return Text('${notification.state.status}');
        }),
        actions: [
          IconButton(onPressed: () {
           context.read<NotificationsBloc>().requestPermissions();
          }, icon: Icon(Icons.settings))
        ],
      ),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}