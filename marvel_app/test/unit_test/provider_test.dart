import 'dart:io';
import 'package:inject/inject.dart';
import 'package:marvel_app/src/models/characters.dart';
import 'package:marvel_app/src/models/state.dart';
import 'package:marvel_app/src/resources/character_api_provider.dart';
import 'package:mockito/mockito.dart';
import 'provider_injector.dart';
import 'provider_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  group("CharacterApiProvider test", () {
    test("fetchCharacters success test", () async {
      var container = await ProviderTestInjector.create(ProviderModule());
      var app = container.app;
      var mockClient = app.mockClient;
      when(mockClient.get(
              "https://gateway.marvel.com/v1/public/characters?offset=0&limit=1&apikey=ab1c98a26eb58426dd5c93aba92b6546&ts=2020-01-18%2014:09:50.935144&hash=3b30cd2f27c38512eca5275e1aada2fe"))
          .thenAnswer((_) async => http.Response(
                  '{"code":200,"status":"Ok","copyright":"© 2020 MARVEL","attributionText":"Data provided by Marvel. © 2020 MARVEL","attributionHTML":"<a href=\"http://marvel.com\">Data provided by Marvel. © 2020 MARVEL</a>","etag":"4eaacae2701b1b2dc665917af2ddf46f7e2ba192","data":{"offset":0,"limit":1,"total":1493,"count":1,"results":[{"id":1011334,"name":"3-D Man","description":"","modified":"2014-04-29T14:18:17-0400","thumbnail":{"path":"http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784","extension":"jpg"},"resourceURI":"http://gateway.marvel.com/v1/public/characters/1011334","comics":{"available":12,"collectionURI":"http://gateway.marvel.com/v1/public/characters/1011334/comics","items":[{"resourceURI":"http://gateway.marvel.com/v1/public/comics/21366","name":"Avengers: The Initiative (2007) #14"}],"returned":12},"series":{"available":3,"collectionURI":"http://gateway.marvel.com/v1/public/characters/1011334/series","items":[{"resourceURI":"http://gateway.marvel.com/v1/public/series/1945","name":"Avengers: The Initiative (2007 - 2010)"}],"returned":3},"stories":{"available":21,"collectionURI":"http://gateway.marvel.com/v1/public/characters/1011334/stories","items":[{"resourceURI":"http://gateway.marvel.com/v1/public/stories/19947","name":"Cover #19947","type":"cover"}],"returned":20},"events":{"available":1,"collectionURI":"http://gateway.marvel.com/v1/public/characters/1011334/events","items":[{"resourceURI":"http://gateway.marvel.com/v1/public/events/269","name":"Secret Invasion"}],"returned":1},"urls":[{"type":"detail","url":"http://marvel.com/comics/characters/1011334/3-d_man?utm_campaign=apiRef&utm_source=ab1c98a26eb58426dd5c93aba92b6546"},{"type":"wiki","url":"http://marvel.com/universe/3-D_Man_(Chandler)?utm_campaign=apiRef&utm_source=ab1c98a26eb58426dd5c93aba92b6546"},{"type":"comiclink","url":"http://marvel.com/comics/characters/1011334/3-d_man?utm_campaign=apiRef&utm_source=ab1c98a26eb58426dd5c93aba92b6546"}]}]}}',
                  200,
                  headers: {
                    HttpHeaders.contentTypeHeader:
                        'application/json; charset=utf-8'
                  }));
      expect(await app.characterApiProvider.fetchCharacters(),
          isInstanceOf<SuccessState<Characters>>());
    });

    test("fetchCharacters fail test", () async {
      var container = await ProviderTestInjector.create(ProviderModule());
      var app = container.app;
      var mockClient = app.mockClient;
      when(mockClient.get(
              "https://gateway.marvel.com/v1/public/characters?offset=0&limit=1&apikey=ab1c98a26eb58426dd5c93aba92b6546&ts=2020-01-18%2014:09:50.935144&hash="))
          .thenAnswer((_) async => http.Response(
                  '{"code":"InvalidCredentials","message":"That hash, timestamp and key combination is invalid."}',
                  401,
                  headers: {
                    HttpHeaders.contentTypeHeader:
                        'application/json; charset=utf-8'
                  }));
      expect(await app.characterApiProvider.fetchCharacters(),
          isInstanceOf<ErrorState>());
    });
  });
}

class ProviderTest {
  final CharacterApiProvider characterApiProvider;
  final http.Client mockClient;

  @provide
  ProviderTest(this.characterApiProvider, this.mockClient) : super();
}
