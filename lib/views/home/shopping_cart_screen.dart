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
          color: StaticColors.blackColor,
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
                              style: StaticTextStyles.subTitleStyleBlack),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Discount Coupon",
                                  style: StaticTextStyles.normalGreyTextStyle),
                              CircleAvatar(
                                backgroundColor:
                                    StaticColors.greyColor.withOpacity(.3),
                                radius: 1.5,
                              ),
                              Text("10%",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: StaticColors.greyColor)),
                            ],
                          )
                        ],
                      ),
                      const Expanded(child: SizedBox()),
                      CircleAvatar(backgroundColor: StaticColors.orangeColor,radius: 15,child: Icon(Icons.add,color: StaticColors.whiteColor)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("1",style: TextStyle(color: StaticColors.orangeColor,fontWeight: FontWeight.bold),),
                      ),
                      CircleAvatar(backgroundColor: StaticColors.orangeColor,radius: 15,child: Icon(Icons.remove,color: StaticColors.whiteColor))





                    ],
                  ),
                );
              },
            ),
          ),

          Container(color: StaticColors.greyColor.withOpacity(.3),height: 1.5),
          WhiteSpacer.verticalSpace(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text("Coupon Price",style: StaticTextStyles.subTitleStyleBlack),
            Text("29.96",style: TextStyle(color: StaticColors.greyColor,fontWeight: FontWeight.bold)),
          ],),
          WhiteSpacer.verticalSpace(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text("Discount",style: StaticTextStyles.subTitleStyleBlack,),
            const Text("-29.96 SAR",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold)),
          ],),
          WhiteSpacer.verticalSpace(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text("VAT",style: StaticTextStyles.subTitleStyleBlack),
            Text("29.96",style: TextStyle(color: StaticColors.greyColor,fontWeight: FontWeight.bold),),
          ],),
          WhiteSpacer.verticalSpace(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total",style: StaticTextStyles.headingStyle),
              Text("29.96",style: StaticTextStyles.headingStyle,),
            ],),
          WhiteSpacer.verticalSpace(50),

          customizedButton(
            radius: 15,
            buttonText: "Exit",
              buttonWidth: .5,
              buttonColor: StaticColors.blueColor,
              onTap: (){}, textColor: StaticColors.whiteColor)



















        ],
      )),
    );
  }
}
