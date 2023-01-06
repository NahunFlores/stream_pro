import 'package:flutter/material.dart';
import 'package:stream_pro/config/size_config.dart';
import 'clientes_campo_buscar.dart';

class EncabezadoClientes extends StatelessWidget {
  const EncabezadoClientes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CampuBuscarClientes(key: UniqueKey()),
        ],
      ),
    );
  }
}
