import 'package:auction/controllers_providers/Coupon/coupon.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:auction/views/home/CouponScreens/coupon_comment_screen.dart';
import 'package:auction/views/home/create_campaign_Screens/car_specs.dart';
import 'package:auction/views/home/shopping_cart_screen.dart';
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
  bool usage = false;

  _CouponDetailScreenState(this.result);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CouponProvider>(builder: (context, data, child) {
      return Scaffold(
        appBar: CustomAppBar.appBar(title: "Coupon Detail", action: [
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
        body: StaticKPadding.kPadding(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * .25,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(result!.picturePath != null
                          ? "https://auction.api.deeps.info/${result!.picturePath}"
                          : imageUrl),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(10)),
            ),
            WhiteSpacer.verticalSpace(20),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              InkWell(
                  onTap: () {
                    usage = false;
                    setState(() {});
                  },
                  child: Text("Description",
                      style: AppTextStyles.subTitleStyleBlack)),
              InkWell(
                  onTap: () {
                    usage = true;
                    setState(() {});
                  },
                  child:
                      Text("Usage", style: AppTextStyles.subTitleStyleBlack)),
              InkWell(
                  onTap: () {
                    Get.to(() => CouponCommentScreen(result: result));
                  },
                  child: Text("Comments",
                      style: AppTextStyles.subTitleStyleBlack)),
            ]),
            WhiteSpacer.verticalSpace(20),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    child: Container(
                        height: 2,
                        color: usage
                            ? AppColors.greyColor.withOpacity(.1)
                            : AppColors.orangeColor)),
                Expanded(
                    child: Container(
                        height: 2,
                        color: usage
                            ? AppColors.orangeColor
                            : AppColors.greyColor.withOpacity(.1))),
                Expanded(
                    child: Container(
                        height: 2, color: AppColors.greyColor.withOpacity(.1))),
              ],
            ),
            WhiteSpacer.verticalSpace(20),
            Container(
                child: usage == false
                    ? Text(
                        result!.couponDescription ?? "",
                        style: AppTextStyles.normalGreyTextStyle,
                      )
                    : Text(
                        result!.usage ?? "",
                        style: AppTextStyles.normalGreyTextStyle,
                      ),
                constraints: BoxConstraints(minHeight: height * .15)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Coupon Code:", style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16)),
                Text("*******",
                    style: TextStyle(
                        color: AppColors.orangeColor,
                        fontWeight: FontWeight.bold))
              ],
            ),
            WhiteSpacer.verticalSpace(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RatingBar.builder(
                    unratedColor: AppColors.greyColor.withOpacity(.2),
                    itemSize: 25,
                    initialRating: double.parse(result!.rating == null
                        ? "0"
                        : result!.rating.toString()),
                    glowColor: AppColors.orangeColor,
                    onRatingUpdate: (double value) {},
                    itemBuilder: (BuildContext context, int index) {
                      return Icon(
                        Icons.star,
                        color: AppColors.orangeColor,
                      );
                    }),
              ],
            ),
            WhiteSpacer.verticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${result!.couponDiscount}% OFF",
                    style: TextStyle(
                        color: AppColors.orangeColor,
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
                    backgroundColor: AppColors.orangeColor,
                    child: Icon(
                      Icons.add,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    couponProvider.couponQuantity.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColors.orangeColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                InkWell(
                  onTap: () {
                    couponProvider.couponRemove();
                  },
                  child: CircleAvatar(
                    backgroundColor: AppColors.orangeColor,
                    child: Icon(
                      Icons.remove,
                      color: AppColors.whiteColor,
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
                    buttonColor: AppColors.blueColor,
                    onTap: () {
                      data.purchaseCouponCode(result!);
                    },
                    textColor: AppColors.whiteColor,
                    radius: 15,
                    buttonText: "Purchase Now",
                    buttonWidth: .5)
              ],
            ),
          ],
        )),
      );
    });
  }
}
