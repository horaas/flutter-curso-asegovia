import 'package:flutter/material.dart';
import 'package:stripe_app/presentations/screens/screens.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'payment',theme: ThemeData().copyWith(
        scaffoldBackgroundColor: const Color(0xff21232A),
        primaryColor: const Color(0xff284879),
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          titleTextStyle: const TextStyle().copyWith(
            color: Colors.white,
            fontSize: 20
          ),
          iconTheme: const IconThemeData().copyWith(
            color: Colors.white
          )
        )
      ),
     routes: {
      'home': (_) => const HomeScreen(),
      'payment': (_) => const PaymentSuccesfull(),
     },
    );
  }
}
