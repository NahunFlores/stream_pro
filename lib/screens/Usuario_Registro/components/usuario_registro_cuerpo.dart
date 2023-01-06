import 'package:flutter/material.dart';
import 'package:stream_pro/components/social_cards.dart';
import 'package:stream_pro/config/constants.dart';
import 'package:stream_pro/config/size_config.dart';
import 'package:stream_pro/screens/Usuario_Inicio_Sesion_Exitosa/pantalla_usuario_inicio_sesion_exitosa.dart';

import 'usuario_registro_formulario.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight! * 0.04), // 4%
                Text("Registrar", style: headingStyle),
                const Text(
                  "A continuación se le muestra un formulario; porfavor  \n ingrese la información correcta.",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.08),
                FormularioNuevaCuenta(),
                SizedBox(height: SizeConfig.screenHeight! * 0.08),
                SizedBox(height: getProportionateScreenHeight(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Puedes iniciar sesión con GOOGLE',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    SocialCards(
                      icon: "icons/google-icon.svg",
                      press: () {
                        Navigator.pushNamed(context, PantallaUsuarioInicioSesionExitosa.routeName );
                      },
                    ),
                    //SocialCards(icon: "icons/facebook-2.svg", press: () {},),
                    //SocialCards(icon: "icons/twitter.svg", press: () {},),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Text(
                  'Al continuar, confirma que está de acuerdo \n con nuestros Términos y Condiciones.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
