import 'package:flutter/material.dart';
import 'components/cuerpo_usuario_inicio_sesion_exitosa.dart';

class PantallaUsuarioCerroSesionExitosa extends StatelessWidget {
  static String routeName = "/cerro_sesion";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text(""),
      ),
      body: Center(
          child: BodyUsuarioCerroSesion()) ,
    );
  }
}
