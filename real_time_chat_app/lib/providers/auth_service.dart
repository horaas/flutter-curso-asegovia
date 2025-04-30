import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:real_time_chat_app/config/environments.dart';
import 'package:real_time_chat_app/models/server_login_model.dart';

class AuthService extends ChangeNotifier {
  bool _autenticate = false;
  final _storage = const FlutterSecureStorage();

  bool autenticate() => _autenticate;

  set setAutenticate(bool enabled) {
    _autenticate = enabled;
    notifyListeners();
  }

  static Future getToken(String token) async {
    final storage = const FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    return token;
  }

  static Future deleteToken(String token) async {
    final storage = const FlutterSecureStorage();
    final token = await storage.delete(key: 'token');
    return token;
  }

  Future<bool> login(String email, String pass) async {
    setAutenticate = true;

    final Map<String, String> data = {'email': email, 'pass': pass};

    final resp = await http.post(
      Uri.https(Environments.apiUrl, 'api/login/auth'),
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    if (resp.statusCode == 200) {
      final loginresponse = serverLoginModelFromJson(resp.body);
      await _saveToken(loginresponse.token);
      setAutenticate = false;
      return true;
    }
    setAutenticate = false;
    return false;
  }

  Future _saveToken(String token) async {
    return await _storage.write(key: 'token', value: token);
  }

  Future logOut(String token) async {
    return await _storage.delete(key: 'token');
  }
}
