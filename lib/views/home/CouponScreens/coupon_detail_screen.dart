import 'package:auction/controllers_providers/Coupon/coupon.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:auction/views/home/CouponScreens/coupon_comment_screen.dart';
import 'package:auction/views/home/create_campaign_Screens/car_specs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../models/GetCoupon/getCoupons.dart';

class CouponDetailScreen extends StatefulWidget {
  final Result? result;

  CouponDetailScreen({Key? key, this.result}) : super(key: key);

  @override
  State<CouponDetailScreen> createState() =>
      _CouponDetailScreenState(this.result);
}

class _CouponDetailScreenState extends State<CouponDetailScreen> {
  Result? result;
  bool usage=false;

  _CouponDetailScreenState(this.result);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CouponProvider>(builder: (context, data, child) {
      return Scaffold(
        appBar: CustomAppBar.appBar(title: "Coupon Detail"),
        body: StaticKPadding.kPadding(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * .25,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(imageUrl), fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(10)),
            ),
            WhiteSpacer.verticalSpace(20),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              InkWell(
                  onTap: () {usage=false;setState(() {

                  });},
                  child: Text("Description",
                      style: StaticTextStyles.subTitleStyleBlack)),
              InkWell(
                  onTap: () {usage=true;setState(() {

                  });},
                  child: Text("Usage",
                      style: StaticTextStyles.subTitleStyleBlack)),
              InkWell(
                  onTap: () {Get.to(()=> CouponCommentScreen(result:result));},
                  child: Text("Comments",
                      style: StaticTextStyles.subTitleStyleBlack)),
            ]),
            WhiteSpacer.verticalSpace(20),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    child:
                        Container(height: 2, color:usage? StaticColors.greyColor.withOpacity(.1):StaticColors.orangeColor)),
                Expanded(
                    child: Container(
                        height: 2,
                        color:usage?StaticColors.orangeColor: StaticColors.greyColor.withOpacity(.1))),
                Expanded(
                    child: Container(
                        height: 2,
                        color: StaticColors.greyColor.withOpacity(.1))),
              ],
            ),
            WhiteSpacer.verticalSpace(20),
            Container(
              child:   usage==false? Text(
                result!.couponDescription ?? "",
                style: StaticTextStyles.normalGreyTextStyle,
              ):
              Text(result!.usage??"",style:StaticTextStyles.normalGreyTextStyle,),
              constraints: BoxConstraints(minHeight: height*.15)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("Coupon Code:",style: StaticTextStyles.normalGreyTextStyle),
              Text(result!.couponCode??"",style:TextStyle(color: StaticColors.orangeColor,fontWeight: FontWeight.bold))
            ],),
            WhiteSpacer.verticalSpace(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RatingBar.builder(
                    unratedColor: StaticColors.greyColor.withOpacity(.2),
                    itemSize: 25,
                    initialRating: 4,
                    glowColor: StaticColors.orangeColor,
                    onRatingUpdate: (double value) {},
                    itemBuilder: (BuildContext context, int index) {
                      return Icon(
                        Icons.star,
                        color: StaticColors.orangeColor,
                      );
                    }),
              ],
            ),
            WhiteSpacer.verticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("SAR 10",
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: StaticColors.greyColor,
                        fontWeight: FontWeight.bold)),
                WhiteSpacer.horizontalSpace(10),
                Text("SAR 5",
                    style: TextStyle(
                        color: StaticColors.orangeColor,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            WhiteSpacer.verticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    couponProvider.addValue();
                  },
                  child: CircleAvatar(
                    backgroundColor: StaticColors.orangeColor,
                    child: Icon(
                      Icons.add,
                      color: StaticColors.whiteColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    couponProvider.couponValue.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        color: StaticColors.orangeColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                InkWell(
                  onTap: () {
                    couponProvider.couponRemove();
                  },
                  child: CircleAvatar(
                    backgroundColor: StaticColors.orangeColor,
                    child: Icon(
                      Icons.remove,
                      color: StaticColors.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customizedButton(
                    buttonColor: StaticColors.blueColor,
                    onTap: () {},
                    textColor: StaticColors.whiteColor,
                    radius: 15,
                    buttonText: "Order Now",
                    buttonWidth: .5)
              ],
            ),
          ],
        )),
      );
    });
  }
}
