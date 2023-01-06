import 'package:flutter/material.dart';
import 'package:stream_pro/screens/Nueva_Cuenta/components/cuerpo_nueva_cuenta.dart';

class PantallaNuevaCuentaInicio extends StatelessWidget{
  static String routeName = "/nueva_cuenta";
  List<String> lista;

  PantallaNuevaCuentaInicio(this.lista);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Body(lista),
    );
  }


}