import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:flutter/material.dart';

class ViewReceiptScreen extends StatefulWidget {
  const ViewReceiptScreen({Key? key}) : super(key: key);

  @override
  _ViewReceiptScreenState createState() => _ViewReceiptScreenState();
}

class _ViewReceiptScreenState extends State<ViewReceiptScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: StaticColors.whiteColor,
      appBar: CustomAppBar.appBar(title: "Create Campaign"),
      body: StaticKPadding.kPadding(
          child: Column(
        children: [
          WhiteSpacer.verticalSpace(20),
          Container(
            width: width,
            decoration:
            BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(.1),
                      blurRadius: 20,
                      spreadRadius: 10),
                ],
                color: StaticColors.whiteColor,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WhiteSpacer.verticalSpace(10),
                  Text(
                    "Shipping Campaign",
                    style: StaticTextStyles.normalBlackTextStyle,
                  ),
                  WhiteSpacer.verticalSpace(10),
                  SizedBox(
                    height: height * .18,
                    child: ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(.1),
                                      blurRadius: 20,
                                      spreadRadius: 1),
                                ],
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: SizedBox(
                                      width: width * .20,
                                      height: width * .20,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                            'assets/PngAssets/bankLogo$index.png'),
                                      ),
                                    ),
                                  ),
                                  Text("2-3 days",
                                      style:
                                          StaticTextStyles.normalGreyTextStyle),
                                ],
                              ),
                            ),
                            WhiteSpacer.horizontalSpace(10)
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          WhiteSpacer.verticalSpace(20),
          Container(
            width: width,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(.1),
                      blurRadius: 20,
                      spreadRadius: 10),
                ],
                color: StaticColors.whiteColor,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WhiteSpacer.verticalSpace(10),
                  Text(
                    "Vehicle insurance",
                    style: StaticTextStyles.normalBlackTextStyle,
                  ),
                  WhiteSpacer.verticalSpace(10),
                  SizedBox(
                    height: height * .18,
                    child: ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(.1),
                                      blurRadius: 20,
                                      spreadRadius: 1),
                                ],
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: SizedBox(
                                      width: width * .20,
                                      height: width * .20,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                            'assets/PngAssets/bankLogo$index.png'),
                                      ),
                                    ),
                                  ),
                                  Text("2-3 days",
                                      style:
                                          StaticTextStyles.normalGreyTextStyle),
                                ],
                              ),
                            ),
                            WhiteSpacer.horizontalSpace(10)
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          WhiteSpacer.verticalSpace(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Delivery Cost",
                style: StaticTextStyles.normalGreyTextStyle,
              ),
              Text(
                "\$ 29.9",
                style: StaticTextStyles.subTitleStyleBlack,
              ),
            ],
          ),
          WhiteSpacer.verticalSpace(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Vat",
                style: StaticTextStyles.normalGreyTextStyle,
              ),
              Text(
                "\$ 29.9",
                style: StaticTextStyles.subTitleStyleBlack,
              ),
            ],
          ),
          WhiteSpacer.verticalSpace(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: StaticTextStyles.normalGreyTextStyle,
              ),
              Text(
                "\$ 32.95",
                style: StaticTextStyles.headingStyle,
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          extendedButton(
              onTap: () {},
              buttonText: "Next",
              buttonColor: StaticColors.orangeColor.withOpacity(.3),
              textColor: StaticColors.greyColor)
        ],
      )),
    ));
  }
}
