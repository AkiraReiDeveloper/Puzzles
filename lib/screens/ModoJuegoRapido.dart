import 'package:demogame/utils/botonGamer.dart';
import 'package:flutter/material.dart';

class ModoJuegoRapido extends StatefulWidget {
  @override
  _ModoJuegoRapidoState createState() => _ModoJuegoRapidoState();
}

class _ModoJuegoRapidoState extends State<ModoJuegoRapido> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new PreferredSize(
          child: Container(), preferredSize: Size.fromHeight(0)),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Color.fromRGBO(248, 6, 50, 0.5), BlendMode.color),
                fit: BoxFit.fill,
                image: AssetImage(
                  "assets/image/background/background_mosaico.png",
                )),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _boton("cardsgame", "3x2"),
                  SizedBox(width: 10.0),
                  _boton("cardsgame", "4x3"),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _boton("cardsgame", "5x4"),
                  SizedBox(width: 10.0),
                  _boton("cardsgame", "6x5"),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _boton("cardsgame", "8x7"),
                  SizedBox(width: 10.0),
                  _boton("cardsgame", "9x8"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _boton(String screen, String text) {
    return Container(
      child: BotonGamer(
        text: text,
        textSize: 70,
        colorCapa1: Color.fromRGBO(0, 19, 81, 1),
        colorCapa2: Color.fromRGBO(0, 52, 176, 1),
        colorCapa3: Color.fromRGBO(0, 88, 236, 1),
        colorCapa4: Color.fromRGBO(85, 143, 242, 0.5),
        borderSize: 10,
        onPressed: () {
          Navigator.pushNamed(context, screen, arguments: text);
        },
        icon: Container(
            width: 50,
            height: 45,
            child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage("assets/image/icons/card_icon.png"))))),
      ),
    );
  }
}
