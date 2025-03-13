import 'package:cinemapedia/domain/domains.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarDatasource extends LocalStorageDatasource {
  late Future<Isar> db;
  IsarDatasource() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final directory = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [MovieSchema],
        inspector: true,
        directory: directory.path,
      );
    }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<bool> isMovieFAvorite(int movieId) async {
    final isar = await db;

    final Movie? isFAvoriteMovie =
        await isar.movies.filter().idEqualTo(movieId).findFirst();

    return isFAvoriteMovie != null;
  }

  @override
  Future<void> toogleFavorites(Movie movie) async {
    final isar = await db;
    final favoriteMovie =
        await isar.movies.filter().idEqualTo(movie.id).findFirst();

    if (favoriteMovie != null) {
      
      isar.writeTxnSync(() => isar.movies.delete(favoriteMovie.idIsar!),);
      return;
      
    }

    isar.writeTxnSync(() => isar.movies.putSync(movie),);
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) async {
    final isar = await db;

    return isar.movies.where().offset(offset).limit(limit).findAll();
  }
}
