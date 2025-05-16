
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static initEnviroments() async {
    await dotenv.load(fileName: '.env');
  }
  static String secretKey = dotenv.env['SECRET_KEY'] ?? 'error de API';
  static String apiKey = dotenv.env['API_KEY'] ?? 'error de API';
  static String paymnetApiUrl = dotenv.env['PAYMENT_API_URL'] ?? 'error de API';
}