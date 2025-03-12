import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/domains.dart';
import 'package:flutter/material.dart';

typedef CalbackSearch = Future<List<Movie>> Function(String query);

class SearchDelegateMovie extends SearchDelegate<Movie?> {
  final CalbackSearch calbackSearch;

  SearchDelegateMovie({required this.calbackSearch});

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
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('data2');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: calbackSearch(query),
      builder: (context, snapshot) {
        final movies = snapshot.data ?? [];
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return ListTile(title: Text(movie.title));
          },
        );
      },
    );
  }
}
