import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String apiUrl =
      dotenv.env['API_URL'] ?? 'No está configurado el API-URL';

  static initEnvironment() async {
    await dotenv.load(fileName: '.env');
  }
}
