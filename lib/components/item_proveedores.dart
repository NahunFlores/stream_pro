import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share/share.dart';
import 'package:stream_pro/config/size_config.dart';
import 'package:stream_pro/models/Proveedores.dart';
import 'package:stream_pro/screens/Nuevo_Proveedor/components/form_nuevo_proveedor.dart';
import 'package:stream_pro/screens/Nuevo_Proveedor/pantalla_nuevo_proveedor_inicio.dart';

class ItemWigetProveedor extends StatelessWidget {
  QueryDocumentSnapshot snapshot;
  final databaseReference =
      FirebaseFirestore.instance.collection(Proveedores.TABLE_NAME);

  ItemWigetProveedor(this.snapshot, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      );
  }
}
