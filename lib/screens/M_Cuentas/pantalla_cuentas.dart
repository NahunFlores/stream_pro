import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stream_pro/models/Proveedores.dart';
import 'package:stream_pro/screens/Nueva_Cuenta/components/form_nueva_cuenta.dart';
import 'package:stream_pro/screens/Nueva_Cuenta/pantalla_nueva_cuenta_inicio.dart';
import 'components/cuentas_cuerpo.dart';

class PantallaCuentas extends StatelessWidget {
  static String routeName = "/cuentas";

  @override
  Widget build(BuildContext context) {
    List<String> lista = ["Ingrese un proveedor"];

    FirebaseFirestore.instance.collection(Proveedores.TABLE_NAME).get().then(
        (QuerySnapshot querySnapshot) => querySnapshot.docs.forEach((doc) {
              if (doc["user"] == FirebaseAuth.instance.currentUser!.uid) {
                lista.add(doc["nombre"]);
              }
            }));

    return Scaffold(
      appBar: AppBar(
        title: Text("Cuentas"),
        backgroundColor: Theme.of(context).hoverColor,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 10,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            tooltip: 'Agregar Cuenta',
            onPressed: () {
              FormularioNuevaCuenta.limpiar_values();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PantallaNuevaCuentaInicio(lista)));
              FormularioNuevaCuenta.update = false;
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
