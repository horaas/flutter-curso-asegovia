import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:maps_app/models/models.dart';


class TrafficService {
  final Dio _dioTraffic = Dio(
    BaseOptions(
      baseUrl: 'https://api.openrouteservice.org',
      queryParameters: {
        'api_key': '5b3ce3597851110001cf6248fcdd86772bd247ccaf6f9fe190b0965c',
      },
    ),
  );


  TrafficService();

  Future<RouteTo> getCoorsStartToEnd(LatLng start, LatLng end) async {
    try {
      final queryParams = {
        'start': '${start.longitude},${start.latitude}',
        'end': '${end.longitude},${end.latitude}',
      };
      final resp = await _dioTraffic.get(
        '/v2/directions/driving-car',
        queryParameters: queryParams,
      );

      final data = TrafficResponse.fromJson(resp.data);
      final endPlace  = await getResultbyGoecode(end);
      final distance = data.features[0].properties.summary.distance;
      final duration = data.features[0].properties.summary.duration;
      final geometry = data.features[0].geometry.coordinates.map((data) => LatLng(data[1],data[0])).toList();

      return RouteTo(points: geometry, duration: duration, distance: distance, endPlace: endPlace);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception('error');
      }
      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }

  Future<List<FeaturePlaces>> getResultbyQuery(LatLng proximity, String query) async {
    try {
      final queryParams = {
        'text': query,
        'focus.point.lon': '${proximity.longitude}', //proximity.longitude,
        'focus.point.lat': '${proximity.latitude}', //proximity.latitude,
      };

      final resp = await _dioTraffic.get(
        '/geocode/search',
        queryParameters: queryParams,
      );

      final placesResponse = PlacesModel.fromJson(resp.data);

      print(placesResponse.features.length);
      return placesResponse.features;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception('error');
      }
      throw Exception();
    } catch (e) {
      print(e.toString());
      throw Exception();
    }
  }
 
  Future<FeaturePlaces> getResultbyGoecode(LatLng proximity) async {
    try {
      final queryParams = {
        'size': 1,
        'point.lon': '${proximity.longitude}', //proximity.longitude,
        'point.lat': '${proximity.latitude}', //proximity.latitude,
      };

      final resp = await _dioTraffic.get(
        '/geocode/reverse',
        queryParameters: queryParams,
      );

      final placesResponse = PlacesModel.fromJson(resp.data);
      return placesResponse.features[0];
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception('error');
      }
      throw Exception();
    } catch (e) {
      print(e.toString());
      throw Exception();
    }
  }
}
