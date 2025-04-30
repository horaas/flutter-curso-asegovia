import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:real_time_chat_app/config/environments.dart';
import 'package:real_time_chat_app/models/server_login_model.dart';

class AuthService extends ChangeNotifier {

    bool _autenticate = false;


    bool autenticate() => _autenticate;

    set setAutenticate(bool enabled) {
      _autenticate = enabled;
      notifyListeners();
    }



  Future<bool> login(String email, String pass) async {
    setAutenticate = true;

    final Map<String, String> data = {'email': email, 'pass': pass};

    final resp = await http.post(
      Uri.https(Environments.apiUrl, 'api/login/auth'),
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    if(resp.statusCode == 200) {
      final loginresponse = serverLoginModelFromJson(resp.body);
      print(loginresponse);
      setAutenticate = false;
      return true;
    }
    setAutenticate = false;
    return false;
  }
}
