part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class OnMapInitEvent extends MapEvent {
  final GoogleMapController googleMapController;

  const OnMapInitEvent(this.googleMapController);
}
class OnStartFollowingMapEvent extends MapEvent {
  const OnStartFollowingMapEvent();
}
class OnStopFollowingMapEvent extends MapEvent {
  const OnStopFollowingMapEvent();
}


class UpdateUserPolylinesEvent extends MapEvent {
  final List<LatLng> historyLocation;
  const UpdateUserPolylinesEvent(this.historyLocation);
}
class OnTogglePolylines extends MapEvent {
  const OnTogglePolylines();
}
class OnDisplayPolylinesEvent extends MapEvent {
  final Map<String, Polyline> polylines;
  final Map<String, Marker> markers;
  const OnDisplayPolylinesEvent(this.polylines, this.markers);
}

