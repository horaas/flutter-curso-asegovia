import 'package:band_names_app/infrastructure/datasources/bands_datasource_impl.dart';
import 'package:band_names_app/infrastructure/respositories/bands_respositorie_impl.dart';
import 'package:band_names_app/models/band_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:socket_io_client/socket_io_client.dart' as io;

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState()) {

    on<CounterIncreased>(_onCounterInceased);
    on<AddBand>(_onAddBand);
    on<UpdateBandsListVotes>(_onUpdateBandsList);
    on<GetBands>(_onGetBands);
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
  void _onGetBands(GetBands event, Emitter<CounterState> emit) {
    final prueba = BandsRespositorieImpl(BandsDatasourceImpl());
    prueba.getBands();
    emit(
      state.copyWith(
        bands: [],
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
