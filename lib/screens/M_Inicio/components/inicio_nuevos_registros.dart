import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stream_pro/models/Cuentas.dart';
import 'package:stream_pro/models/Proveedores.dart';
import 'package:stream_pro/screens/Nueva_Cuenta/components/form_nueva_cuenta.dart';
import 'package:stream_pro/screens/Nuevo_Cliente/components/form_nuevo_cliente.dart';
import 'package:stream_pro/screens/Nuevo_Cliente/pantalla_nuevo_cliente_inicio.dart';
import 'package:stream_pro/screens/Nuevo_Proveedor/components/form_nuevo_proveedor.dart';
import 'package:stream_pro/screens/Nuevo_Proveedor/pantalla_nuevo_proveedor_inicio.dart';
import 'package:stream_pro/screens/Nueva_Cuenta/pantalla_nueva_cuenta_inicio.dart';
import 'package:stream_pro/config/size_config.dart';

import 'inicio_titulo_seccion.dart';

class NuevosRegistros extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> lista = ["Ingrese un proveedor"];

    FirebaseFirestore.instance
        .collection(Proveedores.TABLE_NAME)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        if (doc["user"] == FirebaseAuth.instance.currentUser!.uid) {
          lista.add(doc["nombre"]);
        }
      }
    });

    List<String> listaCuentas = ["Ingrese una cuenta"];

    FirebaseFirestore.instance.collection(Cuentas.TABLE_NAME).get().then(
        (QuerySnapshot querySnapshot) { 
          for (var doc in querySnapshot.docs) {
              if (doc["user"] == FirebaseAuth.instance.currentUser!.uid) {
                listaCuentas.add(doc["correoElectronico"]);
              }
            }});

    List<Map<String, dynamic>> categories = [
      {"icon": "icons/comprador.svg", "text": "Cliente"},
      {"icon": "icons/vendedor.svg", "text": "Proveedor"},
      {"icon": "icons/compra.svg", "text": "Cuenta"},
    ];

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryCard(
            icon: categories[0]["icon"],
            text: categories[0]["text"],
            press: () {
              FormularioNuevoCliente.limpiar_values();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PantallaNuevoClienteInicio(listaCuentas),
                  ));
            },
          ),
          CategoryCard(
            icon: categories[1]["icon"],
            text: categories[1]["text"],
            press: () {
              FormularioNuevoProveedor.limpiar_values();
              Navigator.pushNamed(
                  context, PantallaNuevoProveedorInicio.routeName);
            },
          ),
          CategoryCard(
            icon: categories[2]["icon"],
            text: categories[2]["text"],
            press: () {
              FormularioNuevaCuenta.limpiar_values();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PantallaNuevaCuentaInicio(lista)));
            },
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(100),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(65),
              width: getProportionateScreenWidth(110),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: SvgPicture.asset(icon),
            ),
            const SizedBox(height: 5),
            Text(text, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
