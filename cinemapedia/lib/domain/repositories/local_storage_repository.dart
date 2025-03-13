import 'package:cinemapedia/domain/domains.dart';

abstract class LocalStorageRepository {
  Future<void> toogleFavorites(Movie movie);
  Future<bool> isMovieFAvorite(int movieId);
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0});
}