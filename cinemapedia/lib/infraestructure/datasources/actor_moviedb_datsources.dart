import 'package:cinemapedia/configs/configs.dart';
import 'package:cinemapedia/domain/domains.dart';
import 'package:cinemapedia/infraestructure/infraestructure.dart';
import 'package:cinemapedia/infraestructure/mappers/actor_mapper.dart';
import 'package:dio/dio.dart';

class ActorMoviedbDatsources extends ActorDatsources {
  final _dio = Dio(
    BaseOptions(
      baseUrl: Environment.movieUrl,
      queryParameters: {
        'api_key': Environment.theMovieDvKey,
        'language': 'es-MX',
      },
    ),
  );

  @override
  Future<List<Actor>> getActorByMovie(String movieId) async {
    final response = await _dio.get('/movie/$movieId/credits');
    final actorResponse = CreditsResponse.fromJson(response.data);
    return actorResponse.cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();
  }
}
