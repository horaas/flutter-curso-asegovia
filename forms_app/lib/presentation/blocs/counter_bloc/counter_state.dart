part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counter;
  final int trnsactionCount;

  const CounterState({this.counter = 0, this.trnsactionCount = 0});
  
  CounterState copyWith({int? counter, int? trnsactionCount}) => CounterState(
    counter: counter ?? this.counter,
    trnsactionCount: trnsactionCount ?? this.trnsactionCount,
  );

  @override
  List<Object> get props => [counter, trnsactionCount];
}
