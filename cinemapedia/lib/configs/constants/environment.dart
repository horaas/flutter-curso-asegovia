import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String theMovieDvKey = dotenv.env['APY_KEY'] ?? '';
  static String movieUrl = 'https://api.themoviedb.org/3';
  static String urlImageMovie = 'https://image.tmdb.org/t/p/w500';
}
