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

