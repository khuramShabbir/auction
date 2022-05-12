import 'package:auction/controllers_providers/Auction/auction_provider.dart';
import 'package:auction/controllers_providers/Auth/auth_provider.dart';
import 'package:auction/controllers_providers/Dashboard/dashboard_provider.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/views/home/all_auctions_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage event) async {
  print('FirebaseMessaging.onMessage.listen');
  print("event.data ${event.data.toString()}");
  await Firebase.initializeApp();


}

class FCM {

  FirebaseMessaging? _messaging;

  FCM() {
    FlutterLocalNotificationsPlugin fltrNotification;

    var androidInitilize = const AndroidInitializationSettings('logo');
    var iOSinitilize = const IOSInitializationSettings();
    var initilizationsSettings = InitializationSettings(android: androidInitilize, iOS: iOSinitilize);
    var androidDetails =const AndroidNotificationDetails("Channel ID", "Desi programmer",
        importance: Importance.max,
        priority: Priority.max);
    var iSODetails = const IOSNotificationDetails();
    var generalNotificationDetails =NotificationDetails(android: androidDetails, iOS: iSODetails);

    fltrNotification = FlutterLocalNotificationsPlugin();
    Firebase.initializeApp().then((fbr) async {
      _messaging = FirebaseMessaging.instance;
      _messaging?.getToken().then((token) async {
        FirebaseMessaging.onBackgroundMessage(
            _firebaseMessagingBackgroundHandler);

        await _messaging?.subscribeToTopic("AllUser").then((value) => null);
        if(getUser()!=null){

        await _messaging?.subscribeToTopic("${getUser()!.result!.id}").then((value) => null);
        }

        NotificationSettings settings = await _messaging!.requestPermission(
          alert: true,
          badge: true,
          provisional: false,
          sound: true,
        );

        if (settings.authorizationStatus == AuthorizationStatus.authorized) {
          await Firebase.initializeApp();
          FirebaseMessaging.onMessageOpenedApp.listen((event) {
            _openScreenForNotifications(event.data);
          });
          FirebaseMessaging.onMessage.listen((event) async {
            print('FirebaseMessaging.onMessage.listen');
            print("event.data ${event.data.toString()}");

            fltrNotification.initialize(initilizationsSettings,
                onSelectNotification: ((payload) {
                  _openScreenForNotifications(event.data);
                }));
              await fltrNotification.show(
                  dashBoardProvider.notificationNumber,
                  event.notification != null ? event.notification!.title : "Title".tr,
                  event.notification != null ? event.notification!.body : "Body".tr,
                  generalNotificationDetails,
                  payload: event.data.toString());
              dashBoardProvider.increamentNotificationNumber();


            // listenFcm(event);

          });
        }
      });
    });
  }

  _openScreenForNotifications(Map<String, dynamic> payload) {

    logger.e(payload);

    while(Get.context==null){}

    Future.delayed(Duration.zero,(){
      // if user wins the auction
      auctionProvider.getAuctionByUser();

      if(Get.currentRoute.contains("AllAuctionScreen")){
        auctionProvider.getAuction();
        return;
      }
      Get.to(const AllAuctionScreen());





    });
  }
}

