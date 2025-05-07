part of 'gps_bloc.dart';

class GpsState extends Equatable {

  final bool isGpsEnabled;
  final bool isGpsPermissionsGranted;

  const GpsState({required this.isGpsEnabled, required this.isGpsPermissionsGranted});
  
  @override
  List<Object> get props => [isGpsEnabled, isGpsPermissionsGranted];
}

