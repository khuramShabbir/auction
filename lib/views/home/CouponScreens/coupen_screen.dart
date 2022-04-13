import 'package:auction/controllers_providers/Coupon/coupon.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/views/home/CouponScreens/coupon_detail_screen.dart';
import 'package:auction/views/home/create_campaign_Screens/car_specs.dart';
import 'package:auction/views/home/shopping_cart_screen.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:time_elapsed/time_elapsed.dart';

import '../../../models/GetCoupon/getCoupons.dart';

class CouponScreen extends StatefulWidget {
  const CouponScreen({Key? key}) : super(key: key);

  @override
  State<CouponScreen> createState() => _CouponScreenState();
}

class _CouponScreenState extends State<CouponScreen> {
  @override
  void initState() {
    super.initState();
    couponProvider.getCoupons();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CouponProvider>(
      builder: (BuildContext context, data, Widget? child) {
        return Scaffold(
          backgroundColor: StaticColors.whiteColor,
          appBar: CustomAppBar.appBar(title: "Discounted Coupon's",action: [
            InkWell(
                onTap: (){Get.to(()=>const ShoppingCartScreen());},
                child:  Icon(Icons.add_shopping_cart_outlined,color: StaticColors.blackColor,)),
          WhiteSpacer.horizontalSpace(20)
          ]),
          body: StaticKPadding.kPadding(
              child: data.couponLoaded
                  ? Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        WhiteSpacer.verticalSpace(20),
                        Flexible(
                          child: ListView.builder(
                            itemCount: data.getCoupon!.result.length,
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              Result result = data.getCoupon!.result[index];
                              final value = data.getCoupon!.result[index];
                              String timeString = value.expiry
                                  .toString();
                              DateTime timeDate = DateTime.parse(timeString);

                              String timeStamp = TimeElapsed.fromDateStr(timeString);

                              return InkWell(
                                onTap: () {
                                  Get.to(() =>  CouponDetailScreen(result: result));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: StaticColors.whiteColor,
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: height * .1,
                                          width: width * .21,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              image: DecorationImage(
                                                  image: NetworkImage(imageUrl),
                                                  fit: BoxFit.fill)),
                                        ),
                                        WhiteSpacer.horizontalSpace(10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(value.couponTitle ?? "",
                                                style: StaticTextStyles
                                                    .subTitleStyleBlack),
                                            WhiteSpacer.verticalSpace(5),
                                            Row(
                                              children: [
                                              value.isPercent ? Text(
                                                    "Discount  ${value.couponDiscount??""}%",
                                                    style: StaticTextStyles
                                                        .normalGreyTextStyle):Text("Discount price",style: StaticTextStyles.normalGreyTextStyle,),
                                                WhiteSpacer.horizontalSpace(5),
                                                CircleAvatar(
                                                    backgroundColor:
                                                        StaticColors.greyColor,
                                                    radius: 1.5),
                                                WhiteSpacer.horizontalSpace(5),
                                                Text(
                                                  timeStamp,
                                                  style: TextStyle(
                                                      color: StaticColors
                                                          .greyColor,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        const Expanded(child: SizedBox()),
                                        const Icon(Icons.add_shopping_cart_outlined),
                                        WhiteSpacer.horizontalSpace(5)
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    )
                  : Center(
                      child: CircularProgressIndicator(
                          color: StaticColors.orangeColor),
                    )),
        );
      },
    );
  }
}
