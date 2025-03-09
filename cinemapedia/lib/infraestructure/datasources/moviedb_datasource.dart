import 'package:cinemapedia/configs/configs.dart';
import 'package:cinemapedia/domain/domains.dart';
import 'package:cinemapedia/infraestructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MoviedbDatasource extends MoviesDatasources {
  final _dio = Dio(
    BaseOptions(
      baseUrl: Environment.movieUrl,
      queryParameters: {
        'api_key': Environment.theMovieDvKey,
        'language': 'es-MX',
      },
    ),
  );

  MoviedbDatasource();

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await _dio.get('/movie/now_playing');
    final movieDBREsponse = MovieDbRespopnse.fromJson(response.data);
    final List<Movie> movies =
        movieDBREsponse.results
            .where((movieDB) => movieDB.posterPath != 'no-poster')
            .map((movieDB) => MovieMapper.movieDBToEntity(movieDB))
            .toList();
    return movies;
  }
}
