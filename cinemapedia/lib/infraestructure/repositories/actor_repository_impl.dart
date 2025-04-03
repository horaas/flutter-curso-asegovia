import 'package:cinemapedia/domain/domains.dart';

class ActorRepositoryImpl extends ActorRepository {
  final ActorDatsources actorDatsources;

  ActorRepositoryImpl(this.actorDatsources);

  @override
  Future<List<Actor>> getActorByMovie(String movieId) {
    return actorDatsources.getActorByMovie(movieId);
  }
}
