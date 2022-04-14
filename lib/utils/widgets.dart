import 'package:auction/controllers_providers/auction_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'const.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomWidget {
  static addWalletBottomSheet() {
    Get.bottomSheet(Container(
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: StaticKPadding.kPadding(
          child: Column(
        children: [
          WhiteSpacer.verticalSpace(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.arrow_back, color: AppColors.blackColor),
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
                  color: AppColors.blueColor.withOpacity(.01),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              WhiteSpacer.horizontalSpace(10),
              Text(
                "Credit Card",
                style: AppTextStyles.subTitleStyleBlack,
              ),
              const Expanded(child: SizedBox()),
              Container(
                child: Center(
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        color: AppColors.blackColor,
                        borderRadius: BorderRadius.circular(100)),
                  ),
                ),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border:
                        Border.all(width: 1, color: AppColors.blackColor)),
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
              buttonColor: AppColors.blueColor,
              textColor: AppColors.whiteColor)
        ],
      )),
    ));
  }

  static walletChargeBottomSheet() {
    Get.bottomSheet(Container(
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15), topLeft: Radius.circular(15))),
      child: StaticKPadding.kPadding(
          child: Column(
        children: [
          WhiteSpacer.verticalSpace(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.arrow_back, color: AppColors.blackColor),
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
                  color: AppColors.blueColor.withOpacity(.01),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              WhiteSpacer.horizontalSpace(10),
              Text(
                "Credit Card",
                style: AppTextStyles.subTitleStyleBlack,
              ),
              const Expanded(child: SizedBox()),
              Container(
                child: Center(
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        color: AppColors.blackColor,
                        borderRadius: BorderRadius.circular(100)),
                  ),
                ),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border:
                        Border.all(width: 1, color: AppColors.blackColor)),
              )
            ],
          ),
          WhiteSpacer.verticalSpace(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Account", style: AppTextStyles.normalGreyTextStyle),
              Text(".... .... ..... ",
                  style: AppTextStyles.normalBlackTextStyle),
              Text(auctionProvider.cardNumber,
                  style: AppTextStyles.normalBlackTextStyle),
            ],
          ),
          WhiteSpacer.verticalSpace(20),
          Row(
            children: [
              Text("Sub total", style: AppTextStyles.normalBlackTextStyle),
              const Expanded(child: SizedBox()),
              Text("\$ 29.96", style: AppTextStyles.subTitleStyleBlack),
            ],
          ),
          WhiteSpacer.verticalSpace(10),
          Row(
            children: [
              Text("vat", style: AppTextStyles.normalBlackTextStyle),
              const Expanded(child: SizedBox()),
              Text("\$ 2.99", style: AppTextStyles.subTitleStyleBlack),
            ],
          ),
          WhiteSpacer.verticalSpace(10),
          Row(
            children: [
              Text("Total", style: AppTextStyles.normalBlackTextStyle),
              const Expanded(child: SizedBox()),
              Text("\$ 32.95", style: AppTextStyles.headingStyle),
            ],
          ),
          const Expanded(child: SizedBox()),
          extendedButton(
              onTap: () {
                Get.back();
                walletStatus();
              },
              buttonText: "Charge Your Wallet",
              buttonColor: AppColors.blueColor,
              textColor: AppColors.whiteColor)
        ],
      )),
    ));
  }

  static walletStatus() {
    Get.bottomSheet(Container(
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
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
            child: Icon(Icons.check, color: AppColors.whiteColor, size: 25),
          ),
          Text("Your wallet charge successfully",
              style: AppTextStyles.headingStyle),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  "You are able"
                  " to make bidding now! ",
                  style: AppTextStyles.normalGreyTextStyle),
              Text("Good luck", style: AppTextStyles.normalGreyTextStyle),
            ],
          ),
          extendedButton(
              onTap: () {
                Get.back();
              },
              buttonText: "Done",
              buttonColor: AppColors.blueColor,
              textColor: AppColors.whiteColor)
        ],
      )),
    ));
  }



  static Future<String> imagePicker()async {
    String value='';
   await  Get.bottomSheet(




        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius:BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                WhiteSpacer.verticalSpace(20),
                Text(
                  "Action",
                  style: AppTextStyles.subTitleStyleBlack,
                ),
                WhiteSpacer.verticalSpace(30),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    extendedButton(
                        onTap: () {
                          value= "Gallery";
                          Get.back(result: value);
                        },
                        buttonColor: Colors.transparent,
                        textColor: AppColors.greyColor,

                        buttonText: "Gallery"),
                    extendedButton(
                        onTap: () {
                          value= "Camera";
                          Get.back(result: value);
                        },
                        buttonColor: Colors.transparent,
                        textColor: AppColors.greyColor,

                        buttonText: "Camera"),
                    WhiteSpacer.verticalSpace(20),
                  ],
                ),
                WhiteSpacer.verticalSpace(30),
              ],
            ),
          ),
        ),
        isDismissible: false,
        backgroundColor:Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)));
     return value;



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
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(color: textColor,fontWeight: FontWeight.bold),
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
    bool enabled = true,
    String hintText = "Hint Text",
    String? labelText,
    Widget? suffixIcon,
    TextEditingController? controller, Color? borderColor}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: TextFormField(
      obscureText: obscureText,
      key: key,
      validator: validator,
      keyboardType: inputType,
      onChanged: onChange,
      controller: controller,
      enabled: enabled,
      decoration: InputDecoration(
          hintStyle: TextStyle(color: AppColors.greyColor.withOpacity(.4)),
          suffixIcon: suffixIcon,
          hintText: hintText,
          errorStyle: TextStyle(color: AppColors.orangeColor),
          focusedErrorBorder: isOutLinedBorder
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColors.orangeColor,width: 1.5))
              : null,
          errorBorder: isOutLinedBorder
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColors.orangeColor,width: 1.5))
              : null,
          focusedBorder: isOutLinedBorder
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColors.orangeColor,width: 1.5))
              : null,
          enabledBorder: isOutLinedBorder
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:
                      BorderSide(color: borderColor??AppColors.orangeColor,width: 1.5))
              : null),
    ),
  );
}

 showProgressCircular() async {
  Get.dialog(Center(
    child: CircularProgressIndicator(
      backgroundColor: AppColors.greyColor.withOpacity(.2),
      color: AppColors.orangeColor,
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
        Text(msgText, style: AppTextStyles.subTitleStyleBlack),
        WhiteSpacer.verticalSpace(35),
        customizedButton(
            buttonText: "OK",
            buttonColor: AppColors.orangeColor.withOpacity(.5),
            onTap: () {
              Get.back();
              Get.back();
            },
            textColor: AppColors.whiteColor)
      ],
    ),
  ));
}

Future showToast({required msg}) async {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: AppColors.greyColor,
      textColor: AppColors.whiteColor,
      fontSize: 16.0);
}

Widget stepper(int activeStep, String title) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
          width: width,
          height: 1,
          color: AppColors.greyColor.withOpacity(.3)),
      WhiteSpacer.verticalSpace(10),
      Text(
        title,
        style: AppTextStyles.subTitleStyleBlack,
      ),
      WhiteSpacer.verticalSpace(10),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
              child: Text(
                "1",
                style: activeStep == 1
                    ? AppTextStyles.normalWhiteTextStyle
                    : AppTextStyles.normalBlackTextStyle,
              ),
              backgroundColor: activeStep == 1
                  ? AppColors.orangeColor.withOpacity(.4)
                  : AppColors.greyColor),
          Container(height: 1, color: AppColors.greyColor, width: 20),
          CircleAvatar(
              child: Text(
                "2",
                style: activeStep == 2
                    ? AppTextStyles.normalWhiteTextStyle
                    : AppTextStyles.normalBlackTextStyle,
              ),
              backgroundColor: activeStep == 2
                  ? AppColors.orangeColor.withOpacity(.4)
                  : AppColors.greyColor),
          Container(height: 1, color: AppColors.greyColor, width: 20),
          CircleAvatar(
              child: Text(
                "3",
                style: activeStep == 3
                    ? AppTextStyles.normalWhiteTextStyle
                    : AppTextStyles.normalBlackTextStyle,
              ),
              backgroundColor: activeStep == 3
                  ? AppColors.orangeColor.withOpacity(.4)
                  : AppColors.greyColor),
          Container(height: 1, color: AppColors.greyColor, width: 20),
          CircleAvatar(
              child: Text(
                "4",
                style: activeStep == 4
                    ? AppTextStyles.normalWhiteTextStyle
                    : AppTextStyles.normalBlackTextStyle,
              ),
              backgroundColor: activeStep == 4
                  ? AppColors.orangeColor.withOpacity(.4)
                  : AppColors.greyColor),
          Container(height: 1, color: AppColors.greyColor, width: 20),
          CircleAvatar(
              child: Text(
                "5",
                style: activeStep == 5
                    ? AppTextStyles.normalWhiteTextStyle
                    : AppTextStyles.normalBlackTextStyle,
              ),
              backgroundColor: activeStep == 5
                  ? AppColors.orangeColor.withOpacity(.4)
                  : AppColors.greyColor),
        ],
      ),
      WhiteSpacer.verticalSpace(10),
      Container(
          width: width,
          height: 1,
          color: AppColors.greyColor.withOpacity(.1)),
    ],
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
          color: AppColors.greyColor,
        )
      ],
    ),
  );
}
