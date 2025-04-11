import 'package:disenos_app/presentation/presentation.dart';
import 'package:disenos_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => ThemeChangerModel(2),
    child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeChangerModel>(context).currentTheme();
    return MaterialApp(
      theme: themeData,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen()
    );
  }
}
