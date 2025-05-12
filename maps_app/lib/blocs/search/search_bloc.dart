import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_app/models/models.dart';
import 'package:maps_app/services/services.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {

  TrafficService trafficService;

  SearchBloc({
    required this.trafficService
  }) : super(const SearchState()) {
    on<OnActivatedManualMarkerEvent>((event, emit) => emit(state.copyWith(displaySearchMarker: !state.displaySearchMarker)));
    on<OnNewPlacesFoundEvent>((event, emit) => emit(state.copyWith(places: event.places)));
    on<OnHistoryEventEvent>((event, emit) => emit(state.copyWith(searchResultHistory: [event.searchResult, ...state.searchResultHistory])));
  }


  Future getStartToEnd(LatLng start, LatLng end) async {
    final response = await trafficService.getCoorsStartToEnd(start, end);
    return response;
  }
  Future getPlacesbyQuery(LatLng proximity, String query) async {
    final newPlaces = await trafficService.getResultbyQuery(proximity, query);
    add(OnNewPlacesFoundEvent(newPlaces));
  }
}
