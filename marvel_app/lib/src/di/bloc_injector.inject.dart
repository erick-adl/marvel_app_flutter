import 'bloc_injector.dart' as _i1;
import 'bloc_module.dart' as _i2;
import 'package:http/src/client.dart' as _i3;
import '../resources/character_api_provider.dart' as _i4;
import '../resources/movie_repository.dart' as _i5;
import 'dart:async' as _i6;
import '../app.dart' as _i7;
import '../blocs/characters_bloc.dart' as _i8;

class BlocInjector$Injector implements _i1.BlocInjector {
  BlocInjector$Injector._(this._blocModule);

  final _i2.BlocModule _blocModule;

  _i3.Client _singletonClient;

  _i4.CharacterApiProvider _singletonMovieApiProvider;

  _i5.CharacterRepository _singletonRepository;

  static _i6.Future<_i1.BlocInjector> create(_i2.BlocModule blocModule) async {
    final injector = BlocInjector$Injector._(blocModule);

    return injector;
  }

  _i7.App _createApp() =>
      _i7.App(_createCharactersBloc());
  _i8.CharactersBloc _createCharactersBloc() => _i8.CharactersBloc(_createRepository());
  _i5.CharacterRepository _createRepository() => _singletonRepository ??=
      _blocModule.repository(_createMovieApiProvider());
  _i4.CharacterApiProvider _createMovieApiProvider() =>
      _singletonMovieApiProvider ??=
          _blocModule.movieApiProvider(_createClient());
  _i3.Client _createClient() => _singletonClient ??= _blocModule.client();
  @override
  _i7.App get app => _createApp();
}