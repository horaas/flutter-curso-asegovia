import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class LocationScreen extends ConsumerWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = ref.watch(userlocationProvider);
    final watchAsync = ref.watch(watchLocationProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Localización')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'mi locazación',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            location.when(
              data: ( data) => Text('$data'),
              error: (Object error, StackTrace stackTrace) => Text('$error'),
              loading: () => const CircularProgressIndicator(),
            ),
            const SizedBox(height: 50,),
            const Text(
              'mi locazación seguimiento',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            watchAsync.when(
              data: ( data) => Text('$data'),
              error: (Object error, StackTrace stackTrace) => Text('$error'),
              loading: () => const CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
