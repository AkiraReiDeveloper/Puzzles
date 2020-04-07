import 'package:flutter/material.dart';

class NoteBook {
  static Widget noteBook(Widget widget) {
    return Center(
      child: new Container(
          width: 300,
          height: 300,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(15)),
          child: Container(
              margin: EdgeInsets.only(bottom: 3),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 19, 81, 1),
                  borderRadius: BorderRadius.circular(15)),
              child: Container(
                  margin: EdgeInsets.only(bottom: 3),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(color: Colors.white38, width: 0.5),
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                      margin: EdgeInsets.only(bottom: 1),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(0, 19, 81, 1),
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 3),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/image/background/background_notebook.png")),
                            color: Colors.white,
                            border: Border.all(color: Colors.black, width: 0.5),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(0, 19, 81, 1),
                                        border: Border.all(
                                            color: Colors.white38, width: 0.5),
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(15)))),
                                Container(
                                    margin: EdgeInsets.all(0),
                                    height: 20,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromRGBO(85, 143, 242, 0.5),
                                        border: Border.all(
                                            color: Colors.white38, width: 0.5),
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(15)))),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, top: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        height: 30,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.black, width: 3),
                                        ),
                                      ),
                                      Container(
                                        height: 30,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.black, width: 3),
                                        ),
                                      ),
                                      Container(
                                        height: 30,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.black, width: 3),
                                        ),
                                      ),
                                      Container(
                                        height: 30,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.black, width: 3),
                                        ),
                                      ),
                                      Container(
                                        height: 30,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.black, width: 3),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        height: 40,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Colors.black, width: 3),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      Container(
                                        height: 40,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Colors.black, width: 3),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      Container(
                                        height: 40,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Colors.black, width: 3),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      Container(
                                        height: 40,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Colors.black, width: 3),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      Container(
                                        height: 40,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Colors.black, width: 3),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Expanded(child: widget)
                          ],
                        ),
                      ))))),
    );
  }
}
