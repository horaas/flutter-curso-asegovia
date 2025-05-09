import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState()) {
    on<OnActivatedManualMarkerEvent>((event, emit) => emit(state.copyWith(displaySearchMarker: !state.displaySearchMarker)));
  }
}
