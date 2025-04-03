import 'package:cinemapedia/domain/domains.dart';

abstract class ActorDatsources {
  Future<List<Actor>> getActorByMovie(String movieId);
}
