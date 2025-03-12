import 'package:cinemapedia/configs/configs.dart';
import 'package:cinemapedia/domain/domains.dart';
import 'package:cinemapedia/infraestructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/movie_details.dart';
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
  
  @override
  Future<List<Movie>> getTopRate({int page = 1})  async{
    final response = await _dio.get('/movie/top_rated', queryParameters: {
      'page': page
    });
    return _callToJson(response.data);
  }
  
  @override
  Future<List<Movie>> getUpcomming({int page = 1}) async {
    final response = await _dio.get('/movie/upcoming', queryParameters: {
      'page': page
    });
    return _callToJson(response.data);
  }
  
  @override
  Future<Movie> getMovieById(String id) async {
    final response = await _dio.get('/movie/$id');

    if (response.statusCode != 200) throw Exception('error');

    final movieDv = MovieDetails.fromJson(response.data);
    return MovieMapper.movieDetailsToEntity(movieDv);
  }
  
  @override
  Future<List<Movie>> getSearchMovie(String query) async {
    final response = await _dio.get('/search/movie', queryParameters: {
      'query': query
    });
    return _callToJson(response.data);
  }
}
