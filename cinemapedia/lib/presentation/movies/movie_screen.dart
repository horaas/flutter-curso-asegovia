import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/domains.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/movies/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieScreen extends ConsumerStatefulWidget {
  static const name = 'movie-screen';

  final String movieId;

  const MovieScreen({super.key, required this.movieId});

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(movieInfoProvider.notifier).loadMovie(widget.movieId);
    ref.read(actorsByMovieProvider.notifier).loadActors(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    final movie = ref.watch(movieInfoProvider)[widget.movieId];

    if (movie == null) return const Scaffold(body: FullScreenLoader());

    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          _CustomSilverAppBar(movie: movie),
          SliverList(
            delegate: SliverChildBuilderDelegate(childCount: 1, (
              context,
              index,
            ) {
              return _MovieDetails(movie: movie);
            }),
          ),
        ],
      ),
    );
  }
}

class _MovieDetails extends StatelessWidget {
  final Movie movie;

  const _MovieDetails({required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(movie.posterPath, width: size.width * 0.3),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: (size.width - 40) * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(movie.title, style: textStyle.titleLarge),
                    Text(movie.overview),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Wrap(
            children: [
              ...movie.genreIds.map(
                (gender) => Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Chip(
                    label: Text(gender),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        _ActorsByMovie(movieId: movie.id.toString()),
        const SizedBox(width: 100),
      ],
    );
  }
}

class _ActorsByMovie extends ConsumerWidget {
  final String movieId;
  const _ActorsByMovie({required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actorByMovie = ref.watch(actorsByMovieProvider)[movieId];

    if (actorByMovie == null) {
      return const CircularProgressIndicator(strokeWidth: 2);
    }

    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: actorByMovie.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(8.0),
            width: 135,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    height: 180,
                    width: 135,
                    fit: BoxFit.cover,
                    actorByMovie[index].profilePath,
                  ),
                ),

                const SizedBox(width: 10),
                Text(actorByMovie[index].name),
                Text(
                  actorByMovie[index].character,
                  maxLines: 2,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CustomSilverAppBar extends ConsumerWidget {
  final Movie movie;
  const _CustomSilverAppBar({required this.movie});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    final favoriteMovies = ref.read(favoriteMoviesProvider.notifier);
    final isFavorite = ref.watch(isFavoriteProvider(movie.id));

    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7,
      actions: [
        IconButton(onPressed: () async {
          await favoriteMovies.toogleFavorite(movie);
          ref.invalidate(isFavoriteProvider(movie.id));
        }, icon: isFavorite.when(
          loading: () => const CircularProgressIndicator(strokeWidth: 2,),
          data: (isFavoriteSelected) {
            return isFavoriteSelected ? Icon(Icons.favorite, color: Colors.red.shade400,) : const Icon(Icons.favorite_border);
          },
          error: (error, stackTrace) => throw UnimplementedError(),)
        //
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        title: Text(
          movie.title,
          style: const TextStyle(fontSize: 20, color: Colors.white),
          textAlign: TextAlign.start,
        ),
        background: Stack(
          children: [
            SizedBox.expand(
              child: FadeIn(
                child: Image.network(movie.posterPath, fit: BoxFit.cover),
              ),
            ),
            const _CustomGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, stops: [0.0, 0.3], colors: [Colors.white70, Colors.transparent],),
            const _CustomGradient(begin: Alignment.topLeft, end: Alignment.centerRight, stops: [0.0, 0.3], colors: [Colors.white70, Colors.transparent],),
            const _CustomGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, stops: [0.7, 1.0], colors: [Colors.transparent, Colors.black87],),
          ],
        ),
      ),
    );
  }
}

class _CustomGradient extends StatelessWidget {
  final Alignment begin;
  final Alignment end;
  final List<double> stops;
  final List<Color> colors;

  const _CustomGradient({required this.begin, required this.end, required this.stops, required this.colors});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
     child: DecoratedBox(
       decoration: BoxDecoration(
         gradient: LinearGradient(
           begin: begin,
           end: end,
           stops: stops ,
           colors: colors,
         ),
       ),
     ),
                );
  }
}
