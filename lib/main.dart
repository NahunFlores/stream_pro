import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream_pro/Notificacion.dart';
import 'package:stream_pro/config/dark_theme_provider.dart';
import 'package:stream_pro/config/dark_theme_styles.dart';
import 'config/routes.dart';
import 'firebase_options.dart';
import 'screens/Bienvenida_Splash/pantalla_splash.dart';
import 'config/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  Stream_pro createState() => new Stream_pro();
}

class Stream_pro extends State<MyApp> {
  // Este widget es la raíz de la aplicación.
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();
  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
          builder: (BuildContext context, value, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Stream Pro',
          theme: Styles.themeData(themeChangeProvider.darkTheme, context),
          // Usamos routeName para que no necesitemos recordar el nombre
          initialRoute: PantallaSplash.routeName,
          routes: routes,
        );
      }),
    );
  }
}
