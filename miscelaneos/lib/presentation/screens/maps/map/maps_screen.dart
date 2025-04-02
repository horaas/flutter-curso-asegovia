import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class MapsScreen extends ConsumerWidget {
  const MapsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = ref.watch(locationProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Maps')),
      body: location.when(
        data: (data) => _MapView(lat: data.$1, lng: data.$2),
        error: (Object error, StackTrace stackTrace) => Text('$error'),
        loading: () => const CircularProgressIndicator(),
      ),

      // const Center(
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [

      //       Text('mapa', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      //     ],
      //   ),
      // ),
    );
  }
}


class _MapView extends StatefulWidget {
  final double lat;
final double lng;
  const _MapView({required this.lat, required this.lng});

  @override
  State<_MapView> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<_MapView> {

   @override
   Widget build(BuildContext context) {
       return GoogleMap(
        mapType: MapType.normal,
        myLocationEnabled: true,
        zoomControlsEnabled: false,
        myLocationButtonEnabled: false,
        initialCameraPosition: CameraPosition(target: LatLng(widget.lat, widget.lng), zoom: 15),
        onMapCreated: (GoogleMapController controller) {
          // _controller.complete(controller);
        },
      );
  }
}