import 'package:flutter/material.dart';
import 'package:stream_pro/config/constants.dart';
import 'package:stream_pro/config/size_config.dart';
import 'form_nuevo_cliente.dart';

class Body extends StatelessWidget {
  List<String> lista_cuentas;

  Body(this.lista_cuentas);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight! * 0.04), // 4%
                FormularioNuevoCliente.update
                    ?   Text("Actualizar Cliente", style: TextStyle(
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).hintColor,
                  height: 1.5,
                )) :
                Text("Nueva Cliente", style: TextStyle(
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).hintColor,
                  height: 1.5,)),
                SizedBox(height: SizeConfig.screenHeight! * 0.08),
                FormularioNuevoCliente(lista_cuentas),

                SizedBox(height: SizeConfig.screenHeight! * 0.08),

                SizedBox(height: getProportionateScreenHeight(20))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
