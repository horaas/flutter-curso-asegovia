import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class BiometricScreen extends ConsumerWidget {
  const BiometricScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkBiometric = ref.watch(canCheckBiometricProvider);
    final localAuthState = ref.watch(localAuthProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Biometria')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: () {
                ref.read(localAuthProvider.notifier).autenticateUser();
              },
              icon: const Icon(Icons.fingerprint_sharp),
              label: const Text(
                'Identificarse',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.blue),
                iconColor: WidgetStatePropertyAll(Colors.white),
              ),
            ),
            checkBiometric.when(
              data: (bool data) => Text('Estatus: xxx $data'),
              error:
                  (Object error, StackTrace stackTrace) =>
                      Text('Error: xxx $error'),
              loading: () => const CircularProgressIndicator(),
            ),
            Text('este es su estado: $localAuthState', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}
