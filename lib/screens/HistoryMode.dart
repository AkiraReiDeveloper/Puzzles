import 'package:demogame/utils/userPreferences.dart';
import 'package:flutter/material.dart';

class HistoryMode extends StatefulWidget {
  @override
  _HistoryModeState createState() => _HistoryModeState();
}

class _HistoryModeState extends State<HistoryMode> {
  UserPreferences _userPreferences = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new PreferredSize(
          child: Container(), preferredSize: Size.fromHeight(0)),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
            children: <Widget>[
              barToLevels(),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 150,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(
                          Icons.stars,
                          color: Colors.yellow,
                        ),
                        Text(
                          "0/300",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Gamer",
                            fontSize: 40,
                          ),
                        )
                      ]),
                ),
              ),
              Expanded(child: levelListMethod()),
            ],
          ),
        ),
      ),
    );
  }

  Widget levelListMethod() {
    return Container(
      margin: EdgeInsets.all(10),
      child: GridView.count(
        crossAxisCount: 5,
        children: List.generate(100, (index) {
          return Center(
              child: Container(
            margin: EdgeInsets.all(.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border:
                  Border.all(color: Color.fromRGBO(248, 6, 50, 1), width: 3),
            ),
            child: RaisedButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  Navigator.pushNamed(context, "cardsgame", arguments: index <= 6 ? (index+3).toString()+"x"+(index+2).toString(): "9x8 ");
                },
                child: Stack(
                  children: <Widget>[
                    Container(
                      color: Color.fromRGBO(30, 30, 30, 1),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Center(
                              child: Container(
                                  child: Text(
                                (index + 1).toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Gamer",
                                    fontSize: 40),
                              )),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 2),
                              color: Color.fromRGBO(248, 6, 50, 1),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(
                                    Icons.stars,
                                    size: 15,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.stars,
                                    size: 25,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.stars,
                                    size: 15,
                                    color: Colors.yellow,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    !true ? Container(color: Colors.black38) : Container(),
                  ],
                )),
          ));
        }),
      ),
    );
  }

  Widget barToLevels() {
    var width = MediaQuery.of(context).size.width;
    return new Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Color.fromRGBO(248, 6, 50, 1),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
      ),
      width: width,
      child: Column(children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 2),
          decoration: BoxDecoration(
            color: Color.fromRGBO(30, 30, 30, 1),
          ),
          child: Stack(
            children: <Widget>[
              Container(
                  width: width,
                  child: Text(
                    "Niveles",
                    style: TextStyle(
                        color: Color.fromRGBO(190, 145, 0, 1),
                        fontSize: 70,
                        fontFamily: "Gamer",
                        height: 0.90),
                    textAlign: TextAlign.center,
                  )),
              Container(
                  width: width,
                  child: Text(
                    "Niveles",
                    style: TextStyle(
                        color: Colors.yellowAccent,
                        fontSize: 70,
                        fontFamily: "Gamer"),
                    textAlign: TextAlign.center,
                  )),
            ],
          ),
        ),
      ]),
    );
  }
}
