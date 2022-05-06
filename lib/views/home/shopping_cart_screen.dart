import 'package:auction/controllers_providers/Coupon/coupon.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../models/Cart/get_cart.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {

  @override
  void initState() {
    super.initState();
    couponProvider.getCartByUser();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CouponProvider>(
      builder: (BuildContext context, data, Widget? child) {
        return Scaffold(
          appBar: CustomAppBar.appBar(title: "Cart", action: [
            Icon(
              Icons.add_shopping_cart,
              color: AppColors.blackColor,
            ),
            WhiteSpacer.horizontalSpace(20)
          ]),
          body: StaticKPadding.kPadding(
              child: data.cartLoaded
                  ?
              Column(
            children: [
              WhiteSpacer.verticalSpace(20),
              Expanded(
                child: ListView.builder(
                  itemCount:
                      data.getCart != null ? data.getCart!.result.length : 0,
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    Result result = data.getCart!.result[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        children: [
                          Container(
                            height: height * .1,
                            width: width * .25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(result.coupon.picturePath),
                                    fit: BoxFit.fill)),
                          ),
                          WhiteSpacer.horizontalSpace(5),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(result.coupon.couponTitle,
                                    style: AppTextStyles.subTitleStyleBlack),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Discount Coupon",
                                        style: AppTextStyles.normalGreyTextStyle),
                                    CircleAvatar(
                                      backgroundColor:
                                          AppColors.greyColor.withOpacity(.3),
                                      radius: 1.5,
                                    ),
                                    result.coupon.isPercent
                                        ? Text(result.coupon.couponDiscount + "%",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.greyColor))
                                        : Text(result.coupon.couponDiscount,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.greyColor)),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(children: [
                                  InkWell(
                                    onTap: () {
                                      int couponQuantity =
                                      data.increaseCouponValue(index);
                                      data.updateCartByUser(
                                          result.coupon.id.toString(), couponQuantity);
                                    },
                                    child: CircleAvatar(
                                        backgroundColor: AppColors.orangeColor,
                                        radius: 15,
                                        child: Icon(Icons.add,
                                            color: AppColors.whiteColor)),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      result.quantity.toString(),
                                      style: TextStyle(
                                          color: AppColors.orangeColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      int quantity = data.decreaseCouponValue(index);

                                      data.updateCartByUser(result.coupon.id.toString(), quantity);

                                      // data.addCartByUser(result.id.toString());
                                    },
                                    child: CircleAvatar(
                                        backgroundColor: AppColors.orangeColor,
                                        radius: 15,
                                        child: Icon(Icons.remove,
                                            color: AppColors.whiteColor)),
                                  ),
                                  SizedBox(width: 10,),
                                  Text("${(result.quantity * result.coupon.price).toInt()} SAR",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)

                                ],),

                              ],
                            ),
                          ),
                          InkWell(
                            onTap: ()async {
                              showProgressCircular();
                              await data.deleteCartItemByUser(result.coupon.id.toString());

                              stopProgressCircular();
                            },
                            child: Column(children: [
                              Icon(Icons.delete_outline,size: 35,color: Colors.black,),
                              Text("Delete",style: TextStyle(fontWeight: FontWeight.bold),)
                            ],),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                  color: AppColors.greyColor.withOpacity(.3), height: 1.5),
              WhiteSpacer.verticalSpace(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Coupon Price", style: AppTextStyles.subTitleStyleBlack),
                  Text("${data.couponTotalPrice} SAR",
                      style: TextStyle(
                          color: AppColors.greyColor,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              WhiteSpacer.verticalSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Discount",
                    style: AppTextStyles.subTitleStyleBlack,
                  ),
                  Text("${data.averageDiscount}%",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold)),
                ],
              ),
              WhiteSpacer.verticalSpace(20),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text("VAT", style: AppTextStyles.subTitleStyleBlack),
              //     Text(
              //       "29.96",
              //       style: TextStyle(
              //           color: AppColors.greyColor,
              //           fontWeight: FontWeight.bold),
              //     ),
              //   ],
              // ),
              WhiteSpacer.verticalSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Price", style: AppTextStyles.headingStyle),
                  Text(
                    "${data.couponTotalPrice} SAR",
                    style: AppTextStyles.headingStyle,
                  ),
                ],
              ),
              WhiteSpacer.verticalSpace(50),
              customizedButton(
                  radius: 15,
                  buttonText: "Proceed",
                  buttonWidth: .5,
                  buttonColor: AppColors.blueColor,
                  onTap: () async{
                    await data.purchaseAllCouponCodeFromCart();
                    await data.clearCart();
                    Get.back();


                  },
                  textColor: AppColors.whiteColor)
            ],
          )
                  :
                  const Center(child: CircularProgressIndicator(),)
          ),
        );
      },
    );
  }


}
