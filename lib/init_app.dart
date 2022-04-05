import 'package:auction/controllers_providers/auction_provider.dart';
import 'package:auction/controllers_providers/auth_provider.dart';
import 'package:auction/controllers_providers/dashboard_provider.dart';
import 'package:auction/controllers_providers/payment_method_provider.dart';
import 'package:auction/controllers_providers/wallet_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'views/welcome_screens/splash_screen.dart';

void initApp() async {


  await GetStorage.init();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

class InitApp extends StatefulWidget {
  const InitApp({Key? key}) : super(key: key);

  @override
  State<InitApp> createState() => _InitAppState();
}

class _InitAppState extends State<InitApp> {
  @override
  void initState() {
    super.initState();
    initApp();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => AuthProvider(),
        ),  ChangeNotifierProvider(
          create: (BuildContext context) => WalletProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => DashBoardProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => PaymentProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => AuctionProvider(),
        ),
      ],
      child: const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
