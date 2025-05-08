import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:maps_app/blocs/blocs.dart';
import 'package:maps_app/blocs/map/map_bloc.dart';
import 'package:maps_app/presentation/screens/screens.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => GpsBloc(),),
      BlocProvider(create: (_) => LocationBloc(),),
      BlocProvider(create: (context) => MapBloc(locationBloc: BlocProvider.of<LocationBloc>(context),)),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LoadingScreen(),
      ),
    );
  }
}
