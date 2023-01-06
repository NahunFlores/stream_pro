import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stream_pro/screens/M_Inicio/components/inicio_campo_buscar.dart';

import '../../../config/constants.dart';

class UsuarioMenu extends StatelessWidget {
  const UsuarioMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  backgroundColor: const Color(0xFFF5F6F9),
                  padding: const EdgeInsets.all(20),
                ),
        onPressed: press,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: const Color(0xFF01579B),
              width: 22,
            ),
            const SizedBox(width: 20),
            Expanded(child: Text(text, style: const TextStyle(color: Color(0xFF01579B)),)),
            const Icon(Icons.arrow_forward_ios, color: Color(0xFF01579B),),
          ],
        ),
      ),
    );
  }
}
