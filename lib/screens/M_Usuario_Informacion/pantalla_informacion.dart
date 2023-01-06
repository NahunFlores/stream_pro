import 'package:flutter/material.dart';
import 'package:stream_pro/screens/M_Usuario_Informacion/components/cuerpo_informacion.dart';

class PantallaInformacion extends StatelessWidget{
  static String routeName = "/informacion";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Información"),
        backgroundColor: Theme.of(context).hoverColor,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: TextTheme(
          headline6: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),

        body: Body(
        ),
    );
  }
}