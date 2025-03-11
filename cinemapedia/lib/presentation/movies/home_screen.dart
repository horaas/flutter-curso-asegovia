import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottonNavigationbar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayinMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final moviesNowPlaying = ref.watch(nowPlayinMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideShowProvider);

    return Column(
      children: [
        const CustomAppBar(),
        MoviesSlideShow(movies: slideShowMovies),
        MovieHorizontalListview(
          movies: moviesNowPlaying,
          title: 'En Cines',
          subtitle: 'Lunes 20',
          loadNextPage: () {
            ref.read(nowPlayinMoviesProvider.notifier).loadNextPage();
          },
        ),
        // Expanded(
        //   child: ListView.builder(
        //     itemCount: moviesNowPlaying.length,
        //     itemBuilder: (context, index) {
        //     final movie = moviesNowPlaying[index];
        //     return ListTile(title: Text(movie.title),);
        //   },),
        // ),
      ],
    );
  }
}
