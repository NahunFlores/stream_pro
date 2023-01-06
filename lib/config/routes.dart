import 'package:flutter/widgets.dart';
import 'package:stream_pro/screens/CalculadoraTM/pantalla_calculadoraTigoMoney.dart';
import 'package:stream_pro/screens/Nuevo_Cliente/pantalla_nuevo_cliente_inicio.dart';
import 'package:stream_pro/screens/Nuevo_Proveedor/pantalla_nuevo_proveedor_inicio.dart';
import 'package:stream_pro/screens/Nueva_Cuenta/pantalla_nueva_cuenta_inicio.dart';
import 'package:stream_pro/screens/Usuario_Cerro_Sesion_Exitosa/pantalla_usuario_inicio_sesion_exitosa.dart';

import '../screens/Bienvenida_Splash/pantalla_splash.dart';
import '../screens/usuario_registro/pantalla_usuario_registro.dart';
import '../screens/usuario_inicio_sesion/pantalla_usuario_inicio_sesion.dart';
import '../screens/usuario_perfil_completado/pantalla_usuario_perfil_completado.dart';
import '../screens/Usuario_Recuperar_Contrasena/pantalla_usuario_olvido_contrasena.dart';
import '../screens/usuario_inicio_sesion_exitosa/pantalla_usuario_inicio_sesion_exitosa.dart';
import '../screens/otp/pantalla_otp.dart';

import '../screens/M_Inicio/pantalla_inicio.dart';
import '../screens/M_Clientes/pantalla_clientes.dart';
import '../screens/M_Cuentas/pantalla_cuentas.dart';
import '../screens/M_Proveedores/pantalla_proveedores.dart';
import '../screens/M_Usuario/pantalla_usuario.dart';

import '../screens/M_Usuario_Mi_Cuenta/pantalla_mi_cuenta.dart';
import '../screens/M_Usuario_Informacion/pantalla_informacion.dart';
import '../screens/M_Usuario_Ajustes/pantalla_ajustes.dart';

// Uso de ruta
// Todas nuestras rutas estarán disponibles aquí
final Map<String, WidgetBuilder> routes = {
  PantallaSplash.routeName: (context) => PantallaSplash(),
  PantallaUsuarioInicioSesion.routeName: (context) => PantallaUsuarioInicioSesion(),
  PantallaUsuarioOlvidoContrasena.routeName: (context) => PantallaUsuarioOlvidoContrasena(),
  PantallaUsuarioInicioSesionExitosa.routeName: (context) => PantallaUsuarioInicioSesionExitosa(),
  PantallaUsuarioRegistro.routeName: (context) => PantallaUsuarioRegistro(),
  PantallaOtp.routeName: (context) => PantallaOtp(),

  PantallaInicio.routeName: (context) => PantallaInicio(),

  //PantallaNuevoClienteInicio.routeName: (context) => PantallaNuevoClienteInicio(),
  PantallaNuevoProveedorInicio.routeName: (context) => PantallaNuevoProveedorInicio(),
  //PantallaNuevaCuentaInicio.routeName: (context) => PantallaNuevaCuentaInicio(),

  PantallaCuentas.routeName: (context) => PantallaCuentas(),
  PantallaClientes.routeName: (context) => PantallaClientes(),
  PantallaProveedores.routeName: (context) => PantallaProveedores(),
  PantallaUsuario.routeName: (context) => PantallaUsuario(),

  PantallaMiCuenta.routeName: (context) => PantallaMiCuenta(),
  PantallaInformacion.routeName: (context) => PantallaInformacion(),
  PantallaAjustes.routeName: (context) => PantallaAjustes(),
  PantallaUsuarioCerroSesionExitosa.routeName: (context) => PantallaUsuarioCerroSesionExitosa(),

  PantallaCalculadoraTM.routeName: (context)  => PantallaCalculadoraTM(),

 };
