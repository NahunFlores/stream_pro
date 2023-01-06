import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stream_pro/components/renovacion_cliente.dart';
import 'package:stream_pro/config/constants.dart';
import 'package:stream_pro/config/guardado_preferences.dart';
import 'package:stream_pro/config/size_config.dart';
import 'package:stream_pro/models/Clientes.dart';
import '../../../Notificacion.dart';
import 'inicio_renovaciones_proveedores.dart';
import 'inicio_titulo_seccion.dart';

class RenovacionesClientes extends StatelessWidget {
  final Notifications _notifications = Notifications();

  @override
  Widget build(BuildContext context) {
    _notifications.initNotifications();
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: TituloSeccion(title: "Renovación de Clientes", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection(Clientes.TABLE_NAME)
              .where("user", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .where("fecha_renovacion",
                  isEqualTo: DateFormat("dd").format(DateTime.now()))
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text("Error en la base de datos");
            }
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              default:
                return Builder(builder: (context) {
                  if (snapshot.data!.size != 0) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(
                            snapshot.data!.size,
                            (index) {
                              StorageManager.readData("notificaciones")
                                  .then((value) {
                                if (value.toString() == "true" &&
                                    snapshot.data!.docs[index]["pago"] ==
                                        'false') {
                                  _notifications.pushNotification(
                                      index + 9999,
                                      "Renovacion de:",
                                      "Cliente: " +
                                          snapshot.data!.docs[index]["nombre"] +
                                          ",  \n" +
                                          "Fecha venta: " +
                                          snapshot.data!.docs[index]["fecha_venta"]);
                                }
                              });
                              return RenovacionCliente(
                                  snapshot: snapshot.data!.docs[index]);

// here by default width and height is 0
                            },
                          ),
                          SizedBox(width: getProportionateScreenWidth(20)),
                        ],
                      ),
                    );
                  } else {
                    return SpecialOfferCard(
                      nombreProveedor: "No hay renovaciones este día",
                      cantidadDeCuentas: 0,
                      press: () {},
                    );
                  }
                });

            }
          },
        ),
      ],
    );
  }
}
