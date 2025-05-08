import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {

  GoogleMapController? _googleMapController;

  MapBloc() : super(const MapState()) {

    on<OnMapInitEvent>(_onInitMap);

  }

  _onInitMap(OnMapInitEvent event, Emitter<MapState> emit) {
    _googleMapController = event.googleMapController;
    emit(state.copyWith(isMapInitialized: true));
  }
  moveCamera(LatLng newLocation) {
    final cameraUpdate = CameraUpdate.newLatLng(newLocation);
    _googleMapController?.animateCamera(cameraUpdate);
  }
}
