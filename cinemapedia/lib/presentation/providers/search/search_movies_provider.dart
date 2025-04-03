import 'package:cinemapedia/domain/domains.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = StateProvider<String>((reg) => '');

final searchMoviesProviders =
    StateNotifierProvider<SerachMovieNotifier, List<Movie>>((ref) {
      final movieRepostory = ref.read(movieRespositoryProvider).getSearchMovie;

      return SerachMovieNotifier(ref: ref, searchmovieCalback: movieRepostory);
    });

typedef SearchmovieCalback = Future<List<Movie>> Function(String query);

class SerachMovieNotifier extends StateNotifier<List<Movie>> {
  final SearchmovieCalback searchmovieCalback;
  final Ref ref;

  SerachMovieNotifier({required this.searchmovieCalback, required this.ref})
    : super([]);

  Future<List<Movie>> searhMovieByQuery(String query) async {
    final List<Movie> search = await searchmovieCalback(query);
    ref.read(searchQueryProvider.notifier).update((state) => query);

    return search;
  }
}
