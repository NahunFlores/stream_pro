import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:share/share.dart';
import 'package:stream_pro/models/Cliente.dart';
import 'package:stream_pro/config/constants.dart';
import 'package:stream_pro/config/size_config.dart';
import 'package:stream_pro/models/Clientes.dart';
import 'package:stream_pro/models/Cuentas.dart';

class RenovacionCliente extends StatelessWidget {
  const RenovacionCliente(
      {this.width = 100, this.aspectRetio = 1.02, required this.snapshot});

  final QueryDocumentSnapshot snapshot;
  final double width, aspectRetio;

  @override
  Widget build(BuildContext context) {
    var fireDatabase = FirebaseFirestore.instance.collection(
        Clientes.TABLE_NAME);
    var fireauth = FirebaseAuth.instance.currentUser!.uid;
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection(Cuentas.TABLE_NAME)
          .where("user", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .where("correoElectronico",
          isEqualTo: snapshot["correo_electronico"])
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Error en la base de datos");
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const CircularProgressIndicator();
          default:
            return Builder(
              builder: (context) {
                String imagenDato = "";

                switch (snapshot.data?.docs[0]["plataforma"]) {
                  case 'Netflix':
                    imagenDato = "images/item_netflix.png";
                    break;
                  case 'Spotify':
                    imagenDato = "images/item_spotify.png";
                    break;
                  case 'Amazon Prime Video':
                    imagenDato = "images/item_prime_video.png";
                    break;
                  case 'Disney Plus':
                    imagenDato = "images/item_disney_plus.png";
                    break;
                  case 'HBO GO':
                    imagenDato = "images/item_hbo_go.png";
                    break;
                  case 'YouTube':
                    imagenDato = "images/item_youtube.png";
                    break;
                  default:
                    imagenDato = "images/item_youtube.png";

                    break;
                }

                Cliente cliente = Cliente(
                    idCliente: this.snapshot.id,
                    images: [imagenDato],
                    colors: [
                      const Color(0xFFF6625E),
                      const Color(0xFF836DB8),
                      const Color(0xFFDECB9C),
                      Colors.white,
                    ],
                    pagado: this.snapshot['pago'].toString() == 'false'
                        ? false
                        : true,
                    cliente: this.snapshot['nombre'],
                    precio: double.parse(
                        snapshot.data?.docs[0]["precio"].toString() ?? "0"),
                    descripcion: "");

                return Padding(
                  padding:
                  EdgeInsets.only(left: getProportionateScreenWidth(20)),
                  child: SizedBox(
                    width: getProportionateScreenWidth(width),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AspectRatio(
                          aspectRatio: 1.02,
                          child: Container(
                            padding:
                            EdgeInsets.all(getProportionateScreenWidth(0)),
                            decoration: BoxDecoration(
                              color: kSecondaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Hero(
                              tag: cliente.idCliente.toString(),
                              child: Image.asset(cliente.images[0]),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          cliente.cliente,
                          style: const TextStyle(color: Colors.black),
                          maxLines: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "L. ${cliente.precio}",
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(17),
                                fontWeight: FontWeight.w600,
                                color: kPrimaryColor,
                              ),
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(50),
                              onTap: () {
                                showDialog(context: context,
                                    builder: (context) =>
                                        alerta([
                                          TextButton(onPressed: () {
                                            Clientes cli = Clientes(
                                                nombre: this.snapshot
                                                    ['nombre'],
                                                pais: this.snapshot
                                                    ['pais'],
                                                correoElectronico: this
                                                    .snapshot
                                                    ['correo_electronico'],
                                                fechaVentas: DateFormat(
                                                    "dd/MMMM/yy").format(
                                                    DateTime.now()),
                                                fechaRenovacion: this.snapshot
                                                    ['fecha_renovacion'],
                                                telefono: this.snapshot
                                                    ['telefono'],
                                                pago: 'true',
                                                user: fireauth);

                                            cli.updateClientes(fireDatabase,
                                                this.snapshot.reference.id);


                                            String plataformass = (snapshot.data?.docs[0]["plataforma"].toString().toUpperCase()) ?? "";
                                            String correoss = this.snapshot['correo_electronico'].toString();
                                            String contraseniass = snapshot.data?.docs[0]["contrasenia"];
                                            String fechasss1 = DateFormat("dd/MMMM/yy").format(DateTime.now());
                                            String fechasss2 = DateFormat("dd/MMMM/yy").format(DateTime(DateTime.now().year, DateTime.now().month+1, DateTime.now().day));
                                            String nombress = this.snapshot['nombre'].toString().toUpperCase();

                                            Navigator.of(context).pop();
                                            Share.share("*RENOVACIÓN $plataformass*\n"
                                                        "Correo:\n$correoss\n"
                                                        "Contraseña:\n$contraseniass\n\n"
                                                        "Renueva:\n$fechasss1 a $fechasss2\n\n$nombress"
                                            );
                                          }, child: const Text("Si")),
                                          TextButton(onPressed: () {
                                            Navigator.of(context).pop();
                                          }, child: const Text("No"))
                                        ]));
                              },
                              child: Container(
                                padding: EdgeInsets.all(
                                    getProportionateScreenWidth(8)),
                                height: getProportionateScreenWidth(28),
                                width: getProportionateScreenWidth(28),
                                decoration: BoxDecoration(
                                  color: cliente.pagado
                                      ? kPrimaryColor.withOpacity(0.15)
                                      : kSecondaryColor.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: SvgPicture.asset(
                                  "icons/Icono Corazon 2.svg",
                                  color: cliente.pagado
                                      ? const Color(0xFFAD1457)
                                      : const Color(0xFFFCE4EC),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
        }
      },
    );
  }

  AlertDialog alerta(var actions) {
    return AlertDialog(
      title: const Text("Advertencia"),
      content: const Text("Desea renovar a este cliente:"),
      actions: actions,
    );
  }
}
