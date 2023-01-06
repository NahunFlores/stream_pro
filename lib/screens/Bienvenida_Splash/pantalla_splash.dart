import 'package:flutter/material.dart';
import 'package:stream_pro/Notificacion.dart';
import 'package:stream_pro/config/guardado_preferences.dart';
import 'package:stream_pro/screens/Bienvenida_Splash/components/cuerpo_splash.dart';
import 'package:stream_pro/config/size_config.dart';

class PantallaSplash extends StatelessWidget {
  static String routeName = "/splash";


  @override
  Widget build(BuildContext context) {

    if(StorageManager.readData("theme")==null){
      StorageManager.saveData("theme", "luz");
    }
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),

    );


  }
}
