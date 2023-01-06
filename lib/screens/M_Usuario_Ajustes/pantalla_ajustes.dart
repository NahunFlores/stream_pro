import 'package:flutter/material.dart';
import 'package:stream_pro/screens/M_Usuario_Ajustes/components/cuerpo_ajustes.dart';

class PantallaAjustes extends StatelessWidget{
  static String routeName = "/ajustes";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajustes"),
        backgroundColor: Theme.of(context).hoverColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white), toolbarTextStyle: const TextTheme(
          headline6: TextStyle(color: Colors.white, fontSize: 18),
        ).bodyText2, titleTextStyle: const TextTheme(
          headline6: TextStyle(color: Colors.white, fontSize: 18),
        ).headline6,
      ),

        body: BodyAjustes(),
    );
  }


}