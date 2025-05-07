import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

part 'gps_event.dart';
part 'gps_state.dart';

enum ServicesStatusEnum {
  disabled,
  enabled
}
class GpsBloc extends Bloc<GpsEvent, GpsState> {

  StreamSubscription? gpsSubscription;

  GpsBloc() : super(const GpsState(isGpsEnabled: false, isGpsPermissionsGranted: false)) {
    _init();
    on<GpsStateEvent>(onGpsEvent);
  }


    
  onGpsEvent(GpsStateEvent event, Emitter<GpsState> emit) => emit(
    state.copyWith(
      isGpsEnabled: event.isGpsEnabled,
      isGpsPermissionsGranted: event.isGpsPermissionsGranted)
  );
  
  Future<void> _init() async {
    final isenabled = await _checkGpsStatus();
    
    // si se sta dentro del mismo bloc
    add(GpsStateEvent(isGpsEnabled: isenabled, isGpsPermissionsGranted: state.isGpsPermissionsGranted));
  }

  Future<bool> _checkGpsStatus() async {

    final isenabled = await Geolocator.isLocationServiceEnabled();
    gpsSubscription = Geolocator.getServiceStatusStream().listen((event) {

      final isenabled = event.index == 0 ? false : true;
      add(GpsStateEvent(isGpsEnabled: isenabled, isGpsPermissionsGranted: state.isGpsPermissionsGranted));
      print('service $isenabled');
    },);

    return isenabled;
  }
  Future<void> askGpsAccess() async {
    final status = await Permission.location.request();

    switch (status) {

      case PermissionStatus.granted:
        add(GpsStateEvent(isGpsEnabled: state.isGpsEnabled, isGpsPermissionsGranted: true));
        break;
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.limited:
      case PermissionStatus.permanentlyDenied:
      case PermissionStatus.provisional:
        add(GpsStateEvent(isGpsEnabled: state.isGpsEnabled, isGpsPermissionsGranted: false));
        openAppSettings();
    }
  }

  @override
  Future<void> close() {
    gpsSubscription?.cancel();
    return super.close();
  }
}


