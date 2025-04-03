import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapState {
  final bool isReady;
  final bool followUser;
  final List<Marker> listMarker;
  final GoogleMapController? googleMapController;

  MapState({
    this.isReady = false,
    this.followUser = false,
    this.listMarker = const [],
    this.googleMapController,
  });

  MapState copyWith({
    bool? isReady,
    bool? followUser,
    List<Marker>? listMarker,
    GoogleMapController? googleMapController,
  }) => MapState(
    isReady: isReady ?? this.isReady,
    followUser: followUser ?? this.followUser,
    listMarker: listMarker ?? this.listMarker,
    googleMapController: googleMapController ?? this.googleMapController,
  );

    Set<Marker> get setMarkers {
    return Set.from(listMarker);
  }
}

class MapNotifier extends StateNotifier<MapState> {
  StreamSubscription? streamSubscriptionUser;
  (double, double)? lastUbication;

  MapNotifier() : super(MapState()) {
    trackUser().listen((event) {
      lastUbication = (event.$1, event.$2);
    });
  }

  Stream<(double, double)> trackUser() async* {
    await for (final position in Geolocator.getPositionStream()) {
      yield (position.latitude, position.longitude);
    }
  }

  setMapController(GoogleMapController googleMapController) {
    state = state.copyWith(
      googleMapController: googleMapController,
      isReady: true,
    );
  }

  goToLocation(double lat, double lng) {
    final newPosition = CameraPosition(target: LatLng(lat, lng), zoom: 15);

    state.googleMapController?.animateCamera(
      CameraUpdate.newCameraPosition(newPosition),
    );
  }

  toggFollowUser() {
    state = state.copyWith(followUser: !state.followUser);

    if (state.followUser) {
      streamSubscriptionUser = trackUser().listen((event) {
        goToLocation(event.$1, event.$2);
      });
    } else {
      streamSubscriptionUser?.cancel();
    }
  }

  findUser() {
    if (lastUbication == null) return;
    final (lat, lng) = lastUbication!;

    goToLocation(lat, lng);
  }



  void handleAddMarker() {
    if (lastUbication == null) return;
    final (lat, lng) = lastUbication!;

    addMarker(lat, lng, 'por aqui poase yo');
  }

  void addMarker(double latitude, double longitude, String name) {
    final marker = Marker(
      markerId: MarkerId('${state.listMarker.length}'),
      position: LatLng(latitude, longitude),
      infoWindow: InfoWindow(title: name, snippet: 'por aquí'),
    );
    state = state.copyWith(listMarker: [...state.listMarker, marker]);
  }
}

final mapProvider = StateNotifierProvider.autoDispose<MapNotifier, MapState>((ref) {
  return MapNotifier();
});
