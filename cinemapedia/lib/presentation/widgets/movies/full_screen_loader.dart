import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessahe() {
    final messages = <String>[
      'hola',
      'como',
      'estas',
      'bien?',
      'yo no',
      'mejor me voy :(',
    ];

    return Stream.periodic(const Duration(milliseconds: 1200), (
      computationCount,
    ) {
      return messages[computationCount];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Espre'),
          const SizedBox(height: 10),
          const CircularProgressIndicator(),
          const SizedBox(height: 10),
          StreamBuilder(stream: getLoadingMessahe(), builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Cargando...');
            return Text(snapshot.data!);
          },)
        ],
      ),
    );
  }
}
