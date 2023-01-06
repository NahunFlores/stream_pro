import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stream_pro/config/size_config.dart';
import 'package:stream_pro/screens/M_Inicio/components/inicio_titulo_seccion.dart';
import 'package:stream_pro/screens/Usuario_Inicio_Sesion/pantalla_usuario_inicio_sesion.dart';
import '../pantalla_inicio.dart';
import 'inicio_nuevos_registros.dart';
import 'inicio_fecha_renovacion_banner.dart';
import 'encabezado_inicio.dart';
import 'inicio_renovaciones_clientes.dart';
import 'inicio_renovaciones_proveedores.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        Navigator.pushNamed(context, PantallaUsuarioInicioSesion.routeName);
      }
    });
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            const EncabezadoInicio(),

            const FechaRenovacion(),

            Padding(
              padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
              child: const TituloSeccion(title: "Registro de nuevo"),
            ),

            NuevosRegistros(),

            SizedBox(height: getProportionateScreenHeight(20)),
            RenovacionesClientes(),

            SizedBox(height: getProportionateScreenHeight(20)),
            const RenovacionesProveedores(),

          ],
        ),
      ),
    );
  }
}
