import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stream_pro/config/constants.dart';
import 'package:stream_pro/models/Proveedores.dart';

class Cuentas {
  static final String TABLE_NAME = "cuentas";
  final String user;
  final String correoElectronico;
  final String contrasenia;
  final String fechaCompra;
  final String proveedor;
  final String plataforma;
  final String membresia;
  final double precio;
  bool pagado = false;

  bool cuenta_pagada() {
    return pagado;
  }

  void traer_pagada(bool pagado) {
    this.pagado = pagado;
  }

  Cuentas(
      {required this.correoElectronico,
      required this.contrasenia,
      required this.fechaCompra,
      required this.proveedor,
      required this.plataforma,
      required this.membresia,
      required this.precio,
      required this.user});

  Map<String, dynamic> toMap() {
    return {
      'correoElectronico': correoElectronico,
      'contrasenia': contrasenia,
      'fechaCompra': fechaCompra,
      'proveedor': proveedor,
      'plataforma': plataforma,
      'membresia': membresia,
      'precio': precio,
      'pagado': pagado,
      'user': user
    };
  }

  factory Cuentas.fromJson(Map<String, dynamic> parsedJson) {
    return Cuentas(
        correoElectronico: parsedJson['correoElectronico'],
        contrasenia: parsedJson['contrasenia'],
        fechaCompra: parsedJson['fechaCompra'],
        proveedor: parsedJson['proveedor'],
        plataforma: parsedJson['plataforma'],
        membresia: parsedJson['membresia'],
        precio: parsedJson['precio'],
        user: parsedJson['user']);
  }

  Future<void> addCuentas(CollectionReference cuentas) {
    return cuentas.add(toMap()).then((value) {
      FirebaseFirestore.instance
          .collection(Proveedores.TABLE_NAME)
          .where("nombre", isEqualTo: proveedor)
          .get()
          .then((value) {
        int cuentas = int.parse(value.docs[0].data()['cuentas']);
        cuentas += 1;
        value.docs[0].reference.update({'cuentas': cuentas.toString()});
      });

      mensajeToast("La cuenta  $correoElectronico, ha sido registrada");
    }).catchError((error) => mensajeToast(error));
  }

  Future<void> updateCuentas(CollectionReference cuentas, String uid) {
    // Call the user's CollectionReference to add a new user
    return cuentas
        .doc(uid)
        .update(toMap())
        .then((value) => mensajeToast(
            "La cuenta  $correoElectronico, ha sido actualizada"))
        .catchError((error) => mensajeToast(error));
  }
}
