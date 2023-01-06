import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stream_pro/config/constants.dart';

class Proveedores {
  static final String TABLE_NAME = "proveedores";
  final String user;
  final String nombre;
  final String pais;
  final String telefono;
  final String redSocial;
  final String cuenta;

  Proveedores(
      {required this.nombre,
      required this.pais,
      required this.redSocial,
      required this.telefono,
      required this.user,
      required this.cuenta});

  @override
  String toString() {
    return nombre;
  }

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'pais': pais,
      'red_social': redSocial,
      'telefono': telefono,
      'user': user,
      'cuentas': cuenta
    };
  }

  factory Proveedores.fromJson(Map<String, dynamic> parsedJson) {
    return Proveedores(
        nombre: parsedJson['nombre'],
        pais: parsedJson['pais'],
        redSocial: parsedJson['redSocial'],
        telefono: parsedJson['telefono'],
        user: parsedJson['user'],
        cuenta: parsedJson['cuentas']);
  }

  Future<void> addProveedores(CollectionReference proveedor) {
    // Call the user's CollectionReference to add a new user
    return proveedor.add(toMap()).then((value) {
      mensajeToast("El proveedor $nombre, ha sido registrada");
    }).catchError((error) => mensajeToast(error));
  }

  Future<void> updateProveedores(CollectionReference proveedor, String uid) {
    // Call the user's CollectionReference to add a new user
    return proveedor
        .doc(uid)
        .update(toMap())
        .then((value) =>
            mensajeToast("El proveedor $nombre, ha sido actualizada"))
        .catchError((error) => mensajeToast(error));
  }
}
