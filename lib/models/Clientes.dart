//import 'dart:ui';
// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:stream_pro/config/constants.dart';

class Clientes {
  static final String TABLE_NAME = "clientes";
  final String user;
  final String nombre;
  final String pais;
  final String telefono;
  final String correoElectronico;
  final String fechaVentas;
  final String fechaRenovacion;
  final String pago;

  Clientes(
      {required this.nombre,
      required this.pais,
      required this.telefono,
      required this.correoElectronico,
      required this.fechaVentas,
      required this.fechaRenovacion,
      required this.user,
      required this.pago});

  @override
  String toString() {
    return fechaVentas;
  }

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'pais': pais,
      'telefono': telefono,
      'correoElectronico': correoElectronico,
      'fecha_venta': fechaVentas,
      'fechaRenovacion': fechaRenovacion,
      'pago': pago,
      'user': user
    };
  }

  factory Clientes.fromJson(Map<String, dynamic> parsedJson) {
    return Clientes(
        nombre: parsedJson['nombre'],
        pais: parsedJson['pais'],
        telefono: parsedJson['telefono'],
        correoElectronico: parsedJson['correoElectronico'],
        fechaVentas: parsedJson['fechaVenta'],
        fechaRenovacion: parsedJson['fechaRenovacion'],
        pago: parsedJson['pago'],
        user: parsedJson['user']);
  }

  Future<void> addClientes(CollectionReference clientes) {
    return clientes
        .add(toMap())
        .then((value) =>
            mensajeToast("La cuenta  $nombre, ha sido registrada"))
        .catchError((error) => mensajeToast(error));
  }

  Future<void> updateClientes(CollectionReference cuentas, String uid) {
    return cuentas
        .doc(uid)
        .update(toMap())
        .then((value) =>
            mensajeToast("La cuenta  $nombre, ha sido actualizada"))
        .catchError((error) => mensajeToast(error));
  }
}
