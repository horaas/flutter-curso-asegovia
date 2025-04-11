// import 'package:animated_do_app/presentation/home_screen.dart';
import 'package:animated_do_app/presentation/navigation_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationScreen()
    );
  }
}
