import 'package:flutter/material.dart';
import 'package:stream_pro/config/size_config.dart';

class BtnIconoRedondeado extends StatelessWidget {
  const BtnIconoRedondeado({
    required Key key,
    required this.icon,
    required this.press,
    this.showShadow = false,
  }) : super(key: key);

  final IconData icon;
  final GestureTapCancelCallback press;
  final bool showShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          if (showShadow)
            BoxShadow(
              offset: const Offset(0, 6),
              blurRadius: 10,
              color: const Color(0xFFB0B0B0).withOpacity(0.2),
            ),
        ],
      ),
      child: TextButton(
        style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                backgroundColor:  Colors.white,
                padding: const EdgeInsets.all(0),
              ),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }
}
