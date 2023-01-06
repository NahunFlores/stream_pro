import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stream_pro/components/custom_boton_predeterminado.dart';
import 'package:stream_pro/config/size_config.dart';
import 'package:stream_pro/screens/Usuario_Inicio_Sesion/pantalla_usuario_inicio_sesion.dart';

import '../pantalla_usuario_inicio_sesion_exitosa.dart';

class BodyUsuarioCerroSesion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Column col = Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight! * 0.04),
        Image.asset(
          "images/cerrar_sesion.png",
          height: SizeConfig.screenHeight! * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight! * 0.08),
        Text(
          "Cerró Sesión",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth! * 0.8,
          child: BotonPredeterminado(
            text: "Continuar",
            press: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (BuildContext context) =>  PantallaUsuarioInicioSesion()));
            },
          ),
        ),
        const Spacer(),
      ],
    );


    return col;
  }
}
