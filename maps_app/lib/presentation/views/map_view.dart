import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_app/blocs/blocs.dart';
import 'package:maps_app/config/config.dart';

class MapView extends StatelessWidget {
  final double lat;
  final double lng;
  final Set<Polyline>polylines;
  const MapView(this.lat, this.lng, {super.key, required this.polylines});

  @override
  Widget build(BuildContext context) {

    final mapBloc = BlocProvider.of<MapBloc>(context);
    final locationBloc = BlocProvider.of<LocationBloc>(context);
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width ,
      height: size.height,
      child: Listener(
        onPointerMove: (event) => mapBloc.add(const OnStopFollowingMapEvent()),
        child: GoogleMap(
          mapType: MapType.normal,
          myLocationEnabled: true,
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          style: jsonEncode(uberTheme),
          polylines: polylines,
          initialCameraPosition: CameraPosition(
            target: LatLng(lat, lng),
            zoom: 15,
          ),
          onMapCreated: (GoogleMapController controller) => mapBloc.add(OnMapInitEvent(controller)),
        ),
      ),
    );
  }
}