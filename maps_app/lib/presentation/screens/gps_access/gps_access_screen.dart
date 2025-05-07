import 'package:flutter/material.dart';

class GpsAccessScreen extends StatelessWidget {

  const GpsAccessScreen({ super.key });

   @override
   Widget build(BuildContext context) {
       return const Scaffold(
           body: Center(
            child: _AccesButton(),
           ),
       );
  }
}

class _EnabledGpsMessage extends StatelessWidget {
  const _EnabledGpsMessage();

  @override
  Widget build(BuildContext context) {
    return const Text('acceso concedido');
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
          
        }, child: const Text('Dar Acceso', style: TextStyle(
          color: Colors.white
        ),),)
      ],
    );
  }
}