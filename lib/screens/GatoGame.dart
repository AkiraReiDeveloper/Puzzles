import 'package:flutter/material.dart';



class GatoGame extends StatefulWidget {
  @override
  _GatoGameState createState() => _GatoGameState();
}

class _GatoGameState extends State<GatoGame> {
  List<List<Widget>> matrix;
  List<List<Color>> matrixColors;
  String cadena;
  @override
  void initState() {
    matrixColors = botonColorList();
    matrix = botonCatList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  matrix[0][0],
                  matrix[0][1],
                  matrix[0][2],
                ],
              ),
              Row(
                children: <Widget>[
                  matrix[1][0],
                  matrix[1][1],
                  matrix[1][2],
                ],
              ),
              Row(
                children: <Widget>[
                  matrix[2][0],
                  matrix[2][1],
                  matrix[2][2],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<List<Color>> botonColorList(){

    int i = 0;
    int j = 0;
    int size = 3;

    List<List<Color>> matrixColor = new List<List<Color>>(size);

    for (i; i < size; i++) {
      List<Color> listColor = new List<Color>(size);
      j = 0;
      for (j; j < size; j++) {
        listColor[j] = Colors.greenAccent;
      }
      matrixColor[i] = listColor;
    }
    print(matrixColor);
    return matrixColor;
  }

  List<List<Widget>> botonCatList(){

    int i = 0;
    int j = 0;
    int size = 3;

    List<List<Widget>> matrixWidget = new List<List<Widget>>(size);

    for (i; i < size; i++) {
      List<Widget> list = new List<Widget>(size);
      j = 0;
      for (j; j < size; j++) {
        list[j] = botonCat("", i, j);
      }
      matrixWidget[i] = list;
    }
    print(matrixWidget);
    return matrixWidget;
  }

  Widget botonCat(String text, int indexI, int indexJ){
    return GestureDetector(
      onTap: (){
        print("click "+indexI.toString()+" , "+ indexJ.toString());
        setState(() {
          matrixColors[indexI][indexJ] = Colors.blue;
        });
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: matrixColors[indexI][indexJ],
          border: Border.all(
            color: Colors.black,
            width: 2
          ),

        ),
        child: Center(child: Text(cadena == null ? text : cadena, style: TextStyle(
          color: Colors.white,
          fontSize: 30,

        ),)),
      ),
    );
  }
}
