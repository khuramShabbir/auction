import 'dart:async';

import 'package:auction/controllers_providers/Auction/auction_provider.dart';
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
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      auctionProvider.getBankAccount(result!.user.userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuctionProvider>(
      builder: (BuildContext context, data, Widget? child) {
        return Scaffold(
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
                            style: AppTextStyles.normalGreyTextStyle),
                        Text(
                            result!.biddingList.last.biddingAmount.toString() +
                                " SAR",
                            style: AppTextStyles.normalBlackTextStyle)
                      ],
                    ),
                    WhiteSpacer.verticalSpace(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Mazad Commission",
                            style: AppTextStyles.normalGreyTextStyle),
                        Text("${double.parse(result!.muzadCommission.toString()).toInt()} SAR",
                            style: AppTextStyles.normalBlackTextStyle)
                      ],
                    ),
                    WhiteSpacer.verticalSpace(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text("Down Payment",
                            style: TextStyle(color: Colors.red)),
                        Text("${result!.downPayment}" " SAR",
                            style: TextStyle(color: Colors.red))
                      ],
                    ),
                    WhiteSpacer.verticalSpace(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("VAT",
                            style: AppTextStyles.normalGreyTextStyle),
                        Text("(${result!.vatPercent??0}%) ${(double.parse(result!.biddingList.last.biddingAmount.toString())*((double.parse(result!.vatPercent))/100.0))} SAR",
                            style: AppTextStyles.normalBlackTextStyle)
                      ],
                    ),
                    WhiteSpacer.verticalSpace(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total",
                            style: AppTextStyles.normalGreyTextStyle),
                        Text(
                            "${
                                (double.parse(result!.biddingList.last.biddingAmount.toString()) +
                                double.parse(result!.muzadCommission.toString()).toInt() +
                                (double.parse(result!.biddingList.last.biddingAmount.toString())*((double.parse(result!.vatPercent))/100.0)))
                                - double.parse(result!.downPayment.toString())



                            } SAR",
                            style: AppTextStyles.subTitleStyleBlack)
                      ],
                    ),
                    WhiteSpacer.verticalSpace(20),
                    Text("Payment Info",
                        style: AppTextStyles.subTitleStyleBlack),
                    data.isBankDetailLoaded
                        ? Column(
                            children: [
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
                                    color: AppColors.whiteColor,
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                              WhiteSpacer.verticalSpace(20),
                              Row(
                                children: [
                                  Text("NAME : ",
                                      style: AppTextStyles
                                          .normalBlackTextStyle),
                                  Text(
                                    data.bankAccount!.result[0].accountName,
                                    style: AppTextStyles.normalGreyTextStyle,
                                  )
                                ],
                              ),
                              WhiteSpacer.verticalSpace(10),
                              Row(
                                children: [
                                  Text("BANK : ",
                                      style: AppTextStyles
                                          .normalBlackTextStyle),
                                  Text(
                                    data.bankAccount!.result[0].bankName,
                                    style: AppTextStyles.normalGreyTextStyle,
                                  )
                                ],
                              ),
                              WhiteSpacer.verticalSpace(10),
                              Row(
                                children: [
                                  Text("Account Number : ",
                                      style: AppTextStyles
                                          .normalBlackTextStyle),
                                  Text(
                                    data.bankAccount!.result[0].accountNumber,
                                    style: AppTextStyles.normalGreyTextStyle,
                                  )
                                ],
                              ),
                              WhiteSpacer.verticalSpace(10),
                              Row(
                                children: [
                                  Text("IBAN : ",
                                      style: AppTextStyles
                                          .normalBlackTextStyle),
                                  Text(
                                    data.bankAccount!.result[0].iban,
                                    style: AppTextStyles.normalGreyTextStyle,
                                  )
                                ],
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              WhiteSpacer.verticalSpace(20),
                              Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Center(
                                  child: Text(
                                    "",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          )
                  ],
                )),
                const Expanded(child: SizedBox()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: extendedButton(
                      onTap: () async {
                        if (auctionProvider.isBankDetailLoaded) {
                          Get.to(() => BankReceiptScreen(result!));
                        }
                      },
                      buttonText: "Next",
                      buttonColor: AppColors.orangeColor.withOpacity(.3),
                      textColor: Colors.black),
                ),
                WhiteSpacer.verticalSpace(20)
              ],
            ));
      },
    );
  }
}
