part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counter;
  final List<BandModel>bands;

    

  CounterState({this.counter = 0, this.bands = const []});

  CounterState copyWith({int? counter, List<BandModel>? bands}) => CounterState(
    counter: counter ?? this.counter,
    bands: bands ?? this.bands
  );



  @override
  List<Object> get props => [counter, bands];
}

