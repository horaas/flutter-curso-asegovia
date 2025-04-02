import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapState {
  final bool isReady;
  final bool followUser;
  final List<Marker> listMarker;
  final GoogleMapController? googleMapController;

  MapState({this.isReady = false, this.followUser = false, this.listMarker = const[], this.googleMapController});

  MapState copyWith({
  bool? isReady,
  bool? followUser,
  List<Marker>? listMarker,
  GoogleMapController? googleMapController,
  }) => MapState(
    isReady: isReady ?? this.isReady,
    followUser: followUser ?? this.followUser,
    listMarker: listMarker ?? this.listMarker,
    googleMapController:googleMapController ?? this.googleMapController 
  );

}

class MapNotifier extends StateNotifier<MapState> {
  MapNotifier(): super(MapState());

  setMapController(GoogleMapController googleMapController) {
    state = state.copyWith(googleMapController: googleMapController, isReady: true);
  }

  getGeoLocation(double lat, double lng) {
    final newPosition = CameraPosition(target: LatLng(lat, lng), zoom: 15);

    state.googleMapController?.animateCamera(CameraUpdate.newCameraPosition(newPosition));

  }
}

final mapProvider = StateNotifierProvider<MapNotifier, MapState>((ref) {
  return MapNotifier();
});