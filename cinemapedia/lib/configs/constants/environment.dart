import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String theMovieDvKey = dotenv.env['APY_KEY'] ?? '';
}
