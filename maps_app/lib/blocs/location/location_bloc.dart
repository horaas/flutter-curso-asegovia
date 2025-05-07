import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  StreamSubscription<Position>? geolocatorStrem;

  LocationBloc() : super(const LocationState()) {
    on<LocationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  Future getCurrentPosition() async {
    final position = await Geolocator.getCurrentPosition();
    print('position = $position');
  }

  void startFollowingUser() {
    geolocatorStrem = Geolocator.getPositionStream().listen((position) {
      print('startFollowingUser = $position');
    },);
  }

  stopFollowingUser() {
    geolocatorStrem?.cancel();
  }
  @override
  Future<void> close() {
    stopFollowingUser();
    return super.close();
  }
}
