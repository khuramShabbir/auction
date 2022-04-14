import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:auction/views/home/create_campaign_Screens/car_specs.dart';
import 'package:flutter/material.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(title: "Check Out", action: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Icon(
            Icons.menu,
            color: AppColors.blackColor,
          ),
        )
      ]),
      body: StaticKPadding.kPadding(
          child: Column(
        children: [
          WhiteSpacer.verticalSpace(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                  backgroundColor: index == 0
                      ? AppColors.blueColor
                      : AppColors.greyColor,
                  child: index == 0
                      ? Icon(Icons.check, color: AppColors.whiteColor)
                      : null),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: 50,
                    height: 1.5,
                    color: AppColors.greyColor.withOpacity(.5)),
              ),
              CircleAvatar(
                  backgroundColor: index == 2
                      ? AppColors.blueColor
                      : AppColors.greyColor,
                  child: index == 1
                      ? Icon(Icons.check, color: AppColors.whiteColor)
                      : null),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: 50,
                    height: 1.5,
                    color: AppColors.greyColor.withOpacity(.5)),
              ),
              CircleAvatar(
                  backgroundColor: index == 2
                      ? AppColors.blueColor
                      : AppColors.greyColor,
                  child: index == 2
                      ? Icon(Icons.check, color: AppColors.whiteColor)
                      : null),
            ],
          ),
          WhiteSpacer.verticalSpace(20),
          Container(
            height: height * .2,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(imageUrl), fit: BoxFit.fill),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Center(
                    child: Text(
                      "Top",
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                  ),
                  height: 35,
                  width: 60,
                  decoration: BoxDecoration(
                      color: AppColors.blueColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15))),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                      color: AppColors.greyColor.withOpacity(.2),
                      blurRadius: 10,
                      spreadRadius: 1)
                ],
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WhiteSpacer.verticalSpace(5),
                  Row(
                    children: [
                      const Text("Check Available",
                          style: TextStyle(color: Colors.green)),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Image.asset('assets/PngAssets/Shield Done.png'),
                      ),
                      const Expanded(child: SizedBox()),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                              WhiteSpacer.horizontalSpace(5),
                              const Text(
                                "Waiting for Approval",
                                style: TextStyle(color: Colors.green),
                              )
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.green.withOpacity(.2),
                            borderRadius: BorderRadius.circular(5)),
                      )
                    ],
                  ),
                  WhiteSpacer.verticalSpace(5),
                  Text("Riyadh - Full Time",
                      style: AppTextStyles.normalBlackTextStyle),
                  WhiteSpacer.verticalSpace(5),
                ],
              ),
            ),
          ),
          const Expanded(
              child: SizedBox()),
          extendedButton(
              onTap: () {},
              buttonText: "Next",
              buttonColor: AppColors.blueColor,
              textColor: AppColors.whiteColor)
        ],
      )),
    );
  }
}
