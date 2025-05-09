part of 'search_bloc.dart';

class SearchState extends Equatable {
  final bool displaySearchMarker;

  const SearchState({this.displaySearchMarker = false});

  SearchState copyWith({bool? displaySearchMarker}) => SearchState(
    displaySearchMarker: displaySearchMarker ?? this.displaySearchMarker,
  );

  @override
  List<Object> get props => [displaySearchMarker];
}
