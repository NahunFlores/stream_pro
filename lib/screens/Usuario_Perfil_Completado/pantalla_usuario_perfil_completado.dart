import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'components/cuerpo_usuario_perfil_completado.dart';

class PantallaUsuarioPerfilCompletado extends StatelessWidget {
  static String routeName = "/complete_profile";
  UserCredential? user;
  PantallaUsuarioPerfilCompletado({this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Body(user: user!),
    );
  }
}
