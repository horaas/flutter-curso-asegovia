

part of 'location_bloc.dart';
class LocationState extends Equatable {
  final LatLng? lastLocation;
  final List<LatLng>? historyLocation;
  final bool followeingUser;



  const LocationState({this.lastLocation, historyLocation, this.followeingUser = false}): historyLocation = historyLocation ?? const [];
  
  LocationState copyWith({
    LatLng? lastLocation,
    List<LatLng>? historyLocation,
    bool? followeingUser,
  }) => LocationState(
    lastLocation: lastLocation ?? this.lastLocation,
    historyLocation: historyLocation ?? this.historyLocation,
    followeingUser: followeingUser ?? this.followeingUser,
  );

  @override
  List<Object?> get props => [lastLocation, historyLocation, followeingUser];
}
