import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stream_pro/components/custom_sufijo_texto.dart';
import 'package:stream_pro/components/custom_boton_predeterminado.dart';
import 'package:stream_pro/components/custom_formulario_erroneo.dart';
import 'package:stream_pro/models/Usuarios.dart';
import 'package:stream_pro/screens/Usuario_Inicio_Sesion/pantalla_usuario_inicio_sesion.dart';
import 'package:stream_pro/screens/otp/pantalla_otp.dart';

import 'package:stream_pro/config/constants.dart';
import 'package:stream_pro/config/size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  UserCredential user;
  CompleteProfileForm({required this.user});
  @override
  _CompleteProfileFormState createState() =>
      _CompleteProfileFormState(user: user);
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  UserCredential user;
  _CompleteProfileFormState({required this.user});

  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String? email;
  String? userid;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;

  void addError({required String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({required String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildUIDField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildEmailField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          FormularioErroneo(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          BotonPredeterminado(
            text: "continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                Usuarios usu = Usuarios(
                    displayname: "$firstName $lastName",
                    correoElectronico: email ?? "",
                    telefono: phoneNumber ?? "",
                    direccion: address ?? "");

                String msg = "Usuario registrado con exito";
                FirebaseFirestore.instance
                    .collection(Usuarios.TABLE_NAME)
                    .add(usu.toMap());

                Fluttertoast.showToast(
                    msg: msg,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 2,
                    backgroundColor: const Color(0xff01579b),
                    textColor: Colors.white,
                    fontSize: 22.0);

                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            PantallaUsuarioInicioSesion()));
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildEmailField() {
    return TextFormField(
      initialValue: user.user!.email,
      readOnly: true,
      onSaved: (newValue) => email = newValue,
      decoration: const InputDecoration(
        labelText: "Correo",
        hintText: "Ingrese su nombre",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSufijoTexto(svgIcon: "icons/Icono Usuario.svg"),
      ),
    );
  }

  TextFormField buildUIDField() {
    return TextFormField(
      initialValue: user.user!.uid,
      readOnly: true,
      onSaved: (newValue) => userid = newValue,
      decoration: const InputDecoration(
        labelText: "ID",
        hintText: "Ingrese su nombre",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSufijoTexto(svgIcon: "icons/Icono Usuario.svg"),
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kDireccionNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kDireccionNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Dirección",
        hintText: "Ingrese su dirección telefonica",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSufijoTexto(svgIcon: "icons/Icono Direccion.svg"),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kTelefonoNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kTelefonoNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Número de teléfono",
        hintText: "Ingrese su número telefónico",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSufijoTexto(svgIcon: "icons/Icono Smartphone.svg"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      onSaved: (newValue) => lastName = newValue,
      decoration: const InputDecoration(
        labelText: "Apellido",
        hintText: "Ingrese su apellido",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSufijoTexto(svgIcon: "icons/Icono Usuario.svg"),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNombreNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNombreNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Nombre",
        hintText: "Ingrese su nombre",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSufijoTexto(svgIcon: "icons/Icono Usuario.svg"),
      ),
    );
  }
}
