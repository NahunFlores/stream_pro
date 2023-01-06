import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:stream_pro/Notificacion.dart';

import 'package:stream_pro/screens/Nuevo_Cliente/components/form_nuevo_cliente.dart';
import 'package:stream_pro/screens/Nuevo_Cliente/pantalla_nuevo_cliente_inicio.dart';
import 'package:stream_pro/config/size_config.dart';
import 'package:stream_pro/models/Clientes.dart';
import 'package:stream_pro/models/Cuentas.dart';

class ItemWigetClientes extends StatelessWidget {
  QueryDocumentSnapshot snapshot;
  final databaseReference =
      FirebaseFirestore.instance.collection(Clientes.TABLE_NAME);

  ItemWigetClientes(this.snapshot, {super.key});

  @override
  Widget build(BuildContext context) {
    List<String> lista = ["Ingrese una cuenta"];

    FirebaseFirestore.instance
        .collection(Cuentas.TABLE_NAME)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        if (doc["user"] == FirebaseAuth.instance.currentUser!.uid) {
          lista.add(doc["correoElectronico"]);
        }
      }
    });

    Clientes? clientes = snapshot.data() as Clientes?;

    return Container();
  }
}
