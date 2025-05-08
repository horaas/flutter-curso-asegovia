import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:maps_app/blocs/blocs.dart';
import 'package:maps_app/presentation/views/views.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late LocationBloc locationBloc;

  @override
  void initState() {
    super.initState();
    locationBloc = BlocProvider.of<LocationBloc>(context);

    locationBloc.startFollowingUser();
  }

  @override
  void dispose() {
    locationBloc.stopFollowingUser();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(builder: (context, state) {
        if (state.lastLocation == null) return const Center(child: Text('sin mapa'),);

        return SingleChildScrollView(child: _ContentMap(state.lastLocation!));
      },),
    );
  }
}

class _ContentMap extends StatelessWidget {
  final LatLng lastLocation;

  const _ContentMap(this.lastLocation);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MapView(lastLocation.latitude, lastLocation.longitude),
         Positioned(
          bottom: 40,
          left: 20,
          child: IconButton.filledTonal(
            onPressed: () {

            },
            icon: const Icon(Icons.location_searching),
          ),
        ),
        Positioned(
          bottom: 90,
          left: 20,
          child: IconButton.filledTonal(
            onPressed: () {
            },
            icon: const Icon(Icons.directions_run)//userLocation.followUser ? const Icon(Icons.directions_run) :const Icon(Icons.accessibility_new_outlined) ,
          ),
        ),
        Positioned(
          bottom: 140,
          left: 20,
          child: IconButton.filledTonal(
            onPressed: () {

            },
            icon: const Icon(Icons.pin_drop),
          ),
        ),
      ],
    );
  }
}
