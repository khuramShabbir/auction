import 'package:auction/controllers_providers/Auction/auction_provider.dart';

import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:auction/views/home/bottom_nav_bar_screens/home_screen.dart';
import 'package:auction/views/home/create_campaign_Screens/payment_complete_screen.dart';
import 'package:auction/views/home/create_campaign_Screens/sold_car_detail_screen.dart';
import 'package:auction/views/home/create_campaign_Screens/viewReceipt.dart';
import 'package:auction/views/user_credentials_screens/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

import '../../../controllers_providers/Auth/auth_provider.dart';

class MyCarsScreen extends StatefulWidget {
  @override
  _MyCarsState createState() => _MyCarsState();
}

class _MyCarsState extends State<MyCarsScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {

      if(getUser()==null){

        return;
      }

      auctionProvider.getAuctionByUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuctionProvider>(
      builder: (BuildContext context, data, Widget? child) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: getAppBar("My Cars",isLeadingRequired: false),
          body: getUser()!=null ?
          StaticKPadding.kPadding(
              child: data.isAuctionByUserLoaded
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.auctionByUser!.result.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: InkWell(
                            onTap: () async {
                              if (!data.auctionByUser!.result[index].isAwarded)
                                return;
                              auctionProvider.isBankDetailLoaded = false;
                              auctionProvider.bankAccount = null;

                              bool isPaymentFound =await auctionProvider.getPaymentEvidence(
                                      data.auctionByUser!.result[index]);

                              if (isPaymentFound == false) {
                                Get.to(() => SoldCarDetailScreen(
                                    result: data.auctionByUser!.result[index]));
                              } else if (isPaymentFound == true &&
                                  !data.auctionByUser!.result[index]
                                      .isPaymentVerified) {
                                Get.to(() => const PaymentCompleteScreen());
                              }

                              else if (isPaymentFound == true &&
                                  data.auctionByUser!.result[index]
                                      .isPaymentVerified ) {
                                print(data.auctionByUser!.result[index].carInformationId );
                                print(getUser()!.result!.id );
                                var value = await auctionProvider.getShipmentBookedOrNot(data.auctionByUser!.result[index].carInformationId);
                                if(value){
                                  showToast(msg: "Shipment Already booked");
                                }
                                else{
                                Get.to(() => ViewReceiptScreen(data.auctionByUser!.result[index]));
                                }



                              }
                            },
                            child: Container(
                                width: width,
                                height: height * .27,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(data.auctionByUser!
                                                .result[index].carImages.isEmpty
                                            ? "https://image.shutterstock.com/image-vector/"
                                                "no-image-available-sign-internet-"
                                                "260nw-261719003.jpg"
                                            : data.auctionByUser!.result[index]
                                                .carImages[0].imagePath),
                                        fit: BoxFit.fill)),
                                child: StaticKPadding.kPadding(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      data.auctionByUser!.result[index].carName,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.whiteColor),
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Text(
                                          "Power",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: AppColors.whiteColor),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Container(
                                              height: 20,
                                              width: 1,
                                              color: AppColors.whiteColor),
                                        ),
                                        Text(
                                          "${data.auctionByUser!.result[index].maxPower}",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: AppColors.whiteColor),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "Riyadh",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: AppColors.whiteColor),
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
                                                  ? Colors.green
                                                      .withOpacity(0.3)
                                                  : Colors.red.withOpacity(.3)),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
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
                                                          BorderRadius.circular(
                                                              100)),
                                                ),
                                              ),
                                              Text(
                                                data.auctionByUser!
                                                        .result[index].isAwarded
                                                    ? "Awarded"
                                                    : "Awaiting",
                                                style: TextStyle(
                                                    color: AppColors.whiteColor
                                                    // color: data
                                                    //         .auctionByUser!
                                                    //         .result[index]
                                                    //         .isAwarded
                                                    //     ? Colors.green
                                                    //     : Colors.red
                                                    ),
                                              ),
                                              const SizedBox(width: 10)
                                            ],
                                          ),
                                        ),
                                        Text(
                                          "${data.auctionByUser!.result[index].biddingList.last.biddingAmount} / SAR",
                                          style: TextStyle(
                                              color: AppColors.whiteColor,
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
                        color: AppColors.orangeColor,
                      ),
                    ))
              :
          Container(color: Colors.white,),
        );
      },
    );
  }
}
