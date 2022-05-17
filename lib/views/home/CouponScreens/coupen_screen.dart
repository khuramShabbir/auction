import 'package:auction/controllers_providers/Coupon/coupon.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:auction/views/home/CouponScreens/coupon_detail_screen.dart';
import 'package:auction/views/home/create_campaign_Screens/car_specs.dart';
import 'package:auction/views/home/shopping_cart_screen.dart';
import 'package:auction/views/user_credentials_screens/login_screen.dart';
import 'package:flutter/foundation.dart';
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
          backgroundColor: AppColors.whiteColor,
          // appBar: CustomAppBar.appBar(title: "Discount Coupons", action: [
          //   InkWell(
          //       onTap: () {
          //         if(getUser()==null){
          //
          //           Get.to(()=>const LoginScreen());
          //           return;
          //         }
          //         Get.to(() => const ShoppingCartScreen());
          //       },
          //       child: Icon(
          //         Icons.add_shopping_cart_outlined,
          //         color: AppColors.blackColor,
          //       )),
          //   WhiteSpacer.horizontalSpace(20)
          // ]),
          body: StaticKPadding.kPadding(
              child: data.couponLoaded
                  ?  Center(
                    child: Container(
                width: Get.width*0.6,
                child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: height * .45,
                      // crossAxisSpacing: 3,
                      // mainAxisSpacing: 2,
                      crossAxisCount: kIsWeb  && context.height>600 && context.width>600 ? 4 : 2,
                ),
                itemCount: data.getCoupon!.result.length,
                itemBuilder: (BuildContext context, int index) {
                      Result result = data.getCoupon!.result[index];
                      final value = data.getCoupon!.result[index];
                      String timeString = value.expiry.toString();
                      String timeStamp = "";
                      if (!timeString.contains("null")) {
                        timeStamp = TimeElapsed.fromDateStr(timeString);
                      }

                      return InkWell(
                        onTap: () {
                          Get.to(() => CouponDetailScreen(result: result));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 25
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15),
                              color: AppColors.greyColor.withOpacity(0.05),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: height * .3,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: NetworkImage(result
                                              .picturePath !=
                                              null
                                              ? "${result.picturePath}"
                                              : imageUrl),
                                          fit: BoxFit.fill)),
                                ),
                                WhiteSpacer.horizontalSpace(10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(value.couponTitle ?? "",
                                                style: AppTextStyles
                                                    .subTitleStyleBlack),
                                            WhiteSpacer.verticalSpace(5),
                                            Row(
                                              children: [
                                                value.isPercent
                                                    ? Text(
                                                    "Discount  ${value.couponDiscount ?? ""}%",
                                                    style: AppTextStyles
                                                        .normalGreyTextStyle)
                                                    : Text(
                                                  "Discount price",
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
                                                  timeStamp,
                                                  style: TextStyle(
                                                      color:
                                                      AppColors.greyColor,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                              ],
                                            ),

                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {

                                          if(getUser()==null){

                                            return Get.to(()=>const LoginScreen());
                                          }

                                          showProgressCircular();
                                          await couponProvider.addCartByUser(
                                              result.id.toString());
                                          stopProgressCircular();
                                          Get.to(() =>
                                          const ShoppingCartScreen());
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Icon(Icons
                                              .add_shopping_cart_outlined),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),



                              ],
                            ),
                          ),
                        ),
                      );
                },
              ),
                    ),
                  )
                  : Center(
                      child: CircularProgressIndicator(
                          color: AppColors.orangeColor),
                    )),
        );
      },
    );
  }
}
