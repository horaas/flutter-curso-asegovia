import 'package:band_names_app/presentation/blocs/counter/counter_bloc.dart';
import 'package:band_names_app/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(create: (_) => CounterBloc(), child: HomeScreen(),),
    );
  }
}
