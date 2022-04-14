import 'dart:async';
import 'package:auction/controllers_providers/auction_provider.dart';
import 'package:auction/models/auction/GetAllAuctions.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/views/home/car_specification.dart';
import 'package:auction/views/home/create_campaign_Screens/car_specs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class AllAuctionScreen extends StatefulWidget {
  const AllAuctionScreen({Key? key}) : super(key: key);

  @override
  _AllAuctionScreenState createState() => _AllAuctionScreenState();
}

class _AllAuctionScreenState extends State<AllAuctionScreen> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    auctionProvider.getAuction();
    Timer.periodic(Duration(seconds: 1), (timer) {
      this.timer = timer;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuctionProvider>(
      builder: (BuildContext context, data, Widget? child) {
        return Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: AppColors.whiteColor,
            appBar: CustomAppBar.appBar(),
            body: data.isAuctionLoaded
                ? StaticKPadding.kPadding(
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      WhiteSpacer.verticalSpace(20),
                      Text(
                        "Auction",
                        style: AppTextStyles.headingStyle,
                      ),
                      WhiteSpacer.verticalSpace(10),
                      Expanded(
                        child: GridView.builder(
                            itemCount: data.allAuctions!.result.length,
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: height * .3,
                              // crossAxisSpacing: 3,
                              // mainAxisSpacing: 2,
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (context, index) {
                              Result result = data.allAuctions!.result[index];
                              return InkWell(
                                onTap: () {
                                  Get.to(
                                      () => CarSpecification(result: result));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        color: AppColors.whiteColor,
                                        boxShadow: [
                                          BoxShadow(
                                              color: AppColors.greyColor
                                                  .withOpacity(.1),
                                              spreadRadius: 1,
                                              blurRadius: 2)
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      children: [
                                        Expanded(
                                            child: Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: result
                                                          .carImages.isEmpty
                                                      ? const NetworkImage(
                                                          "https://image.shutterstock.com/image-vector/"
                                                          "no-image-available-sign-internet-"
                                                          "260nw-261719003.jpg")
                                                      : NetworkImage(result
                                                          .carImages[0]
                                                          .imagePath),
                                                  fit: BoxFit.fill),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(10),
                                                      topLeft:
                                                          Radius.circular(10))),
                                        )),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 4, right: 4, left: 4),
                                          child: Column(
                                            children: [
                                              WhiteSpacer.verticalSpace(5),
                                              Text(result.carName),
                                              WhiteSpacer.verticalSpace(5),
                                              Text(
                                                result.auctionExpiry
                                                    .difference(DateTime.now())
                                                    .toString()
                                                    .split('.')[0],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors
                                                        .blackColor),
                                              ),
                                              WhiteSpacer.verticalSpace(5),
                                              InkWell(
                                                onTap: () {
                                                  data.getWallet(result);
                                                },
                                                child: Container(
                                                  constraints: BoxConstraints(
                                                      minWidth: width * .18),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 8.0,
                                                        vertical: 12),
                                                    child: Center(
                                                      child: Text(
                                                        "BID ${double.parse(result.bidding.biddingAmount.toString()).toInt()}",
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .whiteColor),
                                                      ),
                                                    ),
                                                  ),
                                                  decoration: BoxDecoration(
                                                      color: getUser()
                                                                  .result!
                                                                  .id !=
                                                              result.user.userId
                                                          ? AppColors
                                                              .orangeColor
                                                          : AppColors
                                                              .blueColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                ),
                                              ),
                                              WhiteSpacer.verticalSpace(5),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  result.user.name == null
                                                      ? Container()
                                                      : CircleAvatar(
                                                          radius: 12,
                                                          backgroundImage:
                                                              NetworkImage(
                                                                  imageUrl),
                                                        ),
                                                  const SizedBox(width: 10),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "WINNING",
                                                        style: TextStyle(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    .7),
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Text(
                                                        result.user.name == null
                                                            ? ""
                                                            : result.user.name!,
                                                        style: TextStyle(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    .7),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ))
                : Center(
                    child: CircularProgressIndicator(
                        color: AppColors.orangeColor,
                        backgroundColor: Colors.transparent),
                  ));
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }
}
