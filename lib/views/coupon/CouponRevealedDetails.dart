import 'dart:async';

import 'package:auction/ApiServices/api_services.dart';
import 'package:auction/models/GetCoupon/getRevealedCoupons.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/views/google_maps/GoogleMap.dart';
import 'package:auction/views/home/shopping_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CouponRevealedDetails extends StatefulWidget {
  final Result result;

  const CouponRevealedDetails(this.result, {Key? key}) : super(key: key);

  @override
  State<CouponRevealedDetails> createState() =>
      _CouponRevealedDetailsState(result);
}

class _CouponRevealedDetailsState extends State<CouponRevealedDetails> {

  Result result;
  _CouponRevealedDetailsState(this.result);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();



  }
  bool isBranchSelected=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(title: "Discount Coupons", action: [
        InkWell(
            onTap: () {
              Get.to(() => const ShoppingCartScreen());
            },
            child: Icon(
              Icons.add_shopping_cart_outlined,
              color: AppColors.blackColor,
            )),
        WhiteSpacer.horizontalSpace(20)
      ]),
      body: SizedBox(
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: Get.height * 0.1,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: NetworkImage("${result.picture}"),
                                fit: BoxFit.fill)),
                      )),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(),
                            Text(
                              result.couponTitle,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            const Text(
                              "10% discount off",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Container(),
                          ],
                        ),
                      )),
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: NetworkImage(
                                    "${ApiServices.BASE_IMAGE}${result.qrCodeImage}"),
                                fit: BoxFit.fill)),
                      )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const SizedBox(
                  height: 22,
                ),
                Container(
                  height: 65,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: InkWell(
                            onTap: (){
                              isBranchSelected=false;
                              setState(() {
                              });
                            },
                            child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/SvgAssets/Wallet.svg",
                                    height: 30,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Your Coupon",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: Get.height * 0.022,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: !isBranchSelected? 2: 0,
                                color: AppColors.blueColor,
                              ),
                            )
                        ],
                      ),
                          )),
                      Expanded(
                          child: InkWell(
                            onTap: (){
                              isBranchSelected=true;
                              setState(() {
                              });
                            },
                            child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // SvgPicture.asset("assets/SvgAssets/Wallet.svg",height: 30,color: Colors.black,),
                                  // SizedBox(width: 5,),
                                  Text(
                                    "other branches",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: Get.height * 0.022,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(height: isBranchSelected? 2:0,color: AppColors.blueColor,),
                            )
                        ],
                      ),
                          )),
                    ],
                  ),
                ),
                !isBranchSelected?
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Code",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            const Spacer(),
                            Text(
                              "${result.discountCode}",
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Expiry",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            const Spacer(),
                            Text(
                              "${result.expiry.toString().split(" ")[0]}",
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Price",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            const Spacer(),
                            Text(
                              "${double.parse(result.amount.toString()).toInt()} SAR",
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                      height: Get.height * 0.35,
                      child:GMaps(result.storeAddress,title: "",showItems: false,))
                ],)
                    :
                    Column(children: List.generate(100, (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [],)
                    )),)


              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }
}
