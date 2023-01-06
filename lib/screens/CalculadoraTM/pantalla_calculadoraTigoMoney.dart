import 'package:flutter/material.dart';
import 'package:stream_pro/screens/CalculadoraTM/components/contenido_calculadora.dart';


class PantallaCalculadoraTM extends StatelessWidget {
  static String routeName = "/calculadora";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora Tigo Money"),
        backgroundColor: Theme.of(context).hoverColor,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 10,
        textTheme: TextTheme(
          headline6: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: ContenidoCalculadora(),

    );
  }
}
