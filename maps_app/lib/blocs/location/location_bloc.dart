import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  StreamSubscription<Position>? geolocatorStrem;

  LocationBloc() : super(const LocationState()) {
    on<OnNewUserLocationEvent>((event, emit) {
      emit(
        state.copyWith(
          lastLocation: event.newLocation,
          historyLocation: [...?state.historyLocation, event.newLocation]
        )
      );
    });
    on<OnStartFollowinUserEvent>((event, emit) {
      emit(state.copyWith(followeingUser: true));
    });
    on<OnStopFollowinUserEvent>((event, emit) {
      emit(state.copyWith(followeingUser: false));
    });
  }

  Future getCurrentPosition() async {
    final position = await Geolocator.getCurrentPosition();
    print('position = $position');
  }

  void startFollowingUser() {
    add(const OnStartFollowinUserEvent());
    geolocatorStrem = Geolocator.getPositionStream().listen((event) {
      print('startFollowingUser = $event');
      final postion = event;
      add(OnNewUserLocationEvent(LatLng(postion.latitude, postion.longitude)));
    },);
  }

  stopFollowingUser() {
    print('stopFollowingUser');
    add(const OnStopFollowinUserEvent());
    geolocatorStrem?.cancel();
  }
  @override
  Future<void> close() {
    stopFollowingUser();
    return super.close();
  }
}
