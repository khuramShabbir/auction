import 'package:auction/controllers_providers/auction_provider.dart';

import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:auction/views/home/create_campaign_Screens/payment_complete_screen.dart';
import 'package:auction/views/home/create_campaign_Screens/sold_car_detail_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

import '../../../controllers_providers/auth_provider.dart';

class MyCarsScreen extends StatefulWidget {


  @override
  _MyCarsState createState() => _MyCarsState();
}

class _MyCarsState extends State<MyCarsScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero,(){
      auctionProvider.getAuctionByUser();

    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuctionProvider>(
      builder: (BuildContext context, data, Widget? child) {
        return Scaffold(
          backgroundColor: StaticColors.whiteColor,
          appBar:AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: Text(""),title: Text("My Cars",style: TextStyle(color: Colors.black),),centerTitle: true,),
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
                              if(!data.auctionByUser!.result[index].isAwarded) return;
                              auctionProvider.isBankDetailLoaded = false;
                              auctionProvider.bankAccount = null;

                              bool isPaymentFound = await auctionProvider.getPaymentEvidence(data.auctionByUser!.result[index]);

                              if (isPaymentFound == false) {

                                Get.to(() => SoldCarDetailScreen(result:data.auctionByUser!.result[index]));

                              }

                              else if (isPaymentFound == true) {

                                Get.to(() => PaymentCompleteScreen());

                              }

                            },
                            child: Container(
                                width: width,
                                height: height * .27,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image:

                                    DecorationImage(
                                        image: NetworkImage(
                                    data.auctionByUser!.result[index].carImages.isEmpty?
                        "https://image.shutterstock.com/image-vector/"
                        "no-image-available-sign-internet-"
                        "260nw-261719003.jpg":data.auctionByUser!.result[index].carImages[0].imagePath),
                                        fit: BoxFit.fill)
                                ),
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
                                          "Power",
                                          style: TextStyle(
                                              fontSize: 15,
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
                                          "${data.auctionByUser!.result[index].maxPower}",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: StaticColors.blackColor),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "Riyadh",
                                      style: TextStyle(
                                          fontSize: 15,
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
                                              color: data.auctionByUser!
                                                      .result[index].isAwarded
                                                  ? Colors.green.withOpacity(0.3)
                                                  : Colors.red
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
                                                      color: data
                                                              .auctionByUser!
                                                              .result[index]
                                                              .isAwarded
                                                          ? Colors.green
                                                          : Colors.red,
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(100)),
                                                ),
                                              ),
                                              Text(
                                                data
                                                        .auctionByUser!
                                                        .result[index]
                                                        .isAwarded
                                                    ? "Awarded"
                                                    : "Awaiting",
                                                style: TextStyle(
                                                    color: data
                                                            .auctionByUser!
                                                            .result[index]
                                                            .isAwarded
                                                        ? Colors.green
                                                        : Colors.red),
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
    );
  }
}
