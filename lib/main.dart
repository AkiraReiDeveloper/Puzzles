import 'package:demogame/screens/HistoryMode.dart';
import 'package:demogame/screens/Home.dart';
import 'package:demogame/screens/GatoGame.dart';
import 'package:demogame/screens/ModoJuegoRapido.dart';
import 'package:demogame/screens/ParesCardsGame.dart';
import 'package:demogame/screens/SelectModeCardsGame.dart';
import 'package:demogame/screens/SplashScreen.dart';
import 'package:demogame/screens/VsModeGame.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "splashscreen", 
      routes: {
        'home'          : (BuildContext context) => Home(),
        'gatogame'      : (BuildContext context) => GatoGame(),
        //'ahorcadogame'         : ( BuildContext context ) => AhorcadoGame(),
        'cardsgame'     : ( BuildContext context ) => ParesCardsGame(),
        'juegorapido'   : ( BuildContext context ) => ModoJuegoRapido(),
        'modohistoria'   : ( BuildContext context ) => HistoryMode(),
        'cardsgamemode'   : ( BuildContext context ) => SelectModeCardsGame(),
        'splashscreen'   : ( BuildContext context ) => SplashScreen(),
        'pvp'   : ( BuildContext context ) => VsModeGame(),
      },
    );
  }
}
