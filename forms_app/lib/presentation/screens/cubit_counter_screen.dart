import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter cubit'), actions: [
            IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.arrowRotateLeft))
           ],),
      body: Container(),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 1,
            onPressed: () {
              print('hola');
            },

            child: Text('+1'),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 2,
            onPressed: () {
              print('hola');
            },

            child: Text('+2'),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 3,
            onPressed: () {
              print('hola');
            },
            child: Text('+3'),
          ),
        ],
      ),
    );
  }
}
