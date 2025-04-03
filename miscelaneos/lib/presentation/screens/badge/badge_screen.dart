import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class BadgeScreen extends ConsumerWidget {
  const BadgeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final badgeCounter = ref.watch(badgeCounterProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Badge')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Badge(
              label: Text('$badgeCounter'),
              alignment: Alignment.lerp(Alignment.topRight, Alignment.bottomRight, 0.15),
               child: Text(
                '$badgeCounter',
                style: const TextStyle(fontSize: 150, fontWeight: FontWeight.bold),
                           ),
             ),
            FilledButton(onPressed: () {
              ref.invalidate(badgeCounterProvider);
            }, child: const Text('Resetear')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(badgeCounterProvider.notifier).update((state) => state + 1,);
        },
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}
