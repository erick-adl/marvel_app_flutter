import 'package:inject/inject.dart';
import 'package:marvel_app/src/blocs/bloc_base.dart';
import 'package:marvel_app/src/models/characters.dart';
import 'package:marvel_app/src/models/state.dart';
import 'package:marvel_app/src/resources/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

@provide
class CharactersBloc extends BlocBase {
  final CharacterRepository _chractersRepository;
  List<Result> list;
  Characters characters;
  PublishSubject<List<Result>> _charactersFetcher;

  @provide
  CharactersBloc(this._chractersRepository);

  init() {
    _charactersFetcher = PublishSubject<List<Result>>();
  }

  Observable<List<Result>> get allCharacters => _charactersFetcher.stream;

  fetchCharacters() async {
    State state = await _chractersRepository.fetchAllCharacters();

    if (state is SuccessState) {
      characters = state.value;
      if (list == null) {
        list = characters.data.results;
      } else {
        list += characters.data.results;
      }
      _charactersFetcher.sink.add(list);
    } else if (state is ErrorState) {
      _charactersFetcher.addError(state.msg);
    }
  }

  @override
  void dispose() {
    _charactersFetcher.close();
  }
}
