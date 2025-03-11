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
}
