import 'package:flutter/material.dart';
import 'package:shoesapp/presentation/screens/home_screen.dart';
import 'package:shoesapp/presentation/screens/product_detail_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:
        //  ProductDetailScreen()
         HomeScreen()
      ),
    );
  }
}
