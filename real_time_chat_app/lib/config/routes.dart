import 'package:flutter/material.dart';
import 'package:real_time_chat_app/presentation/register/register_screen.dart';
import 'package:real_time_chat_app/presentation/screens/login/login_screen.dart';

final Map<String, WidgetBuilder> routes = {
  'login': (_) => LoginScreen(),
  'register': (_) => RegisterScreen()
};