part of 'gps_bloc.dart';

abstract class GpsEvent extends Equatable {
  const GpsEvent();

  @override
  List<Object> get props => [];
}

class GpsStateEvent extends GpsEvent {
  final bool isGpsEnabled;
  final bool isGpsPermissionsGranted;

  const GpsStateEvent({required this.isGpsEnabled, required this.isGpsPermissionsGranted});
}