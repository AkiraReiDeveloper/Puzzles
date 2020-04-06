import 'package:demogame/screens/GatoGame.dart';
import 'package:demogame/screens/Home.dart';
import 'package:demogame/screens/demoGato.dart';
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
      initialRoute: "home",
      routes: {
        'home'             : ( BuildContext context ) => Home(),
        'gatogame'         : ( BuildContext context ) => GatoGame(),
        'demogato'         : ( BuildContext context ) => DemoGato(),
      },
    );
  }
}
