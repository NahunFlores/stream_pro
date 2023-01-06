import 'package:flutter/material.dart';
import 'package:stream_pro/config/size_config.dart';

class TituloSeccion extends StatelessWidget {
  const TituloSeccion({
    Key? key,
    required this.title, 
    this.press
  }) : super(key: key);

  final String title;
  final GestureTapCallback? press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.black,
          ),
        ),
        GestureDetector(
          onTap: press,
          child: const Text(
            "",
            style: TextStyle(color: Color(0xFFBBBBBB)),
          ),
        ),
      ],
    );
  }
}
