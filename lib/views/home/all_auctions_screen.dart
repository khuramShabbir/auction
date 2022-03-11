import 'package:auction/controllers_providers/auction_provider.dart';
import 'package:auction/controllers_providers/auth_provider.dart';
import 'package:auction/models/auction/GetAllAuctions.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
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
  var auction = Provider.of<AuctionProvider>(Get.context!, listen: false);

  @override
  void initState() {
    super.initState();
    auction.getAuction();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<AuctionProvider>(
        builder: (BuildContext context, data, Widget? child) {
          return Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: StaticColors.whiteColor,
              appBar: CustomAppBar.appBar(),
              body: data.isAuctionLoaded
                  ? StaticKPadding.kPadding(
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WhiteSpacer.verticalSpace(20),
                        Text(
                          "auction that interest you",
                          style: StaticTextStyles.headingStyle,
                        ),
                        WhiteSpacer.verticalSpace(10),
                        Expanded(
                          child: GridView.builder(
                              itemCount: data.allAuctions!.result.length,
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 3,
                                mainAxisSpacing: 10,
                                crossAxisCount: 2,
                              ),
                              itemBuilder: (context, index) {
                                Result result = data.allAuctions!.result[index];

                                return InkWell(
                                  onTap: () {
                                    Get.to(
                                        () => CarSpecification(result: result));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: StaticColors.whiteColor,
                                        boxShadow: [
                                          BoxShadow(
                                              color: StaticColors.greyColor
                                                  .withOpacity(.3),
                                              spreadRadius: 1,
                                              blurRadius: 10)
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image:
                                                        NetworkImage(imageUrl),
                                                    fit: BoxFit.fill),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topRight:
                                                            Radius.circular(10),
                                                        topLeft:
                                                            Radius.circular(
                                                                10))),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 4, right: 4, left: 4),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    result.carName,
                                                    style: TextStyle(
                                                        color: StaticColors
                                                            .blackColor),
                                                  ),
                                                  Text(
                                                    // "${DateTime.now().difference(result.auctionExpiry)}",
                                                    result.auctionExpiry
                                                        .difference(
                                                            DateTime.now())
                                                        .toString()
                                                        .split('.')[0],
                                                    style: TextStyle(
                                                        color: StaticColors
                                                            .blackColor),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "WINNING",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w100),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      data.getWallet(result);


                                                      //  data.getWallet(result);
                                                    },
                                                    child: Container(
                                                      constraints:
                                                          BoxConstraints(
                                                              minWidth:
                                                                  width * .18),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 8.0,
                                                                vertical: 8),
                                                        child: Center(
                                                          child: Text(
                                                            "BID ${double.parse(result.bidding.biddingAmount.toString()).toInt()}",
                                                            style: TextStyle(
                                                                color: StaticColors
                                                                    .whiteColor),
                                                          ),
                                                        ),
                                                      ),
                                                      decoration: BoxDecoration(
                                                          color: StaticColors
                                                              .orangeColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  CircleAvatar(
                                                    radius: 12,
                                                    backgroundImage:
                                                        NetworkImage(imageUrl),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Text(
                                                    result.user.name,
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w100),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        )
                      ],
                    ))
                  : const Center(
                      child: CircularProgressIndicator(),
                    ));
        },
      ),
    );
  }
}
