import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pelis_app/presentation/providers/counter_provider.dart';
import 'package:pelis_app/presentation/providers/light_mode_provider.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter screen Riverpod'),
        actions: [
          IconButton(
            icon: isDarkMode ?
            const Icon(Icons.light_mode_outlined) :
            const Icon(Icons.dark_mode_outlined),
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).update((state) => !state);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Text('Click -> $clickCounter', style: Theme.of(context).textTheme.titleLarge,),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.plus_one_outlined),
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
          // ref.read(counterProvider.notifier).update((state) => state + 1);
        },
      ),
    );
  }
}
