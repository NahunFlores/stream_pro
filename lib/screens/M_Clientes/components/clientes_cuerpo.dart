import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stream_pro/components/item_clientes.dart';
import 'package:stream_pro/config/size_config.dart';
import 'package:stream_pro/models/Clientes.dart';
import 'clientes_encabezado.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            EncabezadoClientes(key: UniqueKey()),
            const Divider(
                height: 20,
                thickness: 3,
                indent: 25,
                endIndent: 25,
                color: Color(0xFF01579B)),
            SizedBox(height: getProportionateScreenWidth(10)),
            ListWigetClientes(),
            SizedBox(height: getProportionateScreenWidth(30)),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}

class ListWigetClientes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection(Clientes.TABLE_NAME)
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
                  if ((snapshot.data?.size ?? 0) > 0) {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data?.size,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ItemWigetClientes(snapshot.data!.docs[index] ,key: UniqueKey(),);
                      },
                    );
                  } else {
                    return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(22),
                          vertical: getProportionateScreenWidth(1),
                        ),
                        child: Image(
                            image: Image.asset('images/sin_clientes.jpg')
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
