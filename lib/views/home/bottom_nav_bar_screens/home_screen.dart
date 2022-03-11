import 'package:auction/controllers_providers/auth_provider.dart';
import 'package:auction/controllers_providers/dashboard_provider.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/views/home/all_auctions_screen.dart';
import 'package:auction/views/home/bottom_nav_bar_screens/search_for_cars_screen.dart';
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
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSILG8H9S3IzanrQQLzWKdDsX1Kp8BgqBb6gw&usqp=CAU",
    "https://images.pexels.com/photos/241316/pexels-photo-241316.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuqYmHoSC_OG1v_96S5KyK055IVGAlyj3uiw&usqp=CAU"
  ];

  @override
  Widget build(BuildContext context) {



    return Consumer<DashBoardProvider>(
        builder: (BuildContext context, data, child) {
      return Scaffold(
        appBar:
            AppBar(elevation: 0, backgroundColor: Colors.transparent, actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20),
              child: StaticAssets.notificationIcon)
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
              Text("auction", style: StaticTextStyles.headingStyle),
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
                          image: NetworkImage(carList[0]), fit: BoxFit.cover),
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
                    Get.to(() => const SearchForCarsScreen());
                  },
                  child: Container(
                    width: width,
                    height: height * .2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(carList[0]), fit: BoxFit.cover),
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
                    Get.to(() => const SearchForCarsScreen());
                  },
                  child: Container(
                    width: width,
                    height: height * .2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(carList[0]), fit: BoxFit.cover),
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
            ],
          ),
        )),
      );
    });
  }
}
