// import 'dart:async';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services..
//   print(message.data);
//
//   await Firebase.initializeApp();
//   print('Handling a background message ${message.messageId}');
// }
//
// late AndroidNotificationChannel channel;
//
// late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//   );
//
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//
//   if (!kIsWeb) {
//     channel = const AndroidNotificationChannel(
//       'high_importance_channel', // id
//       'High Importance Notifications', // title
//       importance: Importance.high,
//     );
//
//     // flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//
//     var androidInitilize = AndroidInitializationSettings('logo');
//     var iOSinitilize = IOSInitializationSettings();
//     var initilizationsSettings = InitializationSettings(
//         android: androidInitilize, iOS: iOSinitilize);
//     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//     flutterLocalNotificationsPlugin.initialize(initilizationsSettings,
//         onSelectNotification: (payload){
//       print("payload $payload");
//         });
//
//     // await flutterLocalNotificationsPlugin
//     //     .resolvePlatformSpecificImplementation<
//     //     AndroidFlutterLocalNotificationsPlugin>()
//     //     ?.createNotificationChannel(channel);
//
//     await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//   }
//   runApp(MessagingExampleApp());
//
// }
//
// class MessagingExampleApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Messaging Example App',
//       theme: ThemeData.dark(),
//       routes: {
//         '/': (context) => Application(),
//       },
//     );
//   }
// }
//
// class Application extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _Application();
// }
//
// class _Application extends State<Application> {
//
//   @override
//   void initState() {
//     super.initState();
//
//
//
//
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//
//       print(message.data);
//       RemoteNotification? notification = message.notification;
//       AndroidNotification? android = message.notification?.android;
//       if (notification != null && android != null && !kIsWeb) {
//         flutterLocalNotificationsPlugin.show(
//           notification.hashCode,
//           notification.title,
//           notification.body,
//           NotificationDetails(
//             android: AndroidNotificationDetails(
//               channel.id,
//               channel.name,
//               icon: 'launch_background',
//             ),
//           ),
//         );
//       }
//     });
//
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       print('A new onMessageOpenedApp event was published!');
//
//     });
//     FirebaseMessaging.instance.subscribeToTopic("AllUser").then((value) {
//       print("TOPIC SUBSCRIBED");
//     });
//
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Cloud Messaging'),
//
//       ),
//
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//           ],
//         ),
//       ),
//     );
//   }
// }
