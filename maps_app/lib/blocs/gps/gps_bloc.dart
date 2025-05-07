import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'gps_event.dart';
part 'gps_state.dart';

class GpsBloc extends Bloc<GpsEvent, GpsState> {
  GpsBloc() : super(const GpsState(isGpsEnabled: false, isGpsPermissionsGranted: false)) {
    on<GpsStateEvent>(onGpsEvent);
  }


    
  onGpsEvent(GpsStateEvent event, Emitter<GpsState> emit) => emit(
    state.copyWith(
      isGpsEnabled: event.isGpsEnabled,
      isGpsPermissionsGranted: event.isGpsPermissionsGranted)
  );
}
