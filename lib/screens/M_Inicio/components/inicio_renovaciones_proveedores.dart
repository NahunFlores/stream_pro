import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:share/share.dart';
import 'package:stream_pro/config/constants.dart';
import 'package:stream_pro/config/guardado_preferences.dart';
import 'package:stream_pro/config/size_config.dart';
import 'package:stream_pro/models/Proveedores.dart';
import '../../../Notificacion.dart';
import 'inicio_titulo_seccion.dart';

class RenovacionesProveedores extends StatelessWidget {
  static final Notifications _notifications = Notifications();
  const RenovacionesProveedores({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RenovacionesProveedores._notifications.initNotifications();
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: TituloSeccion(
            title: "Renovación de Proveedores",
            press: () {},
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection(Proveedores.TABLE_NAME)
                .where("user", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text("Error en la base de datos");
              }
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const CircularProgressIndicator();
                  break;
                default:
                  return Builder(builder: (context) {
                    List<SpecialOfferCard> proveedores = [];
                    if (snapshot.data!.size > 0) {
                      for (int i = 0; i < snapshot.data!.size; i++) {
                        StorageManager.readData("notificaciones").then((value) {

                          if (value.toString() == "true" &&
                              int.parse(snapshot.data!.docs[i]["cuentas"]
                                      .toString()) >
                                  0) {
                            RenovacionesProveedores._notifications
                                .pushNotification(
                                    i + 1,
                                    "Renovaciones de:",
                                    snapshot.data!.docs[i]["cuentas"] +
                                        " de el Proveedor: " +
                                        snapshot.data!.docs[i]["nombre"]);
                          }
                        });

                        proveedores.add(SpecialOfferCard(
                          nombreProveedor:
                              snapshot.data!.docs[i]['nombre'],
                          cantidadDeCuentas: int.parse(snapshot.data!.docs[i]['cuentas']
                              .toString()),
                          press: () {
                            alerta([
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Share.share("*RENOVACIÓN " +
                                        DateFormat("dd/MMMM/yy")
                                            .format(DateTime.now()) +
                                        "*\n" +
                                        "Cuentas:\n" +
                                        "");
                                  },
                                  child: const Text("Si")),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("No"))
                            ]);
                          },
                        ));
                      }
                    } else {
                      proveedores.add(SpecialOfferCard(
                        nombreProveedor: "No hay renovaciones este día",
                        cantidadDeCuentas: 0,
                        press: () {},
                      ));
                    }


                    return Row(
                      children: proveedores,
                    );
                  });
                  break;
              }
            },
          ),
        ),
      ],
    );
  }
}

Future<bool?> notoficacion() async {
  var noti = await SharedPreferences.getInstance();
  return noti.getBool("notificaciones");
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.nombreProveedor,
    required this.cantidadDeCuentas,
    required this.press,
  }) : super(key: key);

  final String nombreProveedor;
  final int cantidadDeCuentas;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: getProportionateScreenWidth(20),
        right: getProportionateScreenWidth(20),
        bottom: getProportionateScreenWidth(5),
      ),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(340),
          height: getProportionateScreenWidth(75),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF343434).withOpacity(0.4),
                    image: const DecorationImage(
                      image: ExactAssetImage('images/background1.png'),
                      fit: BoxFit.fitHeight,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: const TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$nombreProveedor\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(15),
                          ),
                        ),
                        TextSpan(
                          text: "$cantidadDeCuentas Cuentas",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(22),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

AlertDialog alerta(var actions) {
  return AlertDialog(
    title: const Text("Advertencia"),
    content: const Text("Desea renovar las cuentas de este proveedor:"),
    actions: actions,
  );
}
