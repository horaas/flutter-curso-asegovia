import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_app/services/services.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {

  TrafficService trafficService;

  SearchBloc({
    required this.trafficService
  }) : super(const SearchState()) {
    on<OnActivatedManualMarkerEvent>((event, emit) => emit(state.copyWith(displaySearchMarker: !state.displaySearchMarker)));
  }


  Future getStartToEnd(LatLng start, LatLng end) async {
    final response = await trafficService.getCoorsStartToEnd(start, end);
    return response;
  }
}
