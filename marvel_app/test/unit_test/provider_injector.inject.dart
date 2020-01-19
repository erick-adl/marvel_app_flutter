import 'provider_injector.dart' as _i1;
import 'provider_module.dart' as _i2;
import 'package:http/src/client.dart' as _i3;
import 'package:marvel_app/src/resources/character_api_provider.dart' as _i4;
import 'dart:async' as _i5;
import 'provider_test.dart' as _i6;

class ProviderTestInjector$Injector implements _i1.ProviderTestInjector {
  ProviderTestInjector$Injector._(this._providerModule);

  final _i2.ProviderModule _providerModule;

  _i3.Client _singletonClient;

  _i4.CharacterApiProvider _singletonCharacterApiProvider;

  static _i5.Future<_i1.ProviderTestInjector> create(
      _i2.ProviderModule providerModule) async {
    final injector = ProviderTestInjector$Injector._(providerModule);

    return injector;
  }

  _i6.ProviderTest _createProviderTest() =>
      _i6.ProviderTest(_createCharacterApiProvider(), _createClient());
  _i4.CharacterApiProvider _createCharacterApiProvider() =>
      _singletonCharacterApiProvider ??=
          _providerModule.characterApiProvider(_createClient());
  _i3.Client _createClient() => _singletonClient ??= _providerModule.client();
  @override
  _i6.ProviderTest get app => _createProviderTest();
}