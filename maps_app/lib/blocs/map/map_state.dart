part of 'map_bloc.dart';

class MapState extends Equatable {
  final bool isMapInitialized;
  final bool followUser;
  final Map<String, Polyline> polyLines;
  final Map<String, Marker> markers;
  final bool showMyRoute;

  const MapState({this.isMapInitialized = false, this.followUser = false, Map<String, Polyline>? polyLines, this.showMyRoute = false, Map<String, Marker>? markers}):
  polyLines = polyLines ?? const {},markers = markers ?? const {};

  MapState copyWith({
    bool? isMapInitialized,
    bool? followUser,
    Map<String, Polyline>? polyLines,
    bool? showMyRoute,
    Map<String, Marker>? markers
    }) => MapState(
    isMapInitialized: isMapInitialized ?? this.isMapInitialized,
    followUser: followUser ?? this.followUser,
    polyLines: polyLines ?? this.polyLines,
    showMyRoute: showMyRoute ?? this.showMyRoute,
    markers: markers ?? this.markers,
  );

  @override
  List<Object> get props => [isMapInitialized, followUser, polyLines, showMyRoute, markers];
}
