import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_app/blocs/blocs.dart';
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
    final searchBloc = BlocProvider.of<SearchBloc>(context);
    final proximity = BlocProvider.of<LocationBloc>(context).state.lastLocation;
    searchBloc.getPlacesbyQuery(proximity!, query);

    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      final places = state.places;
      return ListView.separated(
        itemCount: places.length,
        itemBuilder: (context, index) {
          final place = places[index];
          return ListTile(
            title: Text(place.properties.name),
            subtitle: Text(place.properties.label),
            leading: const Icon(Icons.place_outlined),
            onTap: () {
               final resulr = SearchResult(
                cancel: false,
                manual: false,
                position: LatLng(place.geometry.coordinates[1], place.geometry.coordinates[0]),
                name: place.properties.name,
                description: place.properties.label
                );
               close(context, resulr);
            },
          );
        },
       separatorBuilder: (context, index) => const Divider(),
      );
      // return Text('resultados: ${state.places.length}');
    },);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final searchBloc = BlocProvider.of<SearchBloc>(context);
    return ListView(
      children: [
        _listTileElement(title: 'Buscar en el mapa', onTap: () {
            final resulr = SearchResult(cancel: false, manual: true);
            close(context, resulr);
        },),
        ...searchBloc.state.searchResultHistory.map((result) => _listTileElement(
          title: result.name!,
          subTitle: result.description!,
          iconData: Icons.history,
          onTap: () => close(context, result),)),
      ],
    );
  }

  Widget _listTileElement({
      required String title,
      String? subTitle,
      GestureTapCallback? onTap,
      IconData? iconData,
      }) {
    

    return ListTile(
            leading: Icon(iconData ?? Icons.location_on_outlined),
            title: Text(title, style: const TextStyle( color: Colors.black),),
            subtitle: subTitle != null ? Text(subTitle, style: const TextStyle( color: Colors.black),) : null,
            onTap: onTap,
          );
  }

}
