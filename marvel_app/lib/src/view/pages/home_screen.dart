import 'package:flutter/material.dart';
import 'package:marvel_app/src/blocs/characters_bloc.dart';
import 'package:marvel_app/src/view/tiles/movie_list_tile.dart';
import 'package:marvel_app/src/view/widgets/custom_loader.dart';
import 'package:marvel_app/src/view/widgets/header.dart';

class HomeScreen extends StatefulWidget {
  final CharactersBloc _bloc;

  HomeScreen(this._bloc);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    widget._bloc.init();
    widget._bloc.fetchCharacters();
  }

  @override
  void dispose() {
    widget._bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: MainAppBar(),
        ),
        body: StreamBuilder(
          initialData: [],
          stream: widget._bloc.allCharacters,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Container(
                  child: new Text(
                    snapshot.error.toString().substring(10),
                    style: TextStyle(fontSize: 20.0),
                  ),
                  alignment: Alignment(0.0, 0.0),
                ),
              );
            } else if (!snapshot.hasData) {
              return Center(child: CustomLoader());
            } else {
              return new Stack(children: <Widget>[
                new Container(
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new AssetImage('assets/images/background.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                ListView.builder(
                  physics: ScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(6, 6, 0, 5),
                  itemCount: snapshot.data.length + 1,
                  itemBuilder: (context, index) {
                    if (index < snapshot.data.length) {
                      return CharaterListViewTile(snapshot.data[index]);
                    } else if (index > 1) {
                      widget._bloc.fetchCharacters();
                      return Container(
                        height: 40,
                        width: 40,
                        alignment: Alignment.center,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.yellow),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                )
              ]);
            }
          },
        ));
  }
}
