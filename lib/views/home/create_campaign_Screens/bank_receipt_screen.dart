import 'dart:io';

import 'package:auction/controllers_providers/auction_provider.dart';
import 'package:auction/controllers_providers/auth_provider.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:auction/views/home/create_campaign_Screens/payment_complete_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class BankReceiptScreen extends StatefulWidget {
  const BankReceiptScreen({Key? key}) : super(key: key);

  @override
  _BankReceiptScreenState createState() => _BankReceiptScreenState();
}

class _BankReceiptScreenState extends State<BankReceiptScreen> {
  final ImagePicker picker = ImagePicker();

  // String imageUrl = "https://www.team-bhp.com/forum/attachments/"
  //     "indian-car-scene/1608074d1486999433-15-year-old-cars-certificate-"
  //     "fitness-cf-new-rates-applicable-wef29122016.jpg";
  List<File> files = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar.appBar(title: 'Create campaign'),
      body: Consumer<AuctionProvider>(
        builder: (BuildContext context, data, Widget? child) {
          return Column(
            children: [
              stepper(3, "Upload photos"),
              WhiteSpacer.verticalSpace(10),
              StaticKPadding.kPadding(
                  child: Column(
                children: [
                  InkWell(
                    onTap: () async {
                      String value = await CustomWidget.imagePicker();
                      if (value.isEmpty) {
                        return;
                      } else if (value == "Gallery") {
                        logger.i(value);
                        XFile? xFile =
                            await picker.pickImage(source: ImageSource.gallery);
                        if (xFile == null) return;
                        files.add(File(xFile.path));
                        setState(() {});
                      } else {
                        logger.i(value);
                        XFile? xFile = await picker.pickImage(
                            source: ImageSource.camera,
                            preferredCameraDevice: CameraDevice.rear);
                        if (xFile != null) {
                          files.add(File(xFile.path));
                          setState(() {});
                        }
                      }
                    },
                    child: Container(
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
                  ),
                  WhiteSpacer.verticalSpace(10),
                  StaticKPadding.kPadding(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WhiteSpacer.verticalSpace(10),
                      Text(
                        "Receipt",
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
                              itemCount: files.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          width: height * .15,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  image:
                                                      FileImage(files[index]),
                                                  fit: BoxFit.fill)),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            files.removeAt(index);
                                            setState(() {});
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(
                                              Icons.cancel,
                                              color: StaticColors.orangeColor,
                                            ),
                                          ),
                                        )
                                      ],
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
                  ))
                ],
              )),
              const Expanded(child: SizedBox()),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: extendedButton(
                    onTap: () async {
                      if (files.isEmpty) return;
                      bool isPosted = await data.uploadPaymentEvidence(files);
                      if (isPosted == true) {
                        Get.back();
                        Get.back();
                        Get.to(() => const PaymentCompleteScreen());
                        auctionProvider.getAuctionByUser();
                      }
                    },
                    buttonText: "Next",
                    buttonColor: StaticColors.orangeColor.withOpacity(.3),
                    textColor: StaticColors.greyColor),
              )
            ],
          );
        },
      ),
    ));
  }
}
