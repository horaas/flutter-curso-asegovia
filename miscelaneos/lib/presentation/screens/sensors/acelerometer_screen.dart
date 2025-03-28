import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class AcelerometerScreen extends ConsumerWidget {

  const AcelerometerScreen({ super.key });

   @override
  Widget build(BuildContext context, WidgetRef ref) {
    final acelerometerGravity = ref.watch(acelerometerGravityProvider);
    final acelerometerUser = ref.watch(acelerometerUserProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Giroscopio')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: acelerometerGravity.when(
              data:
                  (value) =>
                      Text(value.toString(), style: TextStyle(fontSize: 30)),
              error: (error, stackTrace) => Text('$error'),
              loading: () => const CircularProgressIndicator(),
            ),
          ),
          Center(
            child: acelerometerUser.when(
              data:
                  (value) =>
                      Text(value.toString(), style: TextStyle(fontSize: 30)),
              error: (error, stackTrace) => Text('$error'),
              loading: () => const CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}