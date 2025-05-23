import 'package:band_names_app/presentation/screens/home/home_screen.dart';
import 'package:band_names_app/providers/socket_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SocketProvider())
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
