import 'package:flutter/material.dart';
import 'package:pelis_app/config/theme/app_theme.dart';
import 'package:pelis_app/presentation/screens/chat/chat_screen.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yes not App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 0).theme(),
      home: const ChatScreen(),
    );
  }
}