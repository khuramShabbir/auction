import 'package:auction/controllers_providers/Auction/auction_provider.dart';
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
          appBar: CustomAppBar.appBar(title: "Payment", action: [
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
              Spacer(),
              CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.check,
                  color: AppColors.whiteColor,
                ),
              ),
              WhiteSpacer.verticalSpace(15),
              Text(
                "Receipt uploaded",
                style: AppTextStyles.subTitleStyleBlack,
              ),
              WhiteSpacer.verticalSpace(15),
              Text(
                "The Auction Team will verify your transaction within 12-48 hours. If there is any questions please call us at: 0533546607",
                textAlign: TextAlign.center,
                style: AppTextStyles.normalGreyTextStyle,
              ),
              Spacer(),
              extendedButton(
                onTap: () {
                  Get.back();
                },
                buttonColor: AppColors.blueColor,
                buttonText: "Done",
                textColor: AppColors.whiteColor,
              ),
            ],
          )),
        );
      },
    );
  }
}
