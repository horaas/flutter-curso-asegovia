import 'package:flutter/material.dart';
import 'package:music_app/models/playing_model.dart';
import 'package:music_app/presentation/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'config/theme/theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<PlayingModel>(
          create: (context) => PlayingModel(),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      home: const HomeScreen(),
    );
  }
}
