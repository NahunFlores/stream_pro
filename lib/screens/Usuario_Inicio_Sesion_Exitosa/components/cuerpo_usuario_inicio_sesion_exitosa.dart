import 'package:flutter/material.dart';
import 'package:stream_pro/components/custom_boton_predeterminado.dart';
import 'package:stream_pro/screens/M_Inicio/pantalla_inicio.dart';
import 'package:stream_pro/config/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Column col = Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight! * 0.04),
        Image.asset(
          "images/iniciar_sesion.png",
          height: SizeConfig.screenHeight! * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight! * 0.08),
        Text(
          "Acceso Exitoso",
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
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => PantallaInicio()));
            },
          ),
        ),
        const Spacer(),
      ],
    );

    return col;
  }
}
