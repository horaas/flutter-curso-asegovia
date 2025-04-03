part of 'counter_cubit.dart';

class CounterState extends Equatable{
  final int counter;
  final int trnsactionCount;

  const CounterState({required this.counter, required this.trnsactionCount});

  copyWith({int? counter, int? trnsactionCount}) => CounterState(
    counter: counter ?? this.counter,
    trnsactionCount: trnsactionCount ?? this.trnsactionCount,
  );
  
  @override
  List<Object> get props => [counter, trnsactionCount];
}

// final class CounterInitial extends CounterState {}
