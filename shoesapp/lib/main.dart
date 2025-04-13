import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/models/shoes_model.dart';
import 'package:shoesapp/presentation/screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ShoesModel>(create: (context) => ShoesModel(),),
      ],
      child: const MainApp()
    )
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: HomeScreen()
      ),
    );
  }
}
