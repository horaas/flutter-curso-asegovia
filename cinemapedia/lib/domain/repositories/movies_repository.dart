import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getNowPlaying({int page = 1});
  Future<List<Movie>> getPupular({int page = 1});
  Future<List<Movie>> getTopRate({int page = 1});
  Future<List<Movie>> getUpcomming({int page = 1});
  Future<Movie> getMovieById(String id);
  Future<List<Movie>> getSearchMovie(String query);
}
