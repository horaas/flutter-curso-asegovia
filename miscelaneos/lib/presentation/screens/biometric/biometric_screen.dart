import 'package:flutter/material.dart';

class BiometricScreen extends StatelessWidget {
  const BiometricScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Biometria')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.fingerprint_sharp),
              label: const Text('Identificarse', style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),),
              style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.blue), iconColor:  WidgetStatePropertyAll(Colors.white)),
            ),
            const Text('Estatus: xxx'),
          ],
        ),
      ),
    );
  }
}
