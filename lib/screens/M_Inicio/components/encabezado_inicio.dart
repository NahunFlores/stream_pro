import 'package:flutter/material.dart';
import 'package:stream_pro/config/size_config.dart';

class EncabezadoInicio extends StatelessWidget {
  const EncabezadoInicio({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20)
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [

        ],
      ),
    );
  }
}
