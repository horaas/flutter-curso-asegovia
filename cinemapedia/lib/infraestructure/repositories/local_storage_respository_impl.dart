import 'package:cinemapedia/domain/domains.dart';

class LocalStorageRespositoryImpl extends LocalStorageRepository {

  final LocalStorageDatasource datasource;

  LocalStorageRespositoryImpl({required this.datasource});

  @override
  Future<bool> isMovieFAvorite(int movieId) {
    return datasource.isMovieFAvorite(movieId);
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) {
    return datasource.loadMovies(limit:limit, offset:offset);
  }

  @override
  Future<void> toogleFavorites(Movie movie) {
    return datasource.toogleFavorites(movie);
  }

}
