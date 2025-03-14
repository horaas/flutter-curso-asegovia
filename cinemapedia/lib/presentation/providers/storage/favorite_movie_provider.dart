import 'package:cinemapedia/domain/domains.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteMoviesProvider = StateNotifierProvider((ref) {
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);
  return _FavoriteMoviesNotifier(localStorageRepository: localStorageRepository);
},);


class _FavoriteMoviesNotifier extends StateNotifier<Map<int, Movie>>{

  int currentPage = 0;
  final LocalStorageRepository localStorageRepository;

  _FavoriteMoviesNotifier({required this.localStorageRepository}): super({});

  Future<void> loadNextPage() async {
    final movies = await localStorageRepository.loadMovies(offset: currentPage * 10);
    currentPage++;

    final tempMovies = <int, Movie>{};
    for (var movie in movies) {
      tempMovies[movie.id] = movie;
    }

    state = {...state, ...tempMovies};
  }

}