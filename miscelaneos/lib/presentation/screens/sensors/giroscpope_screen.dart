import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class GiroscpopeScreen extends ConsumerWidget {
  const GiroscpopeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gyroscope = ref.watch(gyroscoperProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Giroscopio')),
      body: Center(
        child: gyroscope.when(
          data:
              (value) => Text(value.toString(), style: TextStyle(fontSize: 30)),
          error: (error, stackTrace) => Text('$error'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
