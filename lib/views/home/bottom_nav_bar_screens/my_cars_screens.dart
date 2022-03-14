import 'package:auction/controllers_providers/auction_provider.dart';
import 'package:auction/controllers_providers/auth_provider.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:auction/views/home/create_campaign_Screens/sold_car_detail_screen.dart';
import 'package:auction/views/home/create_campaign_Screens/payment_complete_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class MyCarsScreen extends StatefulWidget {
  const MyCarsScreen({Key? key}) : super(key: key);

  @override
  _MyCarsState createState() => _MyCarsState();
}

class _MyCarsState extends State<MyCarsScreen> {
  @override
  void initState() {
    super.initState();
    auctionProvider.getAuctionByUser();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<AuctionProvider>(
        builder: (BuildContext context, data, Widget? child) {
          return Scaffold(
            backgroundColor: StaticColors.whiteColor,
            appBar: CustomAppBar.appBar(),
            body: StaticKPadding.kPadding(
                child: data.isAuctionByUserLoaded
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: data.auctionByUser!.result.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: InkWell(
                              onTap: () async {


                              await  data.getPaymentEvidence();



                              },
                              child: Container(
                                  width: width,
                                  height: height * .27,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: NetworkImage(data
                                              .auctionByUser!
                                              .result[index]
                                              .carImages[0]
                                              .imagePath),
                                          fit: BoxFit.fill)),
                                  child: StaticKPadding.kPadding(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        data.auctionByUser!.result[index]
                                            .carName,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: StaticColors.blackColor),
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Text(
                                            "Weekdays",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w200,
                                                color: StaticColors.blackColor),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Container(
                                                height: 20,
                                                width: 1,
                                                color: StaticColors.blackColor),
                                          ),
                                          Text(
                                            "7:00",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w200,
                                                color: StaticColors.blackColor),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        "Riyadh",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w200,
                                            color: StaticColors.blackColor),
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.green
                                                    .withOpacity(.3)),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Container(
                                                    width: 10,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                        color: Colors.green,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100)),
                                                  ),
                                                ),
                                                Text(
                                                  data
                                                          .auctionByUser!
                                                          .result[index]
                                                          .isCarSold
                                                      ? "Pending"
                                                      : "Accepted",
                                                  style: const TextStyle(
                                                      color: Colors.green),
                                                ),
                                                const SizedBox(width: 10)
                                              ],
                                            ),
                                          ),
                                          Text(
                                            "${data.auctionByUser!.result[index].biddingList.last.biddingAmount} / SAR",
                                            style: TextStyle(
                                                color: StaticColors.blackColor,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      )
                                    ],
                                  ))),
                            ),
                          );
                        },
                      )
                    : Center(
                        child: CircularProgressIndicator(
                          color: StaticColors.orangeColor,
                        ),
                      )),
          );
        },
      ),
    );
  }
}
