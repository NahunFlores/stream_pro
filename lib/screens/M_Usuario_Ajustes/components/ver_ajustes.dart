import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream_pro/config/dark_theme_provider.dart';
class Ajustes extends StatefulWidget {
  const Ajustes({key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<Ajustes> {
  bool _DarkMode = false;
  bool _Notifications = false;

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Column(
      children: [
        SwitchListTile(
            title: new Text('Modo Noche'),
            value: themeChange.darkTheme,
            onChanged: (bool value) {
              themeChange.darkTheme = value;
            }),
        
      ],
    );
  }
}
