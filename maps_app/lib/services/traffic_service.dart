import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:maps_app/models/models.dart';

import 'package:maps_app/services/services.dart';

class TrafficService {
  final Dio _dioTraffic = Dio(
    BaseOptions(
      baseUrl: 'https://api.openrouteservice.org/v2',
      queryParameters: {
        'api_key': '5b3ce3597851110001cf6248fcdd86772bd247ccaf6f9fe190b0965c',
      },
    ),
  );

  final String _baseTrafficUrl = 'https://api.openrouteservice.org/v2';

  TrafficService();

  Future<RouteTo> getCoorsStartToEnd(LatLng start, LatLng end) async {
    try {
      final queryParams = {
        'start': '${start.longitude},${start.latitude}',
        'end': '${end.longitude},${end.latitude}',
      };
      final resp = await _dioTraffic.get(
        '/directions/driving-car',
        queryParameters: queryParams,
      );

      final data = TrafficResponse.fromJson(resp.data);

      final distance = data.features[0].properties.summary.distance;
      final duration = data.features[0].properties.summary.duration;
      final geometry = data.features[0].geometry.coordinates.map((data) => LatLng(data[1],data[0])).toList();

      return RouteTo(points: geometry, duration: duration, distance: distance);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception('error');
      }
      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }
}
