import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class ControlledMapScreen extends ConsumerWidget {
  const ControlledMapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final userInitialPosition = ref.watch(userlocationProvider);
    // final location = ref.watch(locationProvider);
    return Scaffold(
      body: userInitialPosition.when(
        data: (data) => _MapAndControll(lat: data.$1, lng: data.$2),
        error: (Object error, StackTrace stackTrace) => Text('$error'),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class _MapAndControll extends ConsumerWidget {
  final double lat;
  final double lng;
  const _MapAndControll({required this.lat, required this.lng});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userLocation = ref.watch(mapProvider);
    return Stack(
      children: [
        _MapView(lat: lat, lng: lng),
        Positioned(
          top: 40,
          left: 20,
          child: IconButton.filledTonal(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
         Positioned(
          bottom: 40,
          left: 20,
          child: IconButton.filledTonal(
            onPressed: () {
              ref.read(mapProvider.notifier).findUser();
            },
            icon: const Icon(Icons.location_searching),
          ),
        ),
         Positioned(
          bottom: 90,
          left: 20,
          child: IconButton.filledTonal(
            onPressed: () {
               ref.read(mapProvider.notifier).toggFollowUser();
            },
            icon: userLocation.followUser ? const Icon(Icons.directions_run) :const Icon(Icons.accessibility_new_outlined) ,
          ),
        ),
         Positioned(
          bottom: 140,
          left: 20,
          child: IconButton.filledTonal(
            onPressed: () {
              ref.read(mapProvider.notifier).handleAddMarker();
            },
            icon: const Icon(Icons.pin_drop),
          ),
        ),
      ],
    );
  }
}

class _MapView extends ConsumerStatefulWidget {
  final double lat;
  final double lng;
  const _MapView({required this.lat, required this.lng});

  @override
  MapsScreenState createState() => MapsScreenState();
}

class MapsScreenState extends ConsumerState<_MapView> {
  @override
  Widget build(BuildContext context) {
    final userLocation = ref.watch(mapProvider);
    return GoogleMap(
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      initialCameraPosition: CameraPosition(
        target: LatLng(widget.lat, widget.lng),
        zoom: 15,
      ),
      onMapCreated: (GoogleMapController controller) {
        ref.read(mapProvider.notifier).setMapController(controller);
      },
      markers: userLocation.setMarkers,
      onLongPress: (argument) {
        ref.read(mapProvider.notifier).addMarker(argument.latitude, argument.longitude, 'personalizado');
      },
    );
  }
}
