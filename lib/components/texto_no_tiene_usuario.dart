import 'package:flutter/material.dart';
import 'package:stream_pro/screens/Usuario_Registro/pantalla_usuario_registro.dart';
import 'package:stream_pro/config/constants.dart';
import 'package:stream_pro/config/size_config.dart';

class TextoNoTieneUsuario extends StatelessWidget {
  const TextoNoTieneUsuario({
     Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "¿No tienes una cuenta? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, PantallaUsuarioRegistro.routeName),
          child: Text(
            "Registrarse",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
