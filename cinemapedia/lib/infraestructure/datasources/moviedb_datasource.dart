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

  List<Movie> _callToJson(Map<String, dynamic> json) {
    final movieDBREsponse = MovieDbRespopnse.fromJson(json);
    return movieDBREsponse.results
            .where((movieDB) => movieDB.posterPath != 'no-poster')
            .map((movieDB) => MovieMapper.movieDBToEntity(movieDB))
            .toList();
  }
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await _dio.get('/movie/now_playing', queryParameters: {
      'page': page
    });
    return _callToJson(response.data);
  }
  
  @override
  Future<List<Movie>> getPupular({int page = 1}) async {
    
    final response = await _dio.get('/movie/popular', queryParameters: {
      'page': page
    });
    return _callToJson(response.data);
  }
}
