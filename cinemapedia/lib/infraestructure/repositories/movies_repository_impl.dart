import 'package:cinemapedia/domain/domains.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  final MoviesDatasources moviesSources;

  MoviesRepositoryImpl(this.moviesSources);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return moviesSources.getNowPlaying(page: page);
  }
  
  @override
  Future<List<Movie>> getPupular({int page = 1}) {
    return moviesSources.getPupular(page: page);
  }
  
  @override
  Future<List<Movie>> getTopRate({int page = 1}) {
    return moviesSources.getTopRate(page: page);
  }
  
  @override
  Future<List<Movie>> getUpcomming({int page = 1}) {
    return moviesSources.getUpcomming(page: page);
  }
  
  @override
  Future<Movie> getMovieById(String id) {
    return moviesSources.getMovieById(id);
  }
  
  @override
  Future<List<Movie>> getSearchMovie({required String query}) {
    return moviesSources.getSearchMovie(query: query);
  }
}
