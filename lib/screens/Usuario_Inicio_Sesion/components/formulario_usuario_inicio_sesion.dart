import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stream_pro/components/custom_boton_predeterminado.dart';
import 'package:stream_pro/components/custom_sufijo_texto.dart';
import 'package:stream_pro/components/custom_formulario_erroneo.dart';
import 'package:stream_pro/helper/teclado.dart';
import 'package:stream_pro/models/DBUtilities.dart';
import 'package:stream_pro/screens/Usuario_Recuperar_Contrasena/pantalla_usuario_olvido_contrasena.dart';
import 'package:stream_pro/screens/Usuario_Inicio_Sesion_Exitosa/pantalla_usuario_inicio_sesion_exitosa.dart';

import 'package:stream_pro/config/constants.dart';
import 'package:stream_pro/config/size_config.dart';
import 'package:stream_pro/screens/Usuario_Inicio_Sesion/components/cuerpo_usuario_inicio_sesion.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool remember = false;
  final List<String> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error ?? "");
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  void login_normal(BuildContext context) async {
    UserCredential user = await CuerpoUsuarioInicioSesion.auth()
        .signInWithEmailAndPassword(
            email: email ?? "", password: password ?? "");
    try {
      if (user != null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    PantallaUsuarioInicioSesionExitosa()));
        Fluttertoast.showToast(
            msg: user.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: const Color(0xff01579b),
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "El usario no se puede registrar",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: const Color(0xff01579b),
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } on Exception catch (error) {
      String mensae = "";
      switch (error.toString()) {
        case "ERROR_EMAIL_ALREADY_IN_USE":
        case "account-exists-with-different-credential":
        case "email-already-in-use":
          mensae =
              "Correo electronico ya fue usado. Vaya a la página de inicio de sesión.";
          break;
        case "ERROR_WRONG_PASSWORD":
        case "wrong-password":
          mensae = "Correo electrónico / contraseña incorrectas.";
          break;
        case "ERROR_USER_NOT_FOUND":
        case "user-not-found":
          mensae = "Ninguna usuario encontrada con este correo electrónico.";
          break;
        case "ERROR_USER_DISABLED":
        case "user-disabled":
          mensae = "Usuario deshabilitado.";
          break;
        case "ERROR_TOO_MANY_REQUESTS":
        case "operation-not-allowed":
          mensae = "Demasiadas solicitudes para iniciar sesión en esta cuenta.";
          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
          mensae = "Error del servidor. Vuelve a intentarlo más tarde.";
          break;
        case "ERROR_INVALID_EMAIL":
        case "invalid-email":
          mensae = "Dirección de correo electrónico es inválida.";
          break;
        default:
          mensae = "Error de inicio de sesion. Inténtalo de nuevo.";
          break;
      }
      Fluttertoast.showToast(
          msg: mensae,
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
          FormularioErroneo(errors: errors),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value!;
                  });
                },
              ),
              const Text("Recordar"),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, PantallaUsuarioOlvidoContrasena.routeName),
                child: const Text(
                  "Ha olvidado su contraseña",
                ),
              )
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          BotonPredeterminado(
            text: "Continuar",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                login_normal(context);
                KeyboardUtil.hideKeyboard(context);
              }
            },
          ),
        ],
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
        return;
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
        hintText: "Ingrese su contraseña",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
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
        return;
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
        hintText: "Ingrese su correo electronico",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
