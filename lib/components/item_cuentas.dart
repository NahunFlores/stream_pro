import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share/share.dart';
import 'package:stream_pro/config/size_config.dart';
import 'package:stream_pro/models/Clientes.dart';
import 'package:stream_pro/models/Proveedores.dart';
import 'package:stream_pro/screens/Nueva_Cuenta/components/form_nueva_cuenta.dart';
import 'package:stream_pro/screens/Nueva_Cuenta/pantalla_nueva_cuenta_inicio.dart';

class ItemWigetCuentas extends StatelessWidget {
  QueryDocumentSnapshot snapshot;
  final databaseReference =
      FirebaseFirestore.instance.collection(Proveedores.TABLE_NAME);

  ItemWigetCuentas(this.snapshot, {super.key});

  @override
  Widget build(BuildContext context) {
    List<String> lista = ["Ingrese un proveedor"];

    FirebaseFirestore.instance
        .collection(Proveedores.TABLE_NAME)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        if (doc["user"] == FirebaseAuth.instance.currentUser!.uid) {
          lista.add(doc["nombre"]);
        }
      }
    });

    Clientes? clientes = snapshot as Clientes?;

    return Container();
  }
}
