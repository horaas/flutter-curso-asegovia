part of 'counter_bloc.dart';

abstract class CounterEvent {
  const CounterEvent();
}

class CounterIncreased extends CounterEvent {
  final int value;
  const CounterIncreased(this.value);
}
class AddBand extends CounterEvent {
  final BandModel band;
  const AddBand(this.band);
}
class UpdateBandsListVotes extends CounterEvent {
  final BandModel band;
  const UpdateBandsListVotes(this.band);
}
class GetBands extends CounterEvent {
}