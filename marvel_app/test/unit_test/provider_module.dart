import 'package:inject/inject.dart';
import 'package:http/http.dart' as http;
import 'package:marvel_app/src/resources/character_api_provider.dart';

import 'mock_client.dart';

@module
class ProviderModule{

  @provide
  @singleton
  http.Client client() => MockClient();

  @provide
  @singleton
  CharacterApiProvider characterApiProvider(http.Client client) => CharacterApiProvider(client);
}