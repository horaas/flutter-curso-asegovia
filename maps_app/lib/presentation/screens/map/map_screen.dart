import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:maps_app/blocs/blocs.dart';
import 'package:maps_app/presentation/ui/ui.dart';
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
    final locationBloc = BlocProvider.of<LocationBloc>(context);
    final mapBloc = BlocProvider.of<MapBloc>(context);
    return Stack(
      children: [
        BlocBuilder<MapBloc, MapState>(builder: (context, state) {
          final Map<String, Polyline> polylines = Map.from(state.polyLines);
          if (!state.showMyRoute) {
            polylines.removeWhere((key, value) => key == 'myRoute',);
          }
          return MapView(lastLocation.latitude, lastLocation.longitude,polylines: polylines.values.toSet(),);
        }),
         Positioned(
          bottom: 40,
          left: 20,
          child: IconButton.filledTonal(
            onPressed: () {
              final userLocation = locationBloc.state.lastLocation;
              if (userLocation == null) {
                final snack = CustomSnackbar(message: 'no hay');
                ScaffoldMessenger.of(context).showSnackBar(snack);
                return;
              }
              
              mapBloc.moveCamera(userLocation);
            },
            icon: const Icon(Icons.location_searching),
          ),
        ),
        Positioned(
          bottom: 90,
          left: 20,
          child: BlocBuilder<MapBloc, MapState>(
            builder: (context, state) => IconButton.filledTonal(
              onPressed: () {
                mapBloc.add(const OnStartFollowingMapEvent());
              },
              icon: state.followUser ? const Icon(Icons.directions_run) :const Icon(Icons.accessibility_new_outlined) ,
            ),
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
        Positioned(
          bottom: 180,
          left: 20,
          child: IconButton.filledTonal(
            onPressed: () {
                mapBloc.add(const OnStopFollowingMapEvent());
            },
            icon: const Icon(Icons.close),
          ),
        ),
        Positioned(
          bottom: 240,
          left: 20,
          child: IconButton.filledTonal(
            onPressed: () {
                mapBloc.add(const OnTogglePolylines());
            },
            icon: const Icon(Icons.route),
          ),
        ),
      ],
    );
  }
}
