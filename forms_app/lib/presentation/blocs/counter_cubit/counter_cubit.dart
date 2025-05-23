import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counter: 0, trnsactionCount: 0));
  void increaseBy(int value) {
    emit(state.copyWith(counter: state.counter + value, trnsactionCount: state.trnsactionCount + 1));
  }
  void reset() {
    emit(state.copyWith(counter: 0));
  }
}
