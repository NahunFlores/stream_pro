import 'package:flutter/material.dart';
import 'package:stream_pro/config/constants.dart';
import 'package:stream_pro/config/size_config.dart';
import 'package:stream_pro/screens/M_Usuario_Ajustes/components/ver_ajustes.dart';

class BodyAjustes extends StatelessWidget {
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
                Text(
                  "Ajustes",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(30),
                    color: kAzulMaterial,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.04),
                const Ajustes(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


