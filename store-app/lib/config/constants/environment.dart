
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static initEnviroments() async {
    await dotenv.load(fileName: '.env');
  }
  static String apiUrl = dotenv.env['API_URL'] ?? 'error de url';
}