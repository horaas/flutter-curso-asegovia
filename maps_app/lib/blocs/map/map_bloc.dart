import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_app/blocs/blocs.dart';
import 'package:maps_app/helpers/custom_image_marker.dart';
import 'package:maps_app/models/models.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {

  final LocationBloc locationBloc;
  GoogleMapController? _googleMapController;
  StreamSubscription<LocationState>? locationStateSubscription;
  LatLng? mapCenter;

  MapBloc({required this.locationBloc}) : super(const MapState()) {

    on<UpdateUserPolylinesEvent>(_onPolilynes);
    on<OnTogglePolylines>((event, emit) => emit(state.copyWith(showMyRoute: !state.showMyRoute)),);


    on<OnMapInitEvent>(_onInitMap);
  
    on<OnStartFollowingMapEvent>(_onStartFollowUser);
  
    on<OnStopFollowingMapEvent>((event, emit) => emit(state.copyWith(followUser: false)),);

    on<OnDisplayPolylinesEvent>((event, emit) => emit(state.copyWith(polyLines: event.polylines, markers: event.markers)),);

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
  Future drawPolylines(RouteTo destination) async {
    final myRoute = Polyline(
      polylineId: const PolylineId('route'),
      color: Colors.red,
      width: 5,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
      points: destination.points);

    final iconStart = await getAssetsImageMarker();
    final iconEnd = await getUrlImageMarker();

    final startMarker = Marker(
      markerId: const MarkerId('start'),
      position: destination.points.first,
      infoWindow: const InfoWindow(title: 'fin', snippet: 'gola mundo'),
      icon: iconStart
    );
    final endMarker = Marker(
      markerId: const MarkerId('end'),
      position: destination.points.last,
      infoWindow: InfoWindow(
        title: 'fin',
        snippet: destination.endPlace.properties.label,
      ),
      icon: iconEnd,
      
    );


    final routePolylines = Map<String, Polyline>.from(state.polyLines);
    routePolylines['route'] = myRoute;

    final markers =  Map<String, Marker>.from(state.markers);
    markers['start'] = startMarker;
    markers['end'] = endMarker;


    add(OnDisplayPolylinesEvent(routePolylines, markers));
    await Future.delayed(const Duration(milliseconds: 300));
    _googleMapController?.showMarkerInfoWindow(const MarkerId('end'));

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
