import 'package:flutter/material.dart';
import 'package:pelis_app/config/theme/app_theme.dart';
import 'package:pelis_app/presentation/screens/buttons/buttons_screen.dart';
import 'package:pelis_app/presentation/screens/cards/cards_screen.dart';
import 'package:pelis_app/presentation/screens/home/home_screen.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
        title: 'Widhets',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const HomeScreen(),
        routes: {
          '/buttons': (context) => const ButtonsScreen(),
          '/cards': (context) => const CardsScreen(),
        },
      );

  }
}