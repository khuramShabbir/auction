import 'package:auction/controllers_providers/auction_provider.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/views/home/create_campaign_Screens/bank_receipt_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../models/auction/auction_by_user.dart';
import '../../../utils/widgets.dart';

class SoldCarDetailScreen extends StatefulWidget {
  final Result? result;

  const SoldCarDetailScreen({Key? key, this.result}) : super(key: key);

  @override
  _SoldCarDetailScreenState createState() =>
      _SoldCarDetailScreenState(this.result);
}

class _SoldCarDetailScreenState extends State<SoldCarDetailScreen> {
  Result? result;

  _SoldCarDetailScreenState(this.result);

  @override
  void initState()  {
    super.initState();
     auctionProvider.getBankAccount();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuctionProvider>(
      builder: (BuildContext context, data, Widget? child) {
    double amount = result!.biddingList.last.biddingAmount;
    double mazadCommission = amount / 100 * 2;
    double vat = amount / 100 * 2;
    double total = amount + mazadCommission + vat;

    return data.isBankDetailLoaded?Scaffold(
        appBar: CustomAppBar.appBar(title: "Create a campaign"),
        body: Column(
          children: [
            stepper(2, "Target amount"),
            WhiteSpacer.verticalSpace(20),
            StaticKPadding.kPadding(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Car value",
                            style: StaticTextStyles.normalGreyTextStyle),
                        Text(amount.toString() + " SAR",
                            style: StaticTextStyles.normalBlackTextStyle)
                      ],
                    ),
                    WhiteSpacer.verticalSpace(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Mazad Commission",
                            style: StaticTextStyles.normalGreyTextStyle),
                        Text(mazadCommission.toString() + " SAR",
                            style: StaticTextStyles.normalBlackTextStyle)
                      ],
                    ),
                    WhiteSpacer.verticalSpace(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Down Payment",
                            style: TextStyle(color: Colors.red)),
                        Text("00.00" " SAR",
                            style: TextStyle(color: Colors.red))
                      ],
                    ),
                    WhiteSpacer.verticalSpace(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("vat",
                            style: StaticTextStyles.normalGreyTextStyle),
                        Text(vat.toString() + " SAR",
                            style: StaticTextStyles.normalBlackTextStyle)
                      ],
                    ),
                    WhiteSpacer.verticalSpace(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total",
                            style: StaticTextStyles.normalGreyTextStyle),
                        Text("${double.parse(total.toString()).toStringAsFixed(2)} SAR",
                            style: StaticTextStyles.subTitleStyleBlack)
                      ],
                    ),
                    WhiteSpacer.verticalSpace(20),
                    Text("Payment Info",
                        style: StaticTextStyles.subTitleStyleBlack),
                    WhiteSpacer.verticalSpace(20),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Image.asset(
                          "assets/PngAssets/bankLogo10.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      height: 75,
                      width: 150,
                      decoration: BoxDecoration(
                          color: StaticColors.whiteColor,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    WhiteSpacer.verticalSpace(20),
                    Row(
                      children: [
                        Text("NAME : ",
                            style: StaticTextStyles.normalBlackTextStyle),
                        Text(
                          data.bankAccount!.result[0].accountName,
                          style: StaticTextStyles.normalGreyTextStyle,
                        )
                      ],
                    ),
                    WhiteSpacer.verticalSpace(10),
                    Row(
                      children: [
                        Text("BANK : ",
                            style: StaticTextStyles.normalBlackTextStyle),
                        Text(
                          data.bankAccount!.result[0].bankName,
                          style: StaticTextStyles.normalGreyTextStyle,
                        )
                      ],
                    ),
                    WhiteSpacer.verticalSpace(10),
                    Row(
                      children: [
                        Text("Account Number : ",
                            style: StaticTextStyles.normalBlackTextStyle),
                        Text(
                         data.bankAccount!.result[0].accountNumber,
                          style: StaticTextStyles.normalGreyTextStyle,
                        )
                      ],
                    ),
                    WhiteSpacer.verticalSpace(10),
                    Row(
                      children: [
                        Text("IBAN : ",
                            style: StaticTextStyles.normalBlackTextStyle),
                        Text(
                          data.bankAccount!.result[0].iban,
                          style: StaticTextStyles.normalGreyTextStyle,
                        )
                      ],
                    ),
                  ],
                )),
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: extendedButton(
                  onTap: ()async {
                    Get.to(() => const BankReceiptScreen());
                  },
                  buttonText: "Next",
                  buttonColor: StaticColors.orangeColor.withOpacity(.3),
                  textColor: StaticColors.greyColor),
            ),
            WhiteSpacer.verticalSpace(20)
          ],
        )):Center(child: CircularProgressIndicator(color: StaticColors.orangeColor),);
      },
    );
  }
}
