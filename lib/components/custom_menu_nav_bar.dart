import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stream_pro/screens/M_Clientes/pantalla_clientes.dart';
import 'package:stream_pro/screens/M_Proveedores/pantalla_proveedores.dart';
import 'package:stream_pro/screens/M_Cuentas/pantalla_cuentas.dart';
import 'package:stream_pro/screens/M_Usuario/pantalla_usuario.dart';

import '../config/constants.dart';
import '../config/enums.dart';

class CustomButtomNavBar extends StatelessWidget {
  const CustomButtomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = const Color(0xFFB6B6B6);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(

        color: Theme.of(context).highlightColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -5),
            blurRadius: 10,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon:Icon (
                  Icons.home,
                  color: MenuState.inicio == selectedMenu
                      ? kRosaMaterial
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    null,
                ),

              IconButton(
                icon:Icon (
                  Icons.wc,
                  color: MenuState.clientes == selectedMenu
                      ? inActiveIconColor
                      : kAzulMaterial,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, PantallaClientes.routeName),
              ),

              IconButton(
                icon:Icon (
                  Icons.article_outlined,
                  color: MenuState.proveedores == selectedMenu
                      ? inActiveIconColor
                      : kAzulMaterial,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, PantallaProveedores.routeName),
              ),

              IconButton(
                icon:Icon (
                  Icons.wysiwyg,
                  color: MenuState.cuentas == selectedMenu
                      ? inActiveIconColor
                      : kAzulMaterial,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, PantallaCuentas.routeName),
              ),

              IconButton(
                icon:Icon (
                  Icons.assignment_ind_outlined,
                  color: MenuState.usuario == selectedMenu
                      ? inActiveIconColor
                      : kAzulMaterial,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, PantallaUsuario.routeName),
              ),
            ],
          )
      ),
    );
  }
}
