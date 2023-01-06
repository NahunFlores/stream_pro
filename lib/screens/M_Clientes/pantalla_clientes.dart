import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stream_pro/models/Cuentas.dart';
import 'package:stream_pro/screens/Nuevo_Cliente/components/form_nuevo_cliente.dart';
import 'package:stream_pro/screens/Nuevo_Cliente/pantalla_nuevo_cliente_inicio.dart';
import 'components/clientes_cuerpo.dart';

class PantallaClientes extends StatelessWidget {
  static String routeName = "/clientes";

  @override
  Widget build(BuildContext context) {
    List<String> lista = ["Ingrese una cuenta"];

    FirebaseFirestore.instance.collection(Cuentas.TABLE_NAME).get().then(
        (QuerySnapshot querySnapshot) => querySnapshot.docs.forEach((doc) {
              if (doc["user"] == FirebaseAuth.instance.currentUser!.uid) {
                lista.add(doc["correoElectronico"]);
              }
            }));

    return Scaffold(
      appBar: AppBar(
        title: Text("Clientes"),
        backgroundColor: Theme.of(context).hoverColor,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 10,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            tooltip: 'Agregar Cliente',
            onPressed: () {
              FormularioNuevoCliente.limpiar_values();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PantallaNuevoClienteInicio(lista)));
              FormularioNuevoCliente.update = false;
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
