import 'package:flutter/material.dart';
import 'package:inject/inject.dart';
import 'package:marvel_app/src/blocs/characters_bloc.dart';
import 'package:marvel_app/src/view/pages/home_screen.dart';

class App extends StatelessWidget {
  final CharactersBloc charactersBloc;

  @provide
  App(this.charactersBloc) : super();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marvel Heroes Library',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //Set theme
        primaryColor: Colors.white,
        accentColor: Colors.black12,
        //Set font
        fontFamily: 'Marvel',
        //Set text theme optional
        textTheme: TextTheme(
          headline: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w900,
          ),
          body1: TextStyle(
              fontSize: 14.0, color: Colors.grey, fontWeight: FontWeight.w900),
          subhead: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w900),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(charactersBloc),
      },
    );
  }
}
