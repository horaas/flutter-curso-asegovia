import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_app/blocs/blocs.dart';
import 'package:maps_app/config/config.dart';

class MapView extends StatelessWidget {
  final double lat;
  final double lng;
  
  const MapView(this.lat, this.lng, {super.key});

  @override
  Widget build(BuildContext context) {

    final mapBloc = BlocProvider.of<MapBloc>(context);
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width ,
      height: size.height,
      child: GoogleMap(
        mapType: MapType.normal,
        myLocationEnabled: true,
        zoomControlsEnabled: false,
        myLocationButtonEnabled: false,
        style: jsonEncode(uberTheme),
        initialCameraPosition: CameraPosition(
          target: LatLng(lat, lng),
          zoom: 15,
        ),
        onMapCreated: (GoogleMapController controller) => mapBloc.add(OnMapInitEvent(controller)),
      ),
    );
  }
}