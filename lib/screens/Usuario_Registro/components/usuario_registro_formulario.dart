import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stream_pro/components/custom_sufijo_texto.dart';
import 'package:stream_pro/components/custom_boton_predeterminado.dart';
import 'package:stream_pro/components/custom_formulario_erroneo.dart';
import 'package:stream_pro/screens/Usuario_Inicio_Sesion/pantalla_usuario_inicio_sesion.dart';
import 'package:stream_pro/config/constants.dart';
import 'package:stream_pro/config/size_config.dart';
import 'package:stream_pro/screens/Usuario_Inicio_Sesion/components/cuerpo_usuario_inicio_sesion.dart';
import 'package:stream_pro/screens/Usuario_Perfil_Completado/pantalla_usuario_perfil_completado.dart';

class FormularioNuevaCuenta extends StatefulWidget {
  @override
  _FormularioNuevaCuentaState createState() => _FormularioNuevaCuentaState();
}

class _FormularioNuevaCuentaState extends State<FormularioNuevaCuenta> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? conform_password;
  bool remember = false;
  final List<String> errors = [];

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void login(BuildContext context) async {
    UserCredential user = await _auth.createUserWithEmailAndPassword(
              email: email ?? "", password: password ?? "");
    try {
      if (user != null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    PantallaUsuarioPerfilCompletado(user: user)));
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: const Color(0xff01579b),
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConformPassFormField(),
          FormularioErroneo(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          BotonPredeterminado(
            text: "Continuar",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                login(context);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => conform_password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kContrasenaNullError);
        } else if (value.isNotEmpty && password == conform_password) {
          removeError(error: kContrasenaNoCoincideError);
        }
        conform_password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kContrasenaNullError);
          return "";
        } else if ((password != value)) {
          addError(error: kContrasenaNoCoincideError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Confirmar Contraseña",
        hintText: "Escriba de nuevo su contraseña",
        // Si está utilizando la última versión de flutter, entonces el texto de la etiqueta y el texto de sugerencia se muestran así
        // si está usando flutter menos de 1.20. * entonces tal vez esto no esté funcionando correctamente
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSufijoTexto(svgIcon: "icons/Icono_Bloqueo.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kContrasenaNullError);
        } else if (value.length >= 8) {
          removeError(error: kContrasenaCortaError);
        }
        password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kContrasenaNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kContrasenaCortaError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Contraseña",
        hintText: "Escriba su contraseña",
        // Si está utilizando la última versión de flutter, entonces el texto de la etiqueta y el texto de sugerencia se muestran así
        // si está usando flutter menos de 1.20. * entonces tal vez esto no esté funcionando correctamente
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSufijoTexto(svgIcon: "icons/Icono_Bloqueo.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidoEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidoEmailError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Correo Electronico",
        hintText: "Escriba su correo electronico",
        // Si está utilizando la última versión de flutter, entonces el texto de la etiqueta y el texto de sugerencia se muestran así
        // si está usando flutter menos de 1.20. * entonces tal vez esto no esté funcionando correctamente
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSufijoTexto(
            svgIcon: "icons/Icono Correo Electronico.svg"),
      ),
    );
  }
}
