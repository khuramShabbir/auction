import 'package:auction/utils/const.dart';
import 'package:auction/views/home/create_campaign_Screens/step3_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/widgets.dart';

class CreateCampaignScreen extends StatefulWidget {
  const CreateCampaignScreen({Key? key}) : super(key: key);

  @override
  _CreateCampaignScreenState createState() => _CreateCampaignScreenState();
}

class _CreateCampaignScreenState extends State<CreateCampaignScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: CustomAppBar.appBar(title: "Create a campaign"),
            body: Column(

              children: [
                stepper(2,"Target amount"),
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
                        Text("29.96" " SAR",
                            style: StaticTextStyles.normalBlackTextStyle)
                      ],
                    ),
                    WhiteSpacer.verticalSpace(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Mazad Commission",
                            style: StaticTextStyles.normalGreyTextStyle),
                        Text("29.96" " SAR",
                            style: StaticTextStyles.normalBlackTextStyle)
                      ],
                    ),
                    WhiteSpacer.verticalSpace(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Down Payment",
                            style: TextStyle(color: Colors.red)),
                        Text("-29.96"  " SAR",
                            style: TextStyle(color: Colors.red))
                      ],
                    ),
                    WhiteSpacer.verticalSpace(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("vat",
                            style: StaticTextStyles.normalGreyTextStyle),
                        Text("2.9" " SAR",
                            style: StaticTextStyles.normalBlackTextStyle)
                      ],
                    ),
                    WhiteSpacer.verticalSpace(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total",
                            style: StaticTextStyles.normalGreyTextStyle),
                        Text("29.96" " SAR",
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
                          "Khaleed Al-kayali",
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
                          "900127212570007",
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
                          "SA7715000900127212570007",
                          style: StaticTextStyles.normalGreyTextStyle,
                        )
                      ],
                    ),

                  ],
                )),
                const Expanded(child: SizedBox()),
                extendedButton(
                    onTap: () {
                      Get.to(()=>const UploadCarPhotoScreen());
                    },
                    buttonText: "Next",
                    buttonColor: StaticColors.orangeColor.withOpacity(.3),
                    textColor: StaticColors.greyColor),
                WhiteSpacer.verticalSpace(20)

              ],
            )));
  }
}
