import 'package:flutter/material.dart';
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


  void connect() {
    _socket = io.io('https://noted-oyster-in.ngrok-free.app/', {
      'transports': ['websocket'],
      'autoConnect': true,
      'forceNew': true
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
