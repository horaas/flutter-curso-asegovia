import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:real_time_chat_app/config/environments.dart';
import 'package:real_time_chat_app/models/server_login_model.dart';

class AuthService extends ChangeNotifier {
  bool _autenticate = false;
  bool _registering = false;
  final _storage = const FlutterSecureStorage();

  bool autenticate() => _autenticate;

  set setAutenticate(bool enabled) {
    _autenticate = enabled;
    notifyListeners();
  }

  bool registering() => _registering;

  set setRegistering(bool enabled) {
    _registering = enabled;
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
  Future<bool> register(String name, String email, String pass) async {
     setRegistering = true;

    final Map<String, String> data = {'name': name, 'email': email, 'pass': pass};

    final resp = await http.post(
      Uri.https(Environments.apiUrl, 'api/login/new'),
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    if (resp.statusCode == 200) {
      final registerResponse = serverLoginModelFromJson(resp.body);
      await _saveToken(registerResponse.token);
      setRegistering = false;
      return true;
    }
    setRegistering = false;
    return false;
  }

  Future<void> _saveToken(String token) async {
    return await _storage.write(key: 'token', value: token);
  }

  Future<void> logOut() async {
    return await _storage.delete(key: 'token');
  }
  Future<bool> isAutenticate() async {
    final token = await _storage.read(key: 'token');
    final resp = await http.get(
      Uri.https(Environments.apiUrl, 'api/login/renew'),
      headers: {'Content-Type': 'application/json', 'x-token': token.toString()},
    );
    if (resp.statusCode == 200) {
      final registerResponse = serverLoginModelFromJson(resp.body);
      await _saveToken(registerResponse.token);
      return true;
    }
    logOut();
    return false;
  }
}
