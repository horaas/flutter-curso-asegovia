import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class PermissionsScreen extends ConsumerWidget {
  const PermissionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final permisions = ref.watch(permissionsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: Column(
        children: [
          CheckboxListTile(
            value: permisions.cameraGranted,
            onChanged: (value) {
              ref.read(permissionsProvider.notifier).checkCamera();
            },
            title: Text('Camára'),
            subtitle: Text('status ${permisions.camera}'),
          ),
          CheckboxListTile(
            value: permisions.photoLibraryGranted,
            onChanged: (value) {
              ref.read(permissionsProvider.notifier).checkPhotoGalery();
            },
            title: Text('Galería de fotos'),
            subtitle: Text('status ${permisions.photoLibrary}'),
          ),
          CheckboxListTile(
            value: permisions.locationGranted,
            onChanged: (value) {
              ref.read(permissionsProvider.notifier).checkLocations();
            },
            title: Text('Localización'),
            subtitle: Text('status ${permisions.location}'),
          ),
          CheckboxListTile(
            value: permisions.sensorsGranted,
            onChanged: (value) {
              ref.read(permissionsProvider.notifier).checkSensor();
            },
            title: Text('Sensors'),
            subtitle: Text('status ${permisions.sensors}'),
          ),
        ],
      ),
    );
  }
}
