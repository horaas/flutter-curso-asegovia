part of 'location_bloc.dart';

class LocationState extends Equatable {
  final bool followeingUser;



  const LocationState({this.followeingUser = false});
  
  @override
  List<Object> get props => [followeingUser];
}
