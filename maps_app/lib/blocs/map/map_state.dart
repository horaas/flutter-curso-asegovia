part of 'map_bloc.dart';

class MapState extends Equatable {
  final bool isMapInitialized;
  final bool followUser;
  final Map<String, Polyline> polyLines;
  final bool showMyRoute;

  const MapState({this.isMapInitialized = false, this.followUser = false, Map<String, Polyline>? polyLines, this.showMyRoute = false}): polyLines =polyLines ?? const {};

  MapState copyWith({
    bool? isMapInitialized,
    bool? followUser,
    Map<String, Polyline>? polyLines,
    bool? showMyRoute
    }) => MapState(
    isMapInitialized: isMapInitialized ?? this.isMapInitialized,
    followUser: followUser ?? this.followUser,
    polyLines: polyLines ?? this.polyLines,
    showMyRoute: showMyRoute ?? this.showMyRoute,
  );

  @override
  List<Object> get props => [isMapInitialized, followUser, polyLines, showMyRoute];
}
