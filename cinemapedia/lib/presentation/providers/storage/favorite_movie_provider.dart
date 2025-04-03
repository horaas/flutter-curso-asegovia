import 'package:cinemapedia/domain/domains.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteMoviesProvider = StateNotifierProvider((ref) {
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);
  return _FavoriteMoviesNotifier(
    localStorageRepository: localStorageRepository,
  );
});

class _FavoriteMoviesNotifier extends StateNotifier<Map<int, Movie>> {
  int currentPage = 0;
  final LocalStorageRepository localStorageRepository;

  _FavoriteMoviesNotifier({required this.localStorageRepository}) : super({});

  Future<List<Movie>> loadNextPage() async {
    final movies = await localStorageRepository.loadMovies(
      offset: currentPage * 10,
      limit: 20,
    );
    currentPage++;

    final tempMovies = <int, Movie>{};
    for (var movie in movies) {
      tempMovies[movie.id] = movie;
    }

    state = {...state, ...tempMovies};

    return movies;
  }

  Future<void> toogleFavorite(Movie movie) async {
    await localStorageRepository.toogleFavorites(movie);
    final bool isMoviFavorite = state[movie.id] != null;

    if (isMoviFavorite) {
      state.remove(movie.id);
      state = {...state};
    } else {
      state = {...state, movie.id: movie};
    }


  }
}
