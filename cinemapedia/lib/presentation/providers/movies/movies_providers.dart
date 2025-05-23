import 'package:cinemapedia/domain/domains.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_respository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayinMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final movieCallback = ref.watch(movieRespositoryProvider).getNowPlaying;
  return MoviesNotifier(
    movieCallback:  movieCallback
    );
});

final popularMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final movieCallback = ref.watch(movieRespositoryProvider).getPupular;
  return MoviesNotifier(
    movieCallback:  movieCallback
    );
});

final topRatedMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final movieCallback = ref.watch(movieRespositoryProvider).getTopRate;
  return MoviesNotifier(
    movieCallback:  movieCallback
    );
});

final upcommingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final movieCallback = ref.watch(movieRespositoryProvider).getUpcomming;
  return MoviesNotifier(
    movieCallback:  movieCallback
    );
});

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>>{
  int currentPage = 0;
  bool isLoading = false;

  final MovieCallback movieCallback;

  MoviesNotifier({required this.movieCallback}): super([]);

  Future<void> loadNextPage() async {
    if (isLoading) return;

    currentPage++;

    final List<Movie> movies = await movieCallback(page: currentPage);
    state = [...state, ...movies];
    await Future.delayed(const Duration(microseconds: 400));

    isLoading = false;
  }

}