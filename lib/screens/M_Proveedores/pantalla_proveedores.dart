import 'package:flutter/material.dart';
import 'package:stream_pro/screens/Nuevo_Proveedor/components/form_nuevo_proveedor.dart';
import 'package:stream_pro/screens/Nuevo_Proveedor/pantalla_nuevo_proveedor_inicio.dart';

import 'components/proveedores_cuerpo.dart';

class PantallaProveedores extends StatelessWidget {
  static String routeName = "/proveedores";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Proveedores"),
        backgroundColor: Theme.of(context).hoverColor,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 10,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            tooltip: 'Agregar Proveedor',
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PantallaNuevoProveedorInicio()));
              FormularioNuevoProveedor.update = false;
            },
          )
        ],
        textTheme: TextTheme(
          headline6: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: Body(),
    );
  }
}
