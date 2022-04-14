import 'package:auction/controllers_providers/Comments/comments_by_cars.dart';
import 'package:auction/controllers_providers/Comments/comments_by_coupon.dart';
import 'package:auction/controllers_providers/Coupon/coupon.dart';
import 'package:auction/controllers_providers/Auction/auction_provider.dart';
import 'package:auction/controllers_providers/Auth/auth_provider.dart';
import 'package:auction/controllers_providers/Dashboard/dashboard_provider.dart';
import 'package:auction/controllers_providers/normalSale/normalSaleProvider.dart';
import 'package:auction/controllers_providers/PaymentMethod/payment_method_provider.dart';
import 'package:auction/controllers_providers/Wallet/wallet_provider.dart';
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
        ),
        ChangeNotifierProvider(
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
        ChangeNotifierProvider(
          create: (BuildContext context) => NormalSaleProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => CommentProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => CouponProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => CommentByCoupon(),
        ),
      ],
      child: const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
