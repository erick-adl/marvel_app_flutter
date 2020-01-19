import 'dart:async';
import 'package:inject/inject.dart';
import 'package:marvel_app/src/models/state.dart';
import 'character_api_provider.dart';


class CharacterRepository {

  final CharacterApiProvider _characterApiProvider;

  @provide
  CharacterRepository(this._characterApiProvider);

  Future<State> fetchAllCharacters() => _characterApiProvider.fetchCharacters();

}
