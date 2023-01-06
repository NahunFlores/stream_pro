import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stream_pro/config/constants.dart';
import 'package:stream_pro/config/size_config.dart';

import 'formulario_usuario_perfil_completado.dart';

class Body extends StatelessWidget {
  UserCredential user;
  Body({required this.user});

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
                SizedBox(height: SizeConfig.screenHeight! * 0.03),
                Text("Completar Perfil", style: headingStyle),
                const Text(
                  "Complete sus datos o continúe \n con las redes sociales",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.06),
                CompleteProfileForm(user: user),
                SizedBox(height: getProportionateScreenHeight(30)),
                Text(
                  "Al continuar, confirma que está de acuerdo \n con nuestros Términos y Condiciones",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
