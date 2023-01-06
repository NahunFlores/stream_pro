import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stream_pro/components/item_cuentas.dart';
import 'package:stream_pro/config/size_config.dart';
import 'package:stream_pro/models/Cuentas.dart';
import 'cuentas_encabezado.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            const EncabezadoCuentas(),
            const Divider(
                height: 20,
                thickness: 3,
                indent: 25,
                endIndent: 25,
                color: Color(0xFF01579B)),
            SizedBox(height: getProportionateScreenWidth(10)),
            ListWigetProveedor(),
            SizedBox(height: getProportionateScreenWidth(30)),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}

class ListWigetProveedor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection(Cuentas.TABLE_NAME)
            .where("user", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
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
                  if (snapshot.data!.size > 0) {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data!.size,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ItemWigetCuentas(snapshot.data!.docs[index]);
                      },
                    );
                  } else {
                    return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(22),
                          vertical: getProportionateScreenWidth(1),
                        ),
                        child: Image(
                            image: Image.asset('images/sin_cuentas.jpg')
                                .image));
                  }
                },
              );
          }
        },
      ),
    );
  }
}
