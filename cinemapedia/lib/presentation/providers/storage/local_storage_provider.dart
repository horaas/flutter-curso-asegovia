import 'package:cinemapedia/infraestructure/infraestructure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localStorageRepositoryProvider = Provider((ref) => LocalStorageRespositoryImpl(datasource: IsarDatasource()),);

final isFavoriteProvider = FutureProvider.family.autoDispose((ref, int movieId) {
  final localStorage = ref.watch(localStorageRepositoryProvider);
  return localStorage.isMovieFAvorite(movieId);
});