import 'package:cinemapedia/domain/domains.dart';

abstract class ActorRepository {
  Future<List<Actor>> getActorByMovie(String movieId);
}
