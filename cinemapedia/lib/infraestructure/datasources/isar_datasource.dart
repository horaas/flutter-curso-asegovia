import 'package:cinemapedia/domain/domains.dart';

class IsarDatasource extends LocalStorageDatasource {
  @override
  Future<bool> isMovieFAvorite(int movieId) {
    // TODO: implement isMovieFAvorite
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) {
    // TODO: implement loadMovies
    throw UnimplementedError();
  }

  @override
  Future<void> toogleFavorites(Movie movie) {
    // TODO: implement toogleFavorites
    throw UnimplementedError();
  }

}
