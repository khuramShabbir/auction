import 'package:auction/controllers_providers/Coupon/coupon.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/views/home/create_campaign_Screens/car_specs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:time_elapsed/time_elapsed.dart';

class CouponRevealScreen extends StatefulWidget {
  const CouponRevealScreen({Key? key}) : super(key: key);

  @override
  State<CouponRevealScreen> createState() => _CouponRevealScreenState();
}

class _CouponRevealScreenState extends State<CouponRevealScreen> {
  @override
  void initState() {
    // TODO: implement initState

    couponProvider.getRevealedCoupons();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text("Coupons", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        width: Get.width,
        child: Consumer<CouponProvider>(builder: (builder, data, child) {
          return data.getRevealedCoupon != null
              ? Column(
                  children: List.generate(
                      data.getRevealedCoupon!.result!.length,
                      (index) {
                        var result = data.getRevealedCoupon!.result![index];
                        String timeStamp = "";

                        timeStamp = TimeElapsed.fromDateStr(result.expiry.toString());
                        return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 25),
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: height * .1,
                                    width: width * .21,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                            image: NetworkImage(result.picture != null
                                                    ? "${result.picture}"
                                                    : imageUrl),
                                            fit: BoxFit.fill)),
                                  ),
                                  WhiteSpacer.horizontalSpace(10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [

                                            Expanded(
                                              child: Text(result.discountCode ?? "",
                                                  style:TextStyle(color: AppColors.orangeColor,fontWeight: FontWeight.bold,fontSize: 18)),
                                            ),

                                            Text(result.couponTitle ?? "",
                                                style:
                                                    AppTextStyles.subTitleStyleBlack),
                                          ],
                                        ),
                                        WhiteSpacer.verticalSpace(5),
                                        Row(
                                          children: [
                                            Text(
                                                    "Bought ${result.quantity}",
                                                    style: AppTextStyles
                                                        .normalGreyTextStyle,
                                                  ),
                                            WhiteSpacer.horizontalSpace(5),
                                            CircleAvatar(
                                                backgroundColor:
                                                    AppColors.greyColor,
                                                radius: 1.5),
                                            WhiteSpacer.horizontalSpace(5),
                                            Text(
                                              "$timeStamp",
                                              style: TextStyle(
                                                  color: AppColors.greyColor,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  WhiteSpacer.horizontalSpace(5)
                                ],
                              ),
                            ),
                          );
                      }),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        }),
      ),
    );
  }
}
