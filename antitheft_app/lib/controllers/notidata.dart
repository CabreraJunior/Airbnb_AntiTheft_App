import 'package:antitheft_app/controllers/fdata.dart';
import 'package:antitheft_app/utilities/constants.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationData {
  InitializationSettings initializationSettings = const InitializationSettings(
    android: AndroidInitializationSettings("@mipmap/ic_launcher"),
    iOS: null,
    macOS: null,
    linux: null,
  );

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void initializePlugin() {
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) {
        switch (notificationResponse.notificationResponseType) {
          case NotificationResponseType.selectedNotification:
            break;
          case NotificationResponseType.selectedNotificationAction:
            break;
        }
      },
    );
  }

  void showNotifications(String name, String status, String room) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
            "ScheduleNotification001", "Local Notification",
            channelDescription: "To send local notification",
            importance: Importance.high);

    const NotificationDetails details =
        NotificationDetails(android: androidNotificationDetails);
    flutterLocalNotificationsPlugin.show(
        01, "Sensor de $name", "$status - Hab. $room", details);
  }

  Future<void> callAll() async {
    List devices = await FireData().getAllDevices();
    bool out = true;
    for (var dev in devices) {
      if (dev["Name"] == "Televisión") {
        if (dev["Data"] <= 0.7) {
          out = false;
          initializePlugin();
          showNotifications(
              dev["Name"], "Alerta", dev["Room"].toInt().toString());
          await FireData().addNotifications(
              "Sensor de Televisión", "Alerta - Hab. ${dev["Room"].toInt()}");
        }
      }
      if (dev["Name"] == "Decibeles") {
        if (dev["Data"] >= 70) {
          out = false;
          initializePlugin();
          showNotifications(
              dev["Name"], "Alerta", dev["Room"].toInt().toString());
          await FireData().addNotifications(
              "Sensor de Decibeles", "Alerta - Hab. ${dev["Room"].toInt()}");
        }
      }
      if (dev["Name"] == "Humo") {
        if (dev["Data"] >= 1000000) {
          out = false;
          initializePlugin();
          showNotifications(
              dev["Name"], "Alerta", dev["Room"].toInt().toString());
          await FireData().addNotifications(
              "Sensor de Humo", "Alerta - Hab. ${dev["Room"].toInt()}");
        }
      }
    }
  }
}
