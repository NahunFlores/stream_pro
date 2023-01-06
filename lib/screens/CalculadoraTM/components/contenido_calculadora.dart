import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContenidoCalculadora extends StatefulWidget {
  @override
  State createState() => ContenidoCalculadoraState();
}

  class ContenidoCalculadoraState extends State<ContenidoCalculadora> {
    double valor=0;

    final TextEditingController t1 = new TextEditingController(text: "");

    var resultStr=0;

    void doResult(){
      setState(() {
        valor = double.parse(t1.text);
        if(valor==0) {
          t1.text='';
        } else if (valor>=0 && valor < 2000){
          t1.text =( valor * 1.06 ).toString();
        }else if (valor>=2000 && valor < 4000){
          t1.text =( valor * 1.05 ).toString();
        } else if (valor>=4000) {
          t1.text =( valor * 1.04 ).toString();
        } else {
          t1.text = ("Monto Inválido").toString();
        }
      });
    }

    void doClear() {
      setState(() {
        t1.text = "";
        valor=0.0;
      });
    }

    void str0() {
      setState(() {
        t1.text=t1.text + "0";
      });
    }

    void str1() {
      setState(() {
        t1.text=t1.text + "1";
      });
    }

    void str2() {
      setState(() {
        t1.text=t1.text + "2";
      });
    }

    void str3() {
      setState(() {
        t1.text=t1.text + "3";
      });
    }
    void str4() {
      setState(() {
        t1.text=t1.text + "4";
      });
    }

    void str5() {
      setState(() {
        t1.text=t1.text + "5";
      });
    }
    void str6() {
      setState(() {
        t1.text=t1.text + "6";
      });
    }
    void str7() {
      setState(() {
        t1.text=t1.text + "7";
      });
    }

    void str8() {
      setState(() {
        t1.text=t1.text + "8";
      });
    }
    void str9() {
      setState(() {
        t1.text=t1.text + "9";
      });
    }


    @override
    Widget build(BuildContext context) {
      return new Scaffold(
        body: new Container(
          padding: const EdgeInsets.only(left: 35.0, bottom: 40.0, top: 0.0, right: 35.0 ),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              new TextField(
                style: new TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF01579B),
                ),
                maxLength: 6,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(width: 2, color: Color(0xFF01579B))
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(width: 2, color: Color(0xFF01579B))
                  ),
                  labelText: 'Resultados',
                  isDense: true,
                  hintText: "",
                ),
                controller: t1,
              ),

              new Padding(
                padding: const EdgeInsets.only(top: 20.0),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new MaterialButton(
                    child: new Text("7"),
                    color: Color(0xFF01579B),
                    textColor: Colors.white,
                    onPressed: str7,
                  ),

                  new MaterialButton(
                    child: new Text("8"),
                    color: Color(0xFF01579B),
                    textColor: Colors.white,
                    onPressed: str8,
                  ),

                  new MaterialButton(
                    child: new Text("9"),
                    color: Color(0xFF01579B),
                    textColor: Colors.white,
                    onPressed: str9,
                  ),
                ],
              ),

              new Padding(
                padding: const EdgeInsets.only(top: 10.0),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new MaterialButton(
                    child: new Text("4"),
                    color: Color(0xFF01579B),
                    textColor: Colors.white,
                    onPressed: str4,
                  ),
                  new MaterialButton(
                    child: new Text("5"),
                    color: Color(0xFF01579B),
                    textColor: Colors.white,
                    onPressed: str5,
                  ),
                  new MaterialButton(
                    child: new Text("6"),
                    color: Color(0xFF01579B),
                    textColor: Colors.white,
                    onPressed: str6,
                  ),

                ],
              ),

              new Padding(
                padding: const EdgeInsets.only(top: 10.0),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new MaterialButton(
                    child: new Text("1"),
                    color: Color(0xFF01579B),
                    textColor: Colors.white,
                    onPressed: str1,
                  ),
                  new MaterialButton(
                    child: new Text("2"),
                    color: Color(0xFF01579B),
                    textColor: Colors.white,
                    onPressed: str2,
                  ),

                  new MaterialButton(
                    child: new Text("3"),
                    color: Color(0xFF01579B),
                    textColor: Colors.white,
                    onPressed: str3,
                  ),
                ],
              ),

              new Padding(
                padding: const EdgeInsets.only(top: 10.0),
              ),
              new Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new MaterialButton(
                    child: new Text("BORRAR"),
                    color: Color(0xFFAD1457),
                    textColor: Colors.white,
                    onPressed: doClear,
                  ),
                  new MaterialButton(
                    child: new Text("0"),
                    color: Color(0xFF01579B),
                    textColor: Colors.white,
                    onPressed: str0,
                  ),
                  new MaterialButton(
                    child: new Text("="),
                    color: Color(0xFF006064),
                    textColor: Colors.white,
                    onPressed: doResult,
                  ),

                ],
              )

            ],
          ),
        ),
      );


  }
}
