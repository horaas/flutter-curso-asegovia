import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:maps_app/models/models.dart';

class RouteTo {

  final List<LatLng> points;
  final double duration;
  final double distance;
  final FeaturePlaces endPlace;

  RouteTo( {
    required this.points, 
    required this.duration, 
    required this.distance,
    required this.endPlace,
  });

}