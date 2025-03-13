import 'package:cinemapedia/domain/domains.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarDatasource extends LocalStorageDatasource {
  late Future<Isar> db;
  IsarDatasource() {
    db: openDB;
  }

  Future<Isar> openDB() async {
    final directory = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([MovieSchema], inspector: true, directory: directory.path);
    }
    return Future.value(Isar.getInstance());
  }
  
  @override
  Future<bool> isMovieFAvorite(int movieId) {
    // TODO: implement isMovieFAvorite
    throw UnimplementedError();
  }

  @override
  Future<void> toogleFavorites(Movie movie) {
    // TODO: implement toogleFavorites
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) {
    // TODO: implement loadMovies
    throw UnimplementedError();
  }
}
