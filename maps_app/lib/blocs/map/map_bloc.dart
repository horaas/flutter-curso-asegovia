import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_app/blocs/blocs.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {

  final LocationBloc locationBloc;
  GoogleMapController? _googleMapController;
  StreamSubscription<LocationState>? locationStateSubscription;

  MapBloc({required this.locationBloc}) : super(const MapState()) {

    on<UpdateUserPolylinesEvent>(_onPolilynes);
    on<OnTogglePolylines>((event, emit) => emit(state.copyWith(showMyRoute: !state.showMyRoute)),);


    on<OnMapInitEvent>(_onInitMap);
  
    on<OnStartFollowingMapEvent>(_onStartFollowUser);
  
    on<OnStopFollowingMapEvent>((event, emit) => emit(state.copyWith(followUser: false)),);

    locationStateSubscription = locationBloc.stream.listen((locationState) {
      print(state.followUser);
      print(locationState.lastLocation);
      if (locationState.lastLocation != null) {
        add(UpdateUserPolylinesEvent(locationState.historyLocation!));
      }
      if(!state.followUser) return;
      if(locationState.lastLocation == null) return;

      moveCamera(locationState.lastLocation!);

    
    
    },);
  }

  _onInitMap(OnMapInitEvent event, Emitter<MapState> emit) {
    _googleMapController = event.googleMapController;
    emit(state.copyWith(isMapInitialized: true, followUser: true));
  }

  _onStartFollowUser(OnStartFollowingMapEvent event, Emitter<MapState> emit) {
    emit(state.copyWith(followUser: true));

    if(locationBloc.state.lastLocation == null) return;

    moveCamera(locationBloc.state.lastLocation!);

  }
  _onPolilynes(UpdateUserPolylinesEvent event, Emitter<MapState> emit) {
    final myRoute = Polyline(polylineId: const PolylineId('myRoute'),
    color: Colors.red,
    width: 5,
    startCap: Cap.roundCap,
    endCap: Cap.roundCap,
    points: event.historyLocation);

    final currentPolylines = Map<String, Polyline>.from(state.polyLines);
    currentPolylines['myRoute'] = myRoute;
    emit(state.copyWith(polyLines: currentPolylines));

  }
  moveCamera(LatLng newLocation) {
    final cameraUpdate = CameraUpdate.newLatLng(newLocation);
    _googleMapController?.animateCamera(cameraUpdate);
  }

  @override
  Future<void> close() {
    locationStateSubscription?.cancel();
    return super.close();
  }
}
