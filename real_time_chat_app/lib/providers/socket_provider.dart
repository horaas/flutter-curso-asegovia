import 'package:flutter/material.dart';
import 'package:real_time_chat_app/config/environments.dart';
import 'package:real_time_chat_app/providers/auth_service.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

enum ServerStatus {online, offline, connecting}

class SocketProvider with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.connecting;
  late io.Socket _socket;

  // SocketProvider() {
  //   _initConfig();
  // }

  ServerStatus get serverStatus => _serverStatus;
  io.Socket get soket => _socket;


  void connect() async {
    final token = await AuthService.getToken();

    _socket = io.io(Environments.socketUrl, {
      'transports': ['websocket'],
      'autoConnect': true,
      'forceNew': true,
      'extraHeaders': {
        'x-token': token
      }
    });
    _socket.onConnect((_) {
      print('connect');
      _serverStatus = ServerStatus.online;
      notifyListeners();
    });
    // _socket.on('message', (data) => print(data));
    _socket.onDisconnect((_) {
      _serverStatus =  ServerStatus.offline;
      notifyListeners();
    });
  }

  void disconnect() {
    _socket.disconnect();
  }
}
