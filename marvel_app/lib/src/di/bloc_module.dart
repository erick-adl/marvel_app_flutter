import 'package:inject/inject.dart';
import 'package:marvel_app/src/blocs/characters_bloc.dart';
import 'package:marvel_app/src/resources/character_api_provider.dart';
import 'package:marvel_app/src/resources/movie_repository.dart';
import '../blocs/bloc_base.dart';
import 'package:http/http.dart' show Client;

@module
class BlocModule{

  @provide
  @singleton
  Client client() => Client();

  @provide
  @singleton
  CharacterApiProvider movieApiProvider(Client client) => CharacterApiProvider(client);

  @provide
  @singleton
  CharacterRepository repository(CharacterApiProvider movieApiProvider) => CharacterRepository(movieApiProvider);

  @provide
  BlocBase movieBloc(CharacterRepository repository) => CharactersBloc(repository);

}