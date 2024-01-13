import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> onBackgroundMessage(RemoteMessage message) async {
  await Firebase.initializeApp();

  if (message.data.containsKey('data')) {
    final data = message.data['data'];
  }

  if (message.data.containsKey('notification')) {
    final notification = message.data['notification'];
  }
}

class FirebaseApi{
  final firebaseMessaging = FirebaseMessaging.instance;
    final streamCtrl = StreamController<String>.broadcast();
  final titleCtrl = StreamController<String>.broadcast();
  final bodyCtrl = StreamController<String>.broadcast();
  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
  AndroidNotificationChannel? channel;
  setNotifications() {
    FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);

    foregroundNotification();

    backgroundNotification();

  }


  foregroundNotification() async {
    channel = const AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      importance: Importance.high,
      enableVibration: true,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin?.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel!);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      listenFCM(message);
      if (message.data.containsKey("data")) {
        streamCtrl.sink.add(message.data['data']);
      }

      if (message.data.containsKey('notification')) {
        streamCtrl.sink.add(message.data['notification']);
      }

      titleCtrl.sink.add(message.notification?.title??"");
      bodyCtrl.sink.add(message.notification?.body??"");
    });
  }

    backgroundNotification() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.data.containsKey("data")) {
        streamCtrl.sink.add(message.data['data']);
      }

      if (message.data.containsKey('notification')) {
        streamCtrl.sink.add(message.data['notification']);
      }

      titleCtrl.sink.add(message.notification?.title??"");
      bodyCtrl.sink.add(message.notification?.body??"");
    });
  }


  dispose() {
    streamCtrl.close();
    titleCtrl.close();
    bodyCtrl.close();
  }

  void listenFCM(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification!= null && android!= null) {
      flutterLocalNotificationsPlugin?.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel!.id, channel!.name,
            icon: '@mipmap/ic_launcher',
            // color: Colors.black,
          ),
        ),
      );
    }
  }

}
