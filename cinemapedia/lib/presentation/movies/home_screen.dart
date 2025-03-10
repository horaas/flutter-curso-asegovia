import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _HomeView());
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

    return Column(
      children: [
        CustomAppBar(),
        Expanded(
          child: ListView.builder(
            itemCount: moviesNowPlaying.length,
            itemBuilder: (context, index) {
            final movie = moviesNowPlaying[index];
            return ListTile(title: Text(movie.title),);
          },),
        ),
      ],
    );
  }
}
