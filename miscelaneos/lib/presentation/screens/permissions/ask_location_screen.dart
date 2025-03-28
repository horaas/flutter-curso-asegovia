import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class AskLocationScreen extends ConsumerWidget {
  const AskLocationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Permisos')),
      body: Center(
        child: FilledButton(
          child: Text('Permisos necesarios'),
          onPressed: () {
            ref.read(permissionsProvider.notifier).checkLocations();
          },
        ),
      ),
    );
  }
}
