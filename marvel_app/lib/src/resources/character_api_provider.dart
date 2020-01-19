import 'dart:async';
import 'dart:convert';
import 'package:inject/inject.dart';
import 'package:marvel_app/marvel_key.dart';
import 'package:http/http.dart' show Client, Response;
import 'package:crypto/crypto.dart' as crypto;
import 'package:convert/convert.dart';
import 'package:marvel_app/src/models/characters.dart';
import 'package:marvel_app/src/models/state.dart';


class CharacterApiProvider {

  final Client client;
  final _apiKeyPublic = MarvelKey.publicKey;
  final _apiKeyPrivate = MarvelKey.privateKey;
  final _baseUrl = "https://gateway.marvel.com:443/v1/public/";
  final _charactersUrl = "characters";
  int _offset = 0;
  int _limit = 20;


  @provide
  CharacterApiProvider(this.client);

  Future<State> fetchCharacters() async {
    Response response;
    if (_apiKeyPublic.length > 0) {
      var ts = DateTime.now();
      var hash = generateMd5("$ts" + _apiKeyPrivate + _apiKeyPublic);
      var request = "$_baseUrl$_charactersUrl?offset=$_offset&limit=$_limit&apikey=$_apiKeyPublic&ts=$ts&hash=$hash";
      response = await client.get(request);
    } else {
      throw State<String>.error('Please add your API key');
    }
    if (response.statusCode == 200) {
      _offset += 20;
      return State<Characters>.success(charactersFromJson(response.body));
    } else {
      throw State<String>.error(response.statusCode.toString());
    }
  }

  generateMd5(String data) {
    print(data);
    var content = new Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }
}
