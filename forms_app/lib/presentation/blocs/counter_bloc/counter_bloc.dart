import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState()) {
    on<CounterIncreased>(_onCounterInceased);
    on<ResetCounter>(_onReset);
  }

  void _onCounterInceased (CounterIncreased event, Emitter <CounterState> emit) {
      emit(state.copyWith(
        counter: state.counter + event.value,
        trnsactionCount: state.trnsactionCount + 1
      ));
    }

  void _onReset(ResetCounter event, Emitter <CounterState> emit) {
      emit(state.copyWith(
        counter: 0
      ));
    }
}
