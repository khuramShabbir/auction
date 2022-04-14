import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:auction/views/home/create_campaign_Screens/car_specs.dart';
import 'package:flutter/material.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(title: "Cart", action: [
        Icon(
          Icons.add_shopping_cart,
          color: AppColors.blackColor,
        ),
        WhiteSpacer.horizontalSpace(20)
      ]),
      body: StaticKPadding.kPadding(
          child: Column(
        children: [
          WhiteSpacer.verticalSpace(20),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: [
                      Container(
                        height: height * .1,
                        width: width * .21,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(imageUrl),
                                fit: BoxFit.fill)),
                      ),
                      WhiteSpacer.horizontalSpace(5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Title",
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
                              Text("10%",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.greyColor)),
                            ],
                          )
                        ],
                      ),
                      const Expanded(child: SizedBox()),
                      CircleAvatar(
                          backgroundColor: AppColors.orangeColor,
                          radius: 15,
                          child:
                              Icon(Icons.add, color: AppColors.whiteColor)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "1",
                          style: TextStyle(
                              color: AppColors.orangeColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      CircleAvatar(
                          backgroundColor: AppColors.orangeColor,
                          radius: 15,
                          child: Icon(Icons.remove,
                              color: AppColors.whiteColor))
                    ],
                  ),
                );
              },
            ),
          ),
          Container(color: AppColors.greyColor.withOpacity(.3), height: 1.5),
          WhiteSpacer.verticalSpace(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Coupon Price", style: AppTextStyles.subTitleStyleBlack),
              Text("29.96",
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
              const Text("-29.96 SAR",
                  style: TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold)),
            ],
          ),
          WhiteSpacer.verticalSpace(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("VAT", style: AppTextStyles.subTitleStyleBlack),
              Text(
                "29.96",
                style: TextStyle(
                    color: AppColors.greyColor, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          WhiteSpacer.verticalSpace(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total", style: AppTextStyles.headingStyle),
              Text(
                "29.96",
                style: AppTextStyles.headingStyle,
              ),
            ],
          ),
          WhiteSpacer.verticalSpace(50),
          customizedButton(
              radius: 15,
              buttonText: "Exit",
              buttonWidth: .5,
              buttonColor: AppColors.blueColor,
              onTap: () {},
              textColor: AppColors.whiteColor)
        ],
      )),
    );
  }
}
