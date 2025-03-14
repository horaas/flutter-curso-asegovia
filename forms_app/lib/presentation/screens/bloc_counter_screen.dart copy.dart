import 'package:flutter/material.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter Bloc')),
      body: Container(),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              print('hola');
            },

            child: Text('+1'),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              print('hola');
            },

            child: Text('+2'),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
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
