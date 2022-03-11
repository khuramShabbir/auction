import 'package:auction/utils/const.dart';
import 'package:auction/views/home/create_campaign_Screens/step4_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/widgets.dart';

class UploadCarPhotoScreen extends StatefulWidget {
  const UploadCarPhotoScreen({Key? key}) : super(key: key);

  @override
  _UploadCarPhotoScreenState createState() => _UploadCarPhotoScreenState();
}

class _UploadCarPhotoScreenState extends State<UploadCarPhotoScreen> {
  String imageUrl="https://www.team-bhp.com/forum/attachments/"
      "indian-car-scene/1608074d1486999433-15-year-old-cars-certificate-"
      "fitness-cf-new-rates-applicable-wef29122016.jpg";


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar.appBar(title: 'Create campaign'),
      body: Column(
        children: [
          stepper(3, "Upload photos"),
          WhiteSpacer.verticalSpace(10),
          StaticKPadding.kPadding(
              child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: StaticColors.whiteColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WhiteSpacer.verticalSpace(10),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Upload Cover Photo",
                        style: TextStyle(
                            color: StaticColors.blackColor,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    WhiteSpacer.verticalSpace(10),
                    StaticKPadding.kPadding(
                        child: Container(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.upload_outlined,
                                color: StaticColors.greyColor),
                            Text(
                              "Upload",
                              style: StaticTextStyles.normalGreyTextStyle,
                            )
                          ],
                        ),
                      ),
                      height: height * .2,
                      decoration: BoxDecoration(
                          color: StaticColors.greyColor.withOpacity(.2),
                          borderRadius: BorderRadius.circular(10)),
                    )),
                  ],
                ),
              ),
              WhiteSpacer.verticalSpace(10),
              Container(
                decoration: BoxDecoration(
                    color: StaticColors.whiteColor,
                    borderRadius: BorderRadius.circular(10)),
                child: StaticKPadding.kPadding(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WhiteSpacer.verticalSpace(10),
                    Text(
                      "Medical certificate",
                      style: TextStyle(
                          color: StaticColors.blackColor,
                          fontWeight: FontWeight.w300),
                    ),
                    WhiteSpacer.verticalSpace(10),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: height * .15,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: 2,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                children: [
                                  Container(
                                    width: height * .15,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.red,
                                        image: DecorationImage(
                                            image: NetworkImage(imageUrl),
                                            fit: BoxFit.fill)),
                                  ),
                                  WhiteSpacer.horizontalSpace(10)
                                ],
                              );
                            },
                          ),
                        )
                      ],
                    )
                  ],
                )),
              )
            ],
          )),
          const Expanded(child: SizedBox()),
          extendedButton(
              onTap: () {Get.to(()=>const CompletionCampaignScreen());},
              buttonText: "Next",
              buttonColor: StaticColors.orangeColor.withOpacity(.3),
              textColor: StaticColors.greyColor),
        ],
      ),
    ));
  }
}
