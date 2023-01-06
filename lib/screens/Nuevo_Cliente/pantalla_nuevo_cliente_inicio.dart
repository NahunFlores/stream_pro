import 'package:flutter/material.dart';
import 'package:stream_pro/screens/Nuevo_Cliente/components/cuerpo_nuevo_cliente.dart';

class PantallaNuevoClienteInicio extends StatelessWidget {
  static String routeName = "/nuevo_cliente";
  List<String> lista_cuentas;

  PantallaNuevoClienteInicio(this.lista_cuentas);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(lista_cuentas),
    );
  }
}
