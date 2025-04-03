import 'package:cinemapedia/infraestructure/datasources/actor_moviedb_datsources.dart';
import 'package:cinemapedia/infraestructure/infraestructure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorRespositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorMoviedbDatsources());
});
