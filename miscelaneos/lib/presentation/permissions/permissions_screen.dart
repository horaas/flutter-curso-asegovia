import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PermissionsScreen extends ConsumerWidget {
  const PermissionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: Column(
        children: [
          CheckboxListTile(
            value: false,
            onChanged: (value) {},
            title: Text('Camára'),
            subtitle: Text('permiso'),
          ),
          CheckboxListTile(
            value: false,
            onChanged: (value) {},
            title: Text('Permiso'),
          ),
          CheckboxListTile(
            value: false,
            onChanged: (value) {},
            title: Text('Permiso'),
          ),
          CheckboxListTile(
            value: false,
            onChanged: (value) {},
            title: Text('Permiso'),
          ),
          CheckboxListTile(
            value: false,
            onChanged: (value) {},
            title: Text('Permiso'),
          ),
          CheckboxListTile(
            value: false,
            onChanged: (value) {},
            title: Text('Permiso'),
          ),
        ],
      ),
    );
  }
}
