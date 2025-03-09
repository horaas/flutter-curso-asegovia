import 'package:cinemapedia/infraestructure/infraestructure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieRespositoryProvider = Provider((ref) {
  return MoviesRepositoryImpl(MoviedbDatasource());
});
