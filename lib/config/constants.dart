import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:stream_pro/config/size_config.dart';
import 'package:stream_pro/config/theme.dart';

const kPrimaryColor = Color(0xFF006064);
const kPrimaryLightColor = Color(0xFFE0F7FA);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF00ACC1), Color(0xFF006064)],
);
const kSecondaryColor = Color(0xFF979797);

const kTextColor = Color(0xFF757575);
const kRosaMaterial = Color(0xFFAD1457);
const KRosaMaterial2 = Color(0xFFE91E63);
const kAzulMaterial = Color(0xFF01579B);
const kTextLigntColor = Color(0xFF7286A5);

const DarkPrimaryColor = Color(0xFF263238);
const DarkFondoExternoColor = Color(0xFF1C1C1C);
const DarkFondoInterno = Color(0xFF212121);
const DarkBorde = Color(0xFF2C2C2C);
const DarkTextColor = Colors.black45;

const kAnimationDuration = Duration(milliseconds: 100);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: theme().hintColor,
  height: 1.5,
);

const kDefaultPadding = 20.0;

const kDefaultShadow = BoxShadow(
  offset: Offset(0, 4),
  blurRadius: 4,
  color: Colors.black26,
);

const defaultDuration = Duration(milliseconds: 50);

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Por favor introduzca el correo electrónico";
const String kInvalidoEmailError =
    "Por favor introduzca un correo electrónico válido";
const String kContrasenaNullError = "Por favor, introduzca la contraseña";
const String kContrasenaCortaError = "La contraseña es demasiado corta";
const String kContrasenaNoCoincideError = "Las contraseñas no coinciden";
const String kNombreNullError = "Por favor, escriba el nombre";
const String kApodoNullError = "Por favor, escriba el apodo";
const String kApellidoNullError = "Por favor, escriba el apellido";
const String kTelefonoNullError = "Por favor, introduzca el número de teléfono";
const String kPrecioNullError = "Por favor, introduzca el precio de la cuenta";
const String kDireccionNullError = "Ingrese la dirección";
const String kFechaDeCompraNullError = "Seleccione la fecha de compra";
const String kFechaDeVentaNullError = "Seleccione la fecha de venta";
const String kProvedorNullError = "Seleccione el propietario de la cuenta";
const String kPlataformaNullError = "Seleccione la plataforma";
const String kMembresiaNullError = "Seleccione la membresia";
const String kPantallasNullError = "Seleccione la cantidad de pantallas";

MaskTextInputFormatter formatter_hnd =
    MaskTextInputFormatter(mask: "+504 ####-####");
MaskTextInputFormatter formatter_esp =
    MaskTextInputFormatter(mask: "+34 ###-###-###");
MaskTextInputFormatter formatter_ing =
    MaskTextInputFormatter(mask: "+44 ####-####-###");
MaskTextInputFormatter formatter_mex =
    MaskTextInputFormatter(mask: "+52 ###-###-####");
MaskTextInputFormatter formatter_col =
    MaskTextInputFormatter(mask: "+57 ####-###");
MaskTextInputFormatter formatter_lempiras =
    MaskTextInputFormatter(mask: "#####");

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}

void mensajeToast(String e) {
  Fluttertoast.showToast(
      msg: e,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Color(0xff01579b),
      textColor: Colors.white,
      fontSize: 22.0);
}
