import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notifications {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  void initNotifications() async {
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('app_icon');
      final DarwinInitializationSettings initializationSettingsDarwin =
          DarwinInitializationSettings(
              onDidReceiveLocalNotification: null);
      final LinuxInitializationSettings initializationSettingsLinux =
          LinuxInitializationSettings(
              defaultActionName: 'Open notification');
      final InitializationSettings initializationSettings = InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsDarwin,
          linux: initializationSettingsLinux);
      flutterLocalNotificationsPlugin.initialize(initializationSettings,
          onDidReceiveNotificationResponse: null);
  }
  Future<void> pushNotification(id,String titulo, String subTitulo) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'push_messages: 0', 'push_messages: push_messages',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
      enableVibration: true,
    );
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        id, titulo, subTitulo, platformChannelSpecifics,
        payload: 'item x');
  }

  Future selectNotification(String payload) async {
    // some action...
  }
}