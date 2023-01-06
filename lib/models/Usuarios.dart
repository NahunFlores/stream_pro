
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Usuarios{

  static final String TABLE_NAME = "usuarios";
  final String displayname;
  final String correoElectronico;
  final String telefono;
  final String direccion;

  Usuarios({required this.displayname,
            required this.correoElectronico,
            required this.telefono,
            required this.direccion});
    @override
    String toString() {
      return displayname;
    }

  Map<String, dynamic> toMap() {
    return {
      'displayname': displayname,
      'correoElectronico': correoElectronico,
      'telefono': telefono,
      'direccion': direccion
    };
  }
}