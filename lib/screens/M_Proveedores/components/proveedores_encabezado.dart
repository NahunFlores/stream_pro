import 'package:flutter/material.dart';
import 'package:stream_pro/config/size_config.dart';
import 'proveedores_campo_buscar.dart';

class EncabezadoProveedores extends StatelessWidget {
  const EncabezadoProveedores({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          CampoBuscarProveedores(),
        ],
      ),
    );
  }
}
