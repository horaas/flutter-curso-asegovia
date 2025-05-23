import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:maps_app/blocs/blocs.dart';
import 'package:maps_app/helpers/helpers.dart';
import 'package:maps_app/presentation/screens/screens.dart';
import 'package:maps_app/services/services.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => GpsBloc(),),
      BlocProvider(create: (_) => LocationBloc(),),
      BlocProvider(create: (context) => MapBloc(locationBloc: BlocProvider.of<LocationBloc>(context),)),
      BlocProvider(create: (_) => SearchBloc(trafficService: TrafficService()),),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // body: Center(
        //   child: Container(
        //     width: 300,
        //     height: 150,
        //     color: Colors.red,
        //     child: CustomPaint(
        //       painter: StartMarker(
        //         destination: 'hola como estas en este nuevo texto que es demasiado largo para poder verlo',
        //         minutes: 200
        //       ),
        //     ),
        //   ),
        // ),
        body: LoadingScreen(),
      ),
    );
  }
}
