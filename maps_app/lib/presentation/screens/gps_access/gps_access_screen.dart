import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_app/blocs/blocs.dart';

class GpsAccessScreen extends StatelessWidget {

  const GpsAccessScreen({ super.key });

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           body: Center(
            child: BlocBuilder<GpsBloc, GpsState>(builder: (_, state) {
              return state.isGpsEnabled ? const _AccesButton() : const _EnabledGpsMessage();
            },)
            
            
           ),
       );
  }
}

class _EnabledGpsMessage extends StatelessWidget {
  const _EnabledGpsMessage();

  @override
  Widget build(BuildContext context) {
    return const Text('Necesita habilitar el gps concedido');
  }
}

class _AccesButton extends StatelessWidget {
  const _AccesButton();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Es necesario dar acceso al gps'),
        MaterialButton(
          color: Colors.black,
          // https://api.flutter.dev/flutter/painting/ShapeBorder-class.html
          // https://api.flutter.dev/flutter/painting/OutlinedBorder-class.html
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: () {
            final gpsBloc = BlocProvider.of<GpsBloc>(context);
            gpsBloc.askGpsAccess();
          }, child: const Text('Dar Acceso', style: TextStyle(
          color: Colors.white
        ),),)
      ],
    );
  }
}