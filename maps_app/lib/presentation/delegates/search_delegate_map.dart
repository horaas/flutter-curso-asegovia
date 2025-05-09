import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:maps_app/models/models.dart';

typedef CalbackSearch = Future<List<String>> Function(String query);


class SearchDelegateMap extends SearchDelegate<SearchResult> {

  final CalbackSearch? calbackSearch;
  final StreamController<List<String>> controllerDelegate = StreamController.broadcast();
  final StreamController<bool> isLoading = StreamController.broadcast();


  SearchDelegateMap({
    this.calbackSearch,
  });

  _clearStream() {
    controllerDelegate.close();
  }


  @override
  String get searchFieldLabel => 'Buscar';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: FadeIn(
            child: StreamBuilder(
              initialData: false,
              stream: isLoading.stream,
              builder: (context, snapshot) {
                if (snapshot.data ?? true) {
                  return IconButton(
                    onPressed: () => query = '',
                    icon: const Icon(Icons.delete),
                  );
                }
                return SpinPerfect(
                  infinite: true,
                  child: const Icon(Icons.cached),
                );
              },
            ),
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
          final resulr = SearchResult(cancel: true);
          close(context, resulr);
        },
        icon: const Icon(Icons.arrow_back),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('b');
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.location_on_outlined),
          title: const Text('Buscar en el mapa', style: TextStyle( color: Colors.black),),
          onTap: () {
            final resulr = SearchResult(cancel: false, manual: true);
            close(context, resulr);
          },
        )
      ],
    );
  }

  // StreamBuilder<List<Movie>> _buildWidgetStreamBuilder() {
  //   return StreamBuilder(
  //     // future: calbackSearch(query),
  //     initialData: initialMovies,
  //     stream: controllerDelegate.stream,
  //     builder: (context, snapshot) {
  //       final movies = snapshot.data ?? [];
  //       return ListView.builder(
  //         itemCount: movies.length,
  //         itemBuilder: (context, index) {
  //           final movie = movies[index];
  //           return _MovieItem(
  //             movie: movie,
  //             calbackClose: (context, movie) {
  //               _clearStream();
  //               close(context, movie);
  //             },
  //           );
  //         },
  //       );
  //     },
  //   );
  // }


}
