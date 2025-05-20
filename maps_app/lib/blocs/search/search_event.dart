part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class OnActivatedManualMarkerEvent  extends SearchEvent {}

class OnNewPlacesFoundEvent  extends SearchEvent {
  final List<FeaturePlaces> places;
  const OnNewPlacesFoundEvent(this.places);
}
class OnHistoryEventEvent  extends SearchEvent {
  final SearchResult searchResult;
  const OnHistoryEventEvent(this.searchResult);
}