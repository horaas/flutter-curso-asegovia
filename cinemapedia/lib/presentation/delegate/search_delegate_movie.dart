import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/configs/helpers/human_formats.dart';
import 'package:cinemapedia/domain/domains.dart';
import 'package:flutter/material.dart';

typedef CalbackSearch = Future<List<Movie>> Function(String query);

class SearchDelegateMovie extends SearchDelegate<Movie?> {
  final CalbackSearch calbackSearch;
  final StreamController<List<Movie>> controllerDelegate =
      StreamController.broadcast();
  final List<Movie> initialMovies;

  Timer? _timer;

  SearchDelegateMovie({
    required this.calbackSearch,
    required this.initialMovies,
  });

  _clearStream() {
    controllerDelegate.close();
  }

  _queryOnChangeValue(String query) {
    if (_timer?.isActive ?? false) return _timer!.cancel();

    _timer = Timer(const Duration(milliseconds: 500), () async {
      final movies = await calbackSearch(query);
      controllerDelegate.add(movies);
    });
  }

  @override
  String get searchFieldLabel => 'Buscar películas';
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty && query.length >= 3)
        // Padding(
        //   padding: const EdgeInsets.only(right: 5),
        //   child:
        //       FadeIn(child:
        //         SpinPerfect( infinite: true,
        //           child: const Icon(Icons.cached))
        //       ),
        // ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: IconButton(
            onPressed: () => query = '',
            icon: FadeIn(child: const Icon(Icons.delete)),
          ),
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3),
      child: IconButton(
        onPressed: () {
          _clearStream();
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('data2');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _queryOnChangeValue(query);

    return StreamBuilder(
      // future: calbackSearch(query),
      initialData: initialMovies,
      stream: controllerDelegate.stream,
      builder: (context, snapshot) {
        final movies = snapshot.data ?? [];
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return _MovieItem(
              movie: movie,
              calbackClose: (context, movie) {
                _clearStream();
                close(context, movie);
              },
            );
          },
        );
      },
    );
  }
}

class _MovieItem extends StatelessWidget {
  final Movie movie;
  final Function calbackClose;

  const _MovieItem({required this.movie, required this.calbackClose});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      child: GestureDetector(
        onTap: () {
          calbackClose(context, movie);
        },
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              SizedBox(
                width: size.width * 0.15,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(movie.posterPath, fit: BoxFit.cover),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        movie.overview.length > 100
                            ? '${movie.overview.substring(0, 100)}...'
                            : movie.overview,
                      ),

                      Row(
                        children: [
                          Icon(
                            Icons.star_border_outlined,
                            color: Colors.yellow.shade800,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            HumanFormats.humanREadleNumber(
                              movie.voteAverage,
                              1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
