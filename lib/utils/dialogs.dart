import 'package:demogame/utils/botonGamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Dialogs {
  static alert(BuildContext context,
      {String title = '',
      String message: '',
      IconData icon = Icons.add_alert,
      //double width = 400,
      double height = 300,
      Color color = Colors.cyan,
      VoidCallback onContinue,
      bool localMethod = true}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return new WillPopScope(
            onWillPop: () async => false,
            child: Dialog(
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(12.0)), //this right here
                child: Center(
                  child: new Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                          margin: EdgeInsets.only(bottom: 2),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(0, 19, 81, 1),
                              borderRadius: BorderRadius.circular(15)),
                          child: Container(
                              margin: EdgeInsets.only(bottom: 6),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(0, 52, 176, 1),
                                  border: Border.all(
                                      color: Colors.white38, width: 0.5),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Container(
                                  margin: EdgeInsets.all(2.7),
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(0, 19, 81, 1),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 3),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(0, 88, 236, 1),
                                        border: Border.all(
                                            color: Colors.white38, width: 0.5),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Column(
                                      children: <Widget>[
                                        Stack(
                                          children: <Widget>[
                                            Container(
                                                height: 60,
                                                decoration: BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        0, 19, 81, 1),
                                                    border: Border.all(
                                                        color: Colors.white38,
                                                        width: 0.5),
                                                    borderRadius:
                                                        BorderRadius.vertical(
                                                            top:
                                                                Radius.circular(
                                                                    15)))),
                                            Container(
                                                margin: EdgeInsets.all(5),
                                                height: 20,
                                                decoration: BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        85, 143, 242, 0.5),
                                                    border: Border.all(
                                                        color: Colors.white38,
                                                        width: 0.5),
                                                    borderRadius:
                                                        BorderRadius.vertical(
                                                            top:
                                                                Radius.circular(
                                                                    15)))),
                                            Positioned(
                                                width: 6,
                                                height: 5,
                                                top: 4,
                                                right: 4,
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(500),
                                                        color: Colors.white))),
                                            Align(
                                              alignment: Alignment.topCenter,
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(top: 10),
                                                child: Text(
                                                  "¡Fiesta!",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: "Gamer",
                                                      fontSize: 40),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    top: 10, right: 10),
                                                child: BotonGamer(
                                                    text: "X",
                                                    colorCapa1: Color.fromRGBO(
                                                        167, 1, 22, 1),
                                                    colorCapa2: Color.fromRGBO(
                                                        214, 1, 21, 1),
                                                    colorCapa3: Color.fromRGBO(
                                                        214, 1, 21, 1),
                                                    colorCapa4: Color.fromRGBO(
                                                        255, 111, 126, 1),
                                                    width: 40,
                                                    height: 40,
                                                    textSize: 30,
                                                    borderSize: 5,
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    }),
                                              ),
                                            )
                                          ],
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    85, 143, 242, 0.5),
                                                border: Border.all(
                                                    color: Colors.white38,
                                                    width: 0.5),
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                        bottom: Radius.circular(
                                                            15))),
                                            child: Container(
                                              margin: EdgeInsets.all(20),
                                              child: Text(
                                                message,
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 30,
                                                    fontFamily: "Gamer"),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))))),
                )),
          );
        });
  }

  static alertWin(BuildContext context,
      {String title = '',
      IconData icon = Icons.add_alert,
      Color color = Colors.cyan,
      VoidCallback onContinue,
      bool localMethod = true}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return new WillPopScope(
            onWillPop: () async => false,
            child: Dialog(
                backgroundColor: Colors.transparent, //this right here
                child: Center(
                  child: new Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                          margin: EdgeInsets.only(bottom: 2),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(0, 19, 81, 1),
                              borderRadius: BorderRadius.circular(15)),
                          child: Container(
                              margin: EdgeInsets.only(bottom: 6),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(0, 52, 176, 1),
                                  border: Border.all(
                                      color: Colors.white38, width: 0.5),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Container(
                                  margin: EdgeInsets.all(2.7),
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(0, 19, 81, 1),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.only(bottom: 3),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(0, 88, 236, 1),
                                        border: Border.all(
                                            color: Colors.white38, width: 0.5),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.all(10),
                                          child: Text(
                                            title,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Gamer",
                                                fontSize: 40,),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 10, right: 10),
                                          child: BotonGamer(
                                              text: "Aceptar",
                                              colorCapa1: Color.fromRGBO(
                                                  237, 166, 0, 1),
                                              colorCapa2: Color.fromRGBO(
                                                  255, 206, 0, 1),
                                              colorCapa3: Color.fromRGBO(
                                                  250, 229, 0, 1),
                                              colorCapa4: Color.fromRGBO(
                                                  251, 237, 85, 0.5),
                                              borderSize: 10,
                                              width: 100,
                                              height: 50,
                                              textSize: 30,
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              }),
                                        ),
                                      ],
                                    ),
                                  ))))),
                )),
          );
        });
  }

  static void confirm(BuildContext context,
      {String title = '',
      String message: '',
      IconData icon = Icons.warning,
      double width = 300,
      double height = 220,
      Color color = Colors.cyan,
      VoidCallback onCancel,
      VoidCallback onConfirm}) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)), //this right here
            child: Container(
              height: height,
              width: width,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: height * 0.2,
                      width: width,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: color,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(5))),
                      child: Column(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.all(10),
                              child: Icon(
                                icon,
                                size: 32,
                                color: Colors.white,
                              )),
                          Container(
                              child: Text(
                            title,
                            style: TextStyle(color: Colors.white, fontSize: 26),
                          )),
                          Expanded(
                            child: Container(
                                child: Text(
                              message,
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 18),
                              textAlign: TextAlign.center,
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: FlatButton(
                            onPressed: onConfirm,
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.check_circle,
                                  color: Colors.cyan,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'SI',
                                  style: TextStyle(
                                      color: Colors.cyan, fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: FlatButton(
                            onPressed: onCancel,
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.cancel, color: Colors.cyan),
                                SizedBox(width: 10),
                                Text(
                                  'CANCELAR',
                                  style: TextStyle(
                                      color: Colors.cyan, fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  static void fichaCatSelected(BuildContext context,
      {String title = '',
      String message: '',
      IconData icon = Icons.warning,
      double width = 300,
      double height = 220,
      Color color = Colors.cyan,
      VoidCallback onConfirmX,
      VoidCallback onConfirmO}) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)), //this right here
            child: Container(
              height: height,
              width: width,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: height * 0.2,
                      width: width,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          //color: color,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(5))),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Stack(
                              children: <Widget>[
                                Container(
                                    child: Text(
                                  message,
                                  style: TextStyle(
                                      color: Color.fromRGBO(190, 145, 0, 1),
                                      fontSize: 50,
                                      fontFamily: "Gamer",
                                      height: 0.90),
                                  textAlign: TextAlign.center,
                                )),
                                Container(
                                    child: Text(
                                  message,
                                  style: TextStyle(
                                      color: Colors.yellowAccent,
                                      fontSize: 50,
                                      fontFamily: "Gamer"),
                                  textAlign: TextAlign.center,
                                )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        BotonGamer(
                          text: "X",
                          textSize: 100,
                          colorCapa1: Color.fromRGBO(0, 19, 81, 1),
                          colorCapa2: Color.fromRGBO(0, 52, 176, 1),
                          colorCapa3: Color.fromRGBO(0, 88, 236, 1),
                          colorCapa4: Color.fromRGBO(85, 143, 242, 0.5),
                          width: 100,
                          height: 120,
                          borderSize: 10,
                          onPressed: onConfirmX
                        ),
                        BotonGamer(
                          text: "O",
                          textSize: 100,
                          colorCapa1: Color.fromRGBO(5, 52, 0, 1),
                          colorCapa2: Color.fromRGBO(7, 102, 0, 1),
                          colorCapa3: Color.fromRGBO(12, 163, 0, 1),
                          colorCapa4: Color.fromRGBO(44, 176, 28, 0.5),
                          width: 100,
                          height: 120,
                          borderSize: 10,
                          onPressed: onConfirmO
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
