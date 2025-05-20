part of 'search_bloc.dart';

class SearchState extends Equatable {
  final bool displaySearchMarker;
  final List<FeaturePlaces> places;
  final List<SearchResult> searchResultHistory;

  const SearchState({this.displaySearchMarker = false, this.places = const [], this.searchResultHistory = const []});

  SearchState copyWith({bool? displaySearchMarker, List<FeaturePlaces>? places, List<SearchResult>? searchResultHistory}) => SearchState(
    displaySearchMarker: displaySearchMarker ?? this.displaySearchMarker,
    places: places ?? this.places,
    searchResultHistory: searchResultHistory ?? this.searchResultHistory,
  );

  @override
  List<Object> get props => [displaySearchMarker, places, searchResultHistory];
}
