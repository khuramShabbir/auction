import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'preview_campaign_screen.dart';

class CompletionCampaignScreen extends StatefulWidget {
  const CompletionCampaignScreen({Key? key}) : super(key: key);

  @override
  _CompletionCampaignScreenState createState() =>
      _CompletionCampaignScreenState();
}

class _CompletionCampaignScreenState extends State<CompletionCampaignScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(title: "Compelet", action: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Center(
            child: Text(
              "Preview",
              style: TextStyle(color: StaticColors.blueColor),
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
                  color: StaticColors.whiteColor,
                ),
              ),
              WhiteSpacer.verticalSpace(15),
              Text(
                "Create successful campaign",
                style: StaticTextStyles.subTitleStyleBlack,
              ),

            ],
          ),
          WhiteSpacer.verticalSpace(20),
          Text(
            "Fundria will verify your campaign as soon as you publish"
            ". This can take 12-48 hours."
            " If there is any problem, we will notify you.",
            style: StaticTextStyles.normalGreyTextStyle,
          ),
          WhiteSpacer.verticalSpace(20),
          extendedButton(
            onTap: () {
              Get.to(() => const CampaignPreviewScreen());
            },
            buttonColor: StaticColors.blueColor,
            buttonText: "View Receipt",
            textColor: StaticColors.whiteColor,
          ),
        ],
      )),
    );
  }
}
