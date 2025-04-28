import 'package:flutter/material.dart';
import 'package:real_time_chat_app/presentation/register/register_screen.dart';
import 'package:real_time_chat_app/presentation/screens/login/login_screen.dart';
import 'package:real_time_chat_app/presentation/users/users_screen.dart';

final Map<String, WidgetBuilder> routes = {
  'login': (_) => const LoginScreen(),
  'register': (_) => const RegisterScreen(),
  'users': (_) => const UsersScreen(),
};