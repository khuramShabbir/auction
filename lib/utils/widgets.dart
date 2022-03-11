import 'package:auction/api_services.dart';
import 'package:auction/controllers_providers/auction_provider.dart';
import 'package:auction/controllers_providers/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'const.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomWidget {
  static addWalletBottomSheet() {
    Get.bottomSheet(Container(
      decoration: BoxDecoration(
          color: StaticColors.whiteColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: StaticKPadding.kPadding(
          child: Column(
        children: [
          WhiteSpacer.verticalSpace(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.arrow_back, color: StaticColors.blackColor),
              /*Align(
                      alignment: Alignment.topCenter,
                      child: Container(width: 50,height: 1.5,color: StaticColors.greyColor))*/
            ],
          ),
          WhiteSpacer.verticalSpace(10),
          Row(
            children: [
              Container(
                height: 30,
                width: 30,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.asset('assets/PngAssets/masterCard.png'),
                ),
                decoration: BoxDecoration(
                  color: StaticColors.blueColor.withOpacity(.01),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              WhiteSpacer.horizontalSpace(10),
              Text(
                "Credit Card",
                style: StaticTextStyles.subTitleStyleBlack,
              ),
              const Expanded(child: SizedBox()),
              Container(
                child: Center(
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        color: StaticColors.blackColor,
                        borderRadius: BorderRadius.circular(100)),
                  ),
                ),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border:
                        Border.all(width: 1, color: StaticColors.blackColor)),
              )
            ],
          ),
          customTextFormField(
              hintText: "Name On Card",
              onChange: (v) {
                auctionProvider.nameOnCard = v;
              }),
          customTextFormField(
              hintText: "Card Number",
              onChange: (v) {
                auctionProvider.cardNumber = v;
              }),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  child: customTextFormField(
                      hintText: "Exp Month",
                      onChange: (v) {
                        auctionProvider.expMonth = v;
                      })),
              const SizedBox(width: 20),
              Expanded(
                  child: customTextFormField(
                      hintText: "Exp Date",
                      onChange: (v) {
                        auctionProvider.expDate = v;
                      })),
            ],
          ),
          customTextFormField(hintText: "Readex Pro", onChange: (v) {}),
          extendedButton(
              onTap: () {
                Get.back();
                walletChargeBottomSheet();
              },
              buttonText: "Save",
              buttonColor: StaticColors.blueColor,
              textColor: StaticColors.whiteColor)
        ],
      )),
    ));
  }

  static walletChargeBottomSheet() {
    Get.bottomSheet(Container(
      decoration: BoxDecoration(
          color: StaticColors.whiteColor,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15), topLeft: Radius.circular(15))),
      child: StaticKPadding.kPadding(
          child: Column(
        children: [
          WhiteSpacer.verticalSpace(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.arrow_back, color: StaticColors.blackColor),
              /*Align(
                      alignment: Alignment.topCenter,
                      child: Container(width: 50,height: 1.5,color: StaticColors.greyColor))*/
            ],
          ),
          WhiteSpacer.verticalSpace(20),
          Row(
            children: [
              Container(
                height: 30,
                width: 30,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.asset('assets/PngAssets/masterCard.png'),
                ),
                decoration: BoxDecoration(
                  color: StaticColors.blueColor.withOpacity(.01),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              WhiteSpacer.horizontalSpace(10),
              Text(
                "Credit Card",
                style: StaticTextStyles.subTitleStyleBlack,
              ),
              const Expanded(child: SizedBox()),
              Container(
                child: Center(
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        color: StaticColors.blackColor,
                        borderRadius: BorderRadius.circular(100)),
                  ),
                ),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border:
                        Border.all(width: 1, color: StaticColors.blackColor)),
              )
            ],
          ),
          WhiteSpacer.verticalSpace(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Account", style: StaticTextStyles.normalGreyTextStyle),
              Text(".... .... ..... ",
                  style: StaticTextStyles.normalBlackTextStyle),
              Text(auctionProvider.cardNumber,
                  style: StaticTextStyles.normalBlackTextStyle),
            ],
          ),
          WhiteSpacer.verticalSpace(20),
          Row(
            children: [
              Text("Sub total", style: StaticTextStyles.normalBlackTextStyle),
              const Expanded(child: SizedBox()),
              Text("\$ 29.96", style: StaticTextStyles.subTitleStyleBlack),
            ],
          ),
          WhiteSpacer.verticalSpace(10),
          Row(
            children: [
              Text("vat", style: StaticTextStyles.normalBlackTextStyle),
              const Expanded(child: SizedBox()),
              Text("\$ 2.99", style: StaticTextStyles.subTitleStyleBlack),
            ],
          ),
          WhiteSpacer.verticalSpace(10),
          Row(
            children: [
              Text("Total", style: StaticTextStyles.normalBlackTextStyle),
              const Expanded(child: SizedBox()),
              Text("\$ 32.95", style: StaticTextStyles.headingStyle),
            ],
          ),
          const Expanded(child: SizedBox()),
          extendedButton(
              onTap: () {
                Get.back();
                walletStatus();
              },
              buttonText: "Charge Your Wallet",
              buttonColor: StaticColors.blueColor,
              textColor: StaticColors.whiteColor)
        ],
      )),
    ));
  }

  static walletStatus() {
    Get.bottomSheet(Container(
      decoration: BoxDecoration(
          color: StaticColors.whiteColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: StaticKPadding.kPadding(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.green,
            radius: 40,
            child: Icon(Icons.check, color: StaticColors.whiteColor, size: 25),
          ),
          Text("Your wallet charge successfully",
              style: StaticTextStyles.headingStyle),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  "You are able"
                  " to make bidding now! ",
                  style: StaticTextStyles.normalGreyTextStyle),
              Text("Good luck", style: StaticTextStyles.normalGreyTextStyle),
            ],
          ),
          extendedButton(
              onTap: () {
                Get.back();
              },
              buttonText: "Done",
              buttonColor: StaticColors.blueColor,
              textColor: StaticColors.whiteColor)
        ],
      )),
    ));
  }

  static biddingAmountBottomSheet(int carId) {
    TextEditingController controller = TextEditingController();
    Get.bottomSheet(
        SingleChildScrollView(
            child: StaticKPadding.kPadding(
                child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 25,
            ),
            Text("Enter your bidding offer amount here.",
                textAlign: TextAlign.center,
                style: StaticTextStyles.headingStyle),
            const SizedBox(
              height: 25,
            ),
            Text(
                "You are able"
                " to make bidding now! Good luck",
                style: StaticTextStyles.normalGreyTextStyle),
            const SizedBox(
              height: 25,
            ),
            customTextFormField(
                hintText: "Amount SAR",
                controller: controller,
                inputType: TextInputType.number),
            const SizedBox(
              height: 40,
            ),
            extendedButton(
                onTap: () async {
                  if (controller.text.isEmpty) return;
                  String body = await ApiServices.simplePost(
                      "Bidding/Bid?userId=${getUser().result!.id}&carId=$carId&amount=${controller.text}");
                  logger.i(body);
                  if (Get.isBottomSheetOpen == true) {
                    Get.back();
                    showToast(msg: 'Bidding has been placed');
                  }

                  if (body.isEmpty) {
                    Get.back();
                  }
                },
                buttonText: "Done",
                buttonColor: StaticColors.blueColor,
                textColor: StaticColors.whiteColor)
          ],
        ))),
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15), topLeft: Radius.circular(15))));
  }

  static Future<dynamic> customDialogBox(
      {String subTitle = "Sub Title"}) async {
    TextEditingController textEditingController = TextEditingController();

    return await Get.defaultDialog(
      content: SizedBox(
        width: width,
        child: Column(
          children: [
            Text(
              subTitle,
              style: StaticTextStyles.normalBlackTextStyle,
              textAlign: TextAlign.center,
            ),
            WhiteSpacer.verticalSpace(25),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: customTextFormField(
                  inputType: TextInputType.number,
                  hintText: "Enter Amount SAR",
                  controller: textEditingController),
            ),
            WhiteSpacer.verticalSpace(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                customizedButton(
                    buttonColor: StaticColors.blueColor,
                    onTap: () {
                      if (textEditingController.text.isEmpty) {
                        showToast(msg: "Please enter amount");
                        return ;
                      }
                      Get.back(result: double.parse(textEditingController.text)*100);
                    },
                    textColor: StaticColors.whiteColor,
                    buttonText: "Charge wallet",
                    buttonWidth: .35),
                customizedButton(
                    buttonColor: StaticColors.greyColor,
                    onTap: () {
                      Get.back();
                    },
                    textColor: StaticColors.whiteColor,
                    buttonText: "Cancel",
                    buttonWidth: .35),
              ],
            )
          ],
        ),
      ),
      titlePadding: EdgeInsets.all(20),
      barrierDismissible: false,
    );
  }
}

extendedButton({
  required onTap,
  String buttonText = "Button Text",
  required buttonColor,
  required textColor,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        child: Center(
            child: Padding(
          padding: EdgeInsets.only(top: height * .025, bottom: height * .025),
          child: Text(
            buttonText,
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
          ),
        )),
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(15)),
      ),
    ),
  );
}

customizedButton(
    {required buttonColor,
    double radius = 100,
    buttonText = "buttonText",
    required onTap,
    buttonWidth = .4,
    required textColor}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: width * buttonWidth,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
      decoration: BoxDecoration(
          color: buttonColor, borderRadius: BorderRadius.circular(radius)),
    ),
  );
}

Widget customTextFormField(
    {bool isOutLinedBorder = false,
    ValueChanged<String>? onChange,
    TextInputType? inputType,
    FormFieldValidator<String>? validator,
    Key? key,
    bool obscureText = false,
    String hintText = "Hint Text",
    String? labelText,
    Widget? suffixIcon,
    TextEditingController? controller}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: TextFormField(
      obscureText: obscureText,
      key: key,
      validator: validator,
      keyboardType: inputType,
      onChanged: onChange,
      controller: controller,
      decoration: InputDecoration(
          hintStyle: TextStyle(color: StaticColors.greyColor.withOpacity(.4)),
          suffixIcon: suffixIcon,
          hintText: hintText,
          errorStyle: TextStyle(color: StaticColors.orangeColor),
          focusedErrorBorder: isOutLinedBorder
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: StaticColors.orangeColor))
              : null,
          errorBorder: isOutLinedBorder
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: StaticColors.orangeColor))
              : null,
          focusedBorder: isOutLinedBorder
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: StaticColors.blueColor))
              : null,
          enabledBorder: isOutLinedBorder
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:
                      BorderSide(color: StaticColors.greyColor.withOpacity(.2)))
              : null),
    ),
  );
}

Future showProgressCircular() async {
  Get.dialog(Center(
    child: CircularProgressIndicator(
      backgroundColor: StaticColors.greyColor.withOpacity(.2),
      color: StaticColors.orangeColor,
    ),
  ));
}

dismissDialog() {
  if (Get.isDialogOpen!) {
    Get.back();
  }
}

showCustomDialog(String msgText) async {
  await Get.defaultDialog(
      content: Padding(
    padding: const EdgeInsets.all(25),
    child: Column(
      children: [
        Text(msgText, style: StaticTextStyles.subTitleStyleBlack),
        WhiteSpacer.verticalSpace(35),
        customizedButton(
            buttonText: "OK",
            buttonColor: StaticColors.orangeColor.withOpacity(.5),
            onTap: () {
              Get.back();
              Get.back();
            },
            textColor: StaticColors.whiteColor)
      ],
    ),
  ));
}

Future showToast({required msg}) async {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: StaticColors.greyColor,
      textColor: StaticColors.whiteColor,
      fontSize: 16.0);
}

Widget stepper(int activeStep, String title) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
          width: width,
          height: 1,
          color: StaticColors.greyColor.withOpacity(.3)),
      WhiteSpacer.verticalSpace(10),
      Text(
        title,
        style: StaticTextStyles.subTitleStyleBlack,
      ),
      WhiteSpacer.verticalSpace(10),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
              child: Text(
                "1",
                style: activeStep == 1
                    ? StaticTextStyles.normalWhiteTextStyle
                    : StaticTextStyles.normalBlackTextStyle,
              ),
              backgroundColor: activeStep == 1
                  ? StaticColors.orangeColor.withOpacity(.4)
                  : StaticColors.greyColor),
          Container(height: 1, color: StaticColors.greyColor, width: 20),
          CircleAvatar(
              child: Text(
                "2",
                style: activeStep == 2
                    ? StaticTextStyles.normalWhiteTextStyle
                    : StaticTextStyles.normalBlackTextStyle,
              ),
              backgroundColor: activeStep == 2
                  ? StaticColors.orangeColor.withOpacity(.4)
                  : StaticColors.greyColor),
          Container(height: 1, color: StaticColors.greyColor, width: 20),
          CircleAvatar(
              child: Text(
                "3",
                style: activeStep == 3
                    ? StaticTextStyles.normalWhiteTextStyle
                    : StaticTextStyles.normalBlackTextStyle,
              ),
              backgroundColor: activeStep == 3
                  ? StaticColors.orangeColor.withOpacity(.4)
                  : StaticColors.greyColor),
          Container(height: 1, color: StaticColors.greyColor, width: 20),
          CircleAvatar(
              child: Text(
                "4",
                style: activeStep == 4
                    ? StaticTextStyles.normalWhiteTextStyle
                    : StaticTextStyles.normalBlackTextStyle,
              ),
              backgroundColor: activeStep == 4
                  ? StaticColors.orangeColor.withOpacity(.4)
                  : StaticColors.greyColor),
          Container(height: 1, color: StaticColors.greyColor, width: 20),
          CircleAvatar(
              child: Text(
                "5",
                style: activeStep == 5
                    ? StaticTextStyles.normalWhiteTextStyle
                    : StaticTextStyles.normalBlackTextStyle,
              ),
              backgroundColor: activeStep == 5
                  ? StaticColors.orangeColor.withOpacity(.4)
                  : StaticColors.greyColor),
        ],
      ),
      WhiteSpacer.verticalSpace(10),
      Container(
          width: width,
          height: 1,
          color: StaticColors.greyColor.withOpacity(.1)),
    ],
  );
}

Widget profileModules(
    {required leading, required String title, required onTap}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 55,
              width: 55,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: leading,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: StaticColors.whiteColor,
                  boxShadow: [
                    BoxShadow(
                        color: StaticColors.greyColor.withOpacity(.1),
                        blurRadius: 10,
                        spreadRadius: 1)
                  ]),
            ),
            WhiteSpacer.horizontalSpace(30),
            Text(title, style: StaticTextStyles.subTitleStyleBlack),
            const Expanded(child: SizedBox()),
            const Icon(Icons.keyboard_arrow_right)
          ],
        ),
      ),
    ),
  );
}

Widget profileEditingModule(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: Colors.black)),
        const Expanded(child: SizedBox()),
        Icon(
          Icons.keyboard_arrow_right,
          color: StaticColors.greyColor,
        )
      ],
    ),
  );
}
