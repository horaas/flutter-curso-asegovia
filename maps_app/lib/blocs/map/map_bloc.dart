import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_app/blocs/blocs.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {

  final LocationBloc locationBloc;

  GoogleMapController? _googleMapController;

  MapBloc({required this.locationBloc}) : super(const MapState()) {

    on<OnMapInitEvent>(_onInitMap);
  
    on<OnStartFollowingMapEvent>(_onStartFollowUser);
  
    on<OnStopFollowingMapEvent>((event, emit) => emit(state.copyWith(followUser: false)),);

    locationBloc.stream.listen((locationState) {
      print(state.followUser);
      print(locationState.lastLocation);
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
  moveCamera(LatLng newLocation) {
    final cameraUpdate = CameraUpdate.newLatLng(newLocation);
    _googleMapController?.animateCamera(cameraUpdate);
  }
}
