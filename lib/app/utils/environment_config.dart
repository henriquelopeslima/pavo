import 'package:flutter_dotenv/flutter_dotenv.dart';

final environmentConfig = EnvironmentConfig();

class EnvironmentConfig {
  final movieApiKey = DotEnv().env['API_KEY'];
}
