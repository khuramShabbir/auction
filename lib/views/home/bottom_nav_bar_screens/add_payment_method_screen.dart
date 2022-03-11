import 'package:auction/controllers_providers/payment_method_provider.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class AddPaymentMethodScreen extends StatefulWidget {
  const AddPaymentMethodScreen({Key? key}) : super(key: key);

  @override
  _AddPaymentMethodScreenState createState() => _AddPaymentMethodScreenState();
}

class _AddPaymentMethodScreenState extends State<AddPaymentMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            height: height * .95,
            decoration: BoxDecoration(
                color: StaticColors.whiteColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35))),
            child: Column(
              children: [
                WhiteSpacer.verticalSpace(5),
                Container(
                  width: 100,
                  height: 4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: StaticColors.greyColor.withOpacity(.3)),
                ),
                WhiteSpacer.verticalSpace(10),
                CustomAppBar.appBar(title: "Add Payment Method"),
                WhiteSpacer.verticalSpace(10),
                StaticKPadding.kPadding(
                    child: InkWell(
                  onTap: () {
                    addPayment();
                  },
                  child: Container(
                    height: height * .25,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: StaticColors.blackColor,
                          ),
                          Text(
                            "Add Card",
                            style: StaticTextStyles.normalBlackTextStyle,
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: StaticColors.greyColor.withOpacity(.1),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

addPayment() {
  Get.bottomSheet(
    StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return Consumer<PaymentProvider>(
          builder: (BuildContext context, value, Widget? child) {
            return Container(
              height: height * .95,
              decoration: BoxDecoration(
                  color: StaticColors.whiteColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35))),
              child: Column(
                children: [
                  WhiteSpacer.verticalSpace(5),
                  Container(
                    width: 100,
                    height: 4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: StaticColors.greyColor.withOpacity(.3)),
                  ),
                  WhiteSpacer.verticalSpace(15),
                  CustomAppBar.appBar(title: "Add Card"),
                  WhiteSpacer.verticalSpace(15),
                  StaticKPadding.kPadding(
                      child: Column(
                    children: [
                      Text(
                        "Start typing to add your "
                        "credit card details."
                        "Everything will update"
                        " according to your data.",
                        style: StaticTextStyles.normalGreyTextStyle,
                      ),
                      WhiteSpacer.verticalSpace(15),
                      Container(
                        decoration: BoxDecoration(
                            color: StaticColors.whiteColor,
                            boxShadow: [
                              BoxShadow(
                                  color: StaticColors.greyColor.withOpacity(.3),
                                  spreadRadius: 1,
                                  blurRadius: 10)
                            ],
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset('assets/PngAssets/masterCard.png'),
                              WhiteSpacer.verticalSpace(30),
                              Text('1244 1234 1345 3255',
                                  style: StaticTextStyles.subTitleStyleBlack),
                              WhiteSpacer.verticalSpace(30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Card Holder",
                                          style: StaticTextStyles
                                              .normalGreyTextStyle),
                                      Text(value.name,
                                          style: StaticTextStyles
                                              .normalBlackTextStyle),
                                    ],
                                  )),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Expiry",
                                          style: StaticTextStyles
                                              .normalGreyTextStyle),
                                      Text("02/25",
                                          style: StaticTextStyles
                                              .normalBlackTextStyle),
                                    ],
                                  )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      WhiteSpacer.verticalSpace(15),
                      StaticKPadding.kPadding(
                          child: Column(
                        children: [
                          customTextFormField(hintText: "Name",
                          onChange: (v){
                          value.name=v;


                          }

                          ),
                          customTextFormField(hintText: "Expiry Date"),
                          customTextFormField(hintText: 'Security Code'),
                        ],
                      ))
                    ],
                  )),
                  const Expanded(child: SizedBox()),
                  customizedButton(
                      buttonColor: StaticColors.orangeColor,
                      onTap: () {},
                      buttonText: "Next",
                      radius: 15,
                      textColor: StaticColors.whiteColor),
                  WhiteSpacer.verticalSpace(20)
                ],
              ),
            );
          },
        );
      },
    ),
    isScrollControlled: true,
    isDismissible: true,
  );
}
