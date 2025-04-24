import 'package:band_names_app/models/band_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState()) {
    on<CounterIncreased>(_onCounterInceased);
    on<AddBand>(_onAddBand);
    on<UpdateBandsListVotes>(_onUpdateBandsList);
  }

  void _onCounterInceased(CounterIncreased event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter + event.value));
  }

  void _onAddBand(AddBand event, Emitter<CounterState> emit) {
    emit(
      state.copyWith(
        bands: [
          ...state.bands,
          ...[event.band],
        ],
      ),
    );
  }
  void _onUpdateBandsList(UpdateBandsListVotes event, Emitter<CounterState> emit) {
    final band = event.band.copyWith(votes: event.band.votes + 1);
    final bands = state.bands.map((bandEvent) {
      if(bandEvent.id == band.id) {
        bandEvent = band;
      }
      return bandEvent;
    }).toList();

    emit(
      state.copyWith(
        bands: bands,
      ),
    );
  }
}
