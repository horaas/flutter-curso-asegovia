part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counter;
  final List<BandModel>bands;

    

  const CounterState({this.counter = 0, this.bands = const [
    BandModel(id: 3, name: 'par band', votes: 40, color: Colors.blueAccent),
    BandModel(id: 1, name: 'kiss', votes: 10, color: Colors.red),
    BandModel(id: 2, name: 'bon jovi', votes: 5, color: Colors.green),
  ]});

  CounterState copyWith({int? counter, List<BandModel>? bands}) => CounterState(
    counter: counter ?? this.counter,
    bands: bands ?? this.bands
  );

  @override
  List<Object> get props => [counter, bands];
}

