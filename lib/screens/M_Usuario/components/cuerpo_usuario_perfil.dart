import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stream_pro/screens/M_Usuario_Informacion/pantalla_informacion.dart';
import 'package:stream_pro/screens/M_Usuario_Mi_Cuenta/pantalla_mi_cuenta.dart';
import 'package:stream_pro/screens/M_Usuario_Ajustes/pantalla_ajustes.dart';
import 'package:stream_pro/screens/Usuario_Cerro_Sesion_Exitosa/pantalla_usuario_inicio_sesion_exitosa.dart';

import 'menu_usuario_perfil.dart';
import 'imagen_usuario_perfil.dart';

class Body extends StatelessWidget {
  late User user;
  Body({required this.user});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          UsuarioImagen(user: user),
          const SizedBox(height: 30),
          UsuarioMenu(
            text: "Mi Cuenta",
            icon: "icons/Icono Menu Usuario.svg",
            press: () => {
              Navigator.pushNamed(context, PantallaMiCuenta.routeName),
            },
          ),

          UsuarioMenu(
            text: "Ajustes",
            icon: "icons/Icono Ajustes.svg",
            press: () {
              Navigator.pushNamed(context, PantallaAjustes.routeName);
            },
          ),
          UsuarioMenu(
            text: "Información",
            icon: "icons/Icono Interrogacion.svg",
            press: () {
              Navigator.pushNamed(context, PantallaInformacion.routeName);
            },
          ),
          UsuarioMenu(
            text: "Cerrar Sesión",
            icon: "icons/Icono Cerrar Sesion.svg",
            press: () {
              Navigator.pushNamed(context, PantallaUsuarioCerroSesionExitosa.routeName);
              },
          ),
        ],
      ),
    );
  }
}
