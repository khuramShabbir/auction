import 'package:auction/controllers_providers/auction_provider.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'viewReceipt.dart';

class PaymentCompleteScreen extends StatefulWidget {
  const PaymentCompleteScreen({Key? key}) : super(key: key);

  @override
  _PaymentCompleteScreenState createState() => _PaymentCompleteScreenState();
}

class _PaymentCompleteScreenState extends State<PaymentCompleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuctionProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Scaffold(
          appBar: CustomAppBar.appBar(title: "Complete", action: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Center(
                child: Text(
                  "",
                  style: TextStyle(color: AppColors.blueColor),
                ),
              ),
            )
          ]),
          body: StaticKPadding.kPadding(
              child: Column(
            children: [
              WhiteSpacer.verticalSpace(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  WhiteSpacer.verticalSpace(15),
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.check,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  WhiteSpacer.verticalSpace(15),
                  Text(
                    "Create successful campaign",
                    style: AppTextStyles.subTitleStyleBlack,
                  ),
                ],
              ),
              WhiteSpacer.verticalSpace(20),
              Text(
                "Fundria will verify your campaign as soon as you publish"
                ". This can take 12-48 hours."
                " If there is any problem, we will notify you.",
                style: AppTextStyles.normalGreyTextStyle,
              ),
              WhiteSpacer.verticalSpace(20),
              // extendedButton(
              //   onTap: () {
              //     // Get.to(() => const ViewReceiptScreen());
              //   },
              //   buttonColor: StaticColors.blueColor,
              //   buttonText: "View Receipt",
              //   textColor: StaticColors.whiteColor,
              // ),
            ],
          )),
        );
      },
    );
  }
}
