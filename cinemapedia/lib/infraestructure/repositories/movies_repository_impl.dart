import 'package:cinemapedia/domain/domains.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  final MoviesDatasources moviesSources;

  MoviesRepositoryImpl(this.moviesSources);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {}
}
