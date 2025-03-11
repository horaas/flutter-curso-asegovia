import 'package:cinemapedia/configs/configs.dart';
import 'package:cinemapedia/domain/domains.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/movie_movieDB.dart';

class MovieMapper {
  static Movie movieDBToEntity(MoviMovieDB moviedb) => Movie(
    adult: moviedb.adult,
    backdropPath:
        moviedb.backdropPath != ''
            ? Environment.urlImageMovie + moviedb.backdropPath
            : 'https://static.vecteezy.com/system/resources/previews/005/337/799/original/icon-image-not-found-free-vector.jpg',
    genreIds:
        moviedb.genreIds.map((toElement) => toElement.toString()).toList(),
    id: moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity: moviedb.popularity,
    posterPath: Environment.urlImageMovie + moviedb.posterPath,
    releaseDate: moviedb.releaseDate,
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage,
    voteCount: moviedb.voteCount,
  );
}
