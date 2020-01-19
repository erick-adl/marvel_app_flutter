import 'package:inject/inject.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_app/src/blocs/characters_bloc.dart';
import 'package:marvel_app/src/di/bloc_injector.dart';
import 'package:marvel_app/src/di/bloc_module.dart';
import 'package:marvel_app/src/models/characters.dart';

void main() async {
  group("BloC testing", (){
    test("Character BLoC testing", () async {
      var container = await BlocInjector.create(BlocModule());
      var moviesBloc = container.app.charactersBloc;
      moviesBloc.init();
      moviesBloc.fetchCharacters();
      moviesBloc.allCharacters.listen(expectAsync1((value){
        expect(value, isInstanceOf<List<Result>>());
      }));
    });   
  });
}
class BlocTest{
  final CharactersBloc charactersBloc;

  @provide
  BlocTest(this.charactersBloc): super();

}