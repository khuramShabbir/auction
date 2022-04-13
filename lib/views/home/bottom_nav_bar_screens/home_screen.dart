import 'package:auction/controllers_providers/auth_provider.dart';
import 'package:auction/controllers_providers/dashboard_provider.dart';
import 'package:auction/controllers_providers/normalSale/normalSaleProvider.dart';
import 'package:auction/controllers_providers/wallet_provider.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:auction/views/home/all_auctions_screen.dart';
import 'package:auction/views/home/bottom_nav_bar_screens/all_cars_screen.dart';
import 'package:auction/views/home/CouponScreens/coupen_screen.dart';
import 'package:auction/views/wallet/wallet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> carList = [
    'assets/PngAssets/blackCar.png',
    'assets/PngAssets/whiteCar.png',
    'assets/PngAssets/menIC.png'
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    walletProvider.getWallet();

  }
  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoardProvider>(
        builder: (BuildContext context, data, child) {
      return Scaffold(
        appBar:
            AppBar(elevation: 0, backgroundColor: Colors.transparent, actions: [
          InkWell(
            onTap: (){

            },
            child: Consumer<WalletProvider>(
              builder: (builder,data,child) {
                return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(children: [
                      StaticAssets.walletSvg,
                      SizedBox(width: 10,),
                      Text(data.walletModel==null?"0 SAR":"${double.parse(data.walletModel!.result.amount.toString()).toInt()} SAR",style: TextStyle(color: Colors.black),)
                    ],));
              }
            ),
          )
        ]),
        body: SafeArea(
            child: StaticKPadding.kPadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(boxStorage.read(StorageKey.NAME) ?? 'Welcome',
                  style: TextStyle(
                      color: Colors.grey.withOpacity(.5),
                      fontWeight: FontWeight.bold,
                      fontSize: 17)),
              Text("${getUser().result!.name}", style: StaticTextStyles.headingStyle),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: InkWell(
                  onTap: () {
                    Get.to(() => const AllAuctionScreen());
                  },
                  child: Container(
                    height: height * .2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(carList[0]), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "auction that interest you",
                            style: TextStyle(
                                color: StaticColors.whiteColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Row(
                              children: [
                                Text("Get Bid",
                                    style: TextStyle(
                                        color: StaticColors.whiteColor,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  width: 15,
                                ),
                                StaticAssets.rightArrow
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: InkWell(
                  onTap: () {
                    // bottomSheetComingSoon();




                    Get.to(() =>    AllCarsScreen(true));

                  },
                  child: Container(
                    width: width,
                    height: height * .2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(carList[1]), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Car that interest you",
                            style: TextStyle(
                                color: StaticColors.whiteColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Row(
                              children: [
                                Text("Search Car",
                                    style: TextStyle(
                                        color: StaticColors.whiteColor,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  width: 15,
                                ),
                                StaticAssets.rightArrow
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: InkWell(
                  onTap: () {
                    Get.to(()=>const CouponScreen());




                    // bottomSheetComingSoon();
                    // Get.to(() => const SearchForCarsScreen());
                  },
                  child: Container(
                    width: width,
                    height: height * .2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(carList[2]), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Parts that interest you",
                            style: TextStyle(
                                color: StaticColors.whiteColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Row(
                              children: [
                                Text("Get Parts",
                                    style: TextStyle(
                                        color: StaticColors.whiteColor,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  width: 15,
                                ),
                                StaticAssets.rightArrow
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
            ],
          ),
        )),
      );
    });
  }

  bottomSheetComingSoon() {
    Get.bottomSheet(Material(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(10),
                topLeft: Radius.circular(10)

            )),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Alert",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 25,
              ),
              Text("This services will be available so soon, keep in touch"),
              SizedBox(
                height: 25,
              ),
              customizedButton(
                  onTap: () {
                    Get.back();
                  },
                  textColor: Colors.white,
                  buttonColor: StaticColors.orangeColor,
                  buttonText: "Ok"),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
      color: Colors.transparent,
    ));
  }
}
