import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/movies/movie_masonry_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {

  bool isLoading = false;
  bool isLastPage = false;

  @override
  void initState() {
    loadNextPage();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }



  void loadNextPage() async {
    if(isLoading || isLastPage ) return;

    final movies = await ref.read(favoriteMoviesProvider.notifier).loadNextPage();

    if(movies.isEmpty) isLastPage = true;

  }


  @override
  Widget build(BuildContext context) {

    final favoritesMovies = ref.watch(favoriteMoviesProvider).values.toList();

    return Scaffold(
      body: MovieMasonryWidget(movies: favoritesMovies, loadNexPage: loadNextPage,)
    );
  }
}
