import 'package:auction/controllers_providers/auth_provider.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../models/AllCars/all_cars_model.dart';
import 'package:url_launcher/url_launcher.dart';

class CarSpecsScreen extends StatefulWidget {
  const CarSpecsScreen({Key? key, this.result}) : super(key: key);

  final Result? result;

  @override
  State<CarSpecsScreen> createState() => _CarSpecsScreenState(this.result);
}

String imageUrl =
    "https://www.jeep.com/content/dam/fca-brands/na/jeep/en_us/bhp/promo/"
    "winter/2021-Winter-BHP-Wrangler-"
    "Promotile-Desktop.jpg";

class _CarSpecsScreenState extends State<CarSpecsScreen> {
  Result? result;

  double rating = 0;

  _CarSpecsScreenState(this.result);

  int imageIndex=0;


  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> resultData = result!.toJson();

    return Scaffold(
      appBar: CustomAppBar.appBar(title: result!.model ?? ""),
      body: StaticKPadding.kPadding(
          child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * .4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: NetworkImage("https://auction.api.deeps.info/${result!.pictures![imageIndex]}"), fit: BoxFit.fill)),
            ),
            WhiteSpacer.verticalSpace(10),
            SizedBox(
              height: 75,
              child: ListView.builder(
                itemCount: result!.pictures!.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      InkWell(
                        onTap: (){
                          imageIndex=index;
                          setState(() {});
                        },
                        child: Container(
                          width: 85,
                          height: 85,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage("https://auction.api.deeps.info/${result!.pictures![index]}"),
                                  fit: BoxFit.fill)),
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  );
                },
              ),
            ),
            WhiteSpacer.verticalSpace(20),
            Text("Event By", style: StaticTextStyles.subTitleStyleBlack),
            WhiteSpacer.verticalSpace(10),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                          image: NetworkImage(imageUrl), fit: BoxFit.fill)),
                ),
                WhiteSpacer.horizontalSpace(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${result!.user!.name}",
                        style: StaticTextStyles.subTitleStyleBlack),
                    Text("${result!.user!.created}",
                        style: StaticTextStyles.normalGreyTextStyle),
                  ],
                ),
                const Expanded(child: SizedBox()),
                InkWell(
                  onTap: (){
                    launch("tel://${result!.user!.phoneNumber}");
                  },
                  child: CircleAvatar(
                      backgroundColor: StaticColors.blueColor,
                      radius: 20,
                      child: Icon(Icons.phone, color: StaticColors.whiteColor)),
                ),
                WhiteSpacer.horizontalSpace(5),
                // CircleAvatar(
                //     backgroundColor: StaticColors.blueColor,
                //     radius: 20,
                //     child: Icon(Icons.mail_outline,
                //         color: StaticColors.whiteColor)),
              ],
            ),
            WhiteSpacer.verticalSpace(20),
            Text("Specifications", style: StaticTextStyles.subTitleStyleBlack),
            WhiteSpacer.verticalSpace(10),

            SizedBox(
              width: width,
              height: height * .1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  carFeatures(title: "Color", value: result!.color ?? 'NA'),
                  carFeatures(
                      title: "Max Power", value: result!.maxPower ?? 'NA',icon: Image.asset("assets/PngAssets/maxspeed.png")),
                  carFeatures(
                      title: "Max Speed", value: result!.maxSpeed ?? 'NA',icon: Image.asset("assets/PngAssets/maxspeed.png")),
                  carFeatures(
                      title: "Fuel Tank", value: result!.fuelTank ?? 'NA',icon: Image.asset("assets/PngAssets/Petrol.png")),
                ],
              ),
            ),
            WhiteSpacer.verticalSpace(10),
            SizedBox(
              width: width,
              height: height * .1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  carFeatures(title: "Year", value: result!.year ?? 'NA'),
                  carFeatures(
                      title: "Milleage", value: result!.milleage ?? 'NA',icon: Image.asset("assets/PngAssets/millage.png")),
                  carFeatures(
                      title: "Serial No", value: result!.serialNo ?? "NA"),
                  carFeatures(title: "Plate", value: result!.plate ?? "NA"),
                ],
              ),
            ),
            WhiteSpacer.verticalSpace(10),
            SizedBox(
              width: width,
              height: height * .1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  carFeatures(title: "chassis", value: result!.chassis ?? 'NA'),

                ],
              ),
            ),

            WhiteSpacer.verticalSpace(20),
            Text("Car Feature", style: StaticTextStyles.subTitleStyleBlack),
            WhiteSpacer.verticalSpace(10),
            Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/PngAssets/User Account.png',
                                height: 20,
                              ),
                              WhiteSpacer.horizontalSpace(5),
                              Text("${result!.passengers ?? ''} Passengers",
                                  style: StaticTextStyles.normalBlackTextStyle),
                              const Expanded(child: SizedBox()),
                            ],
                          ),
                        ),
                        WhiteSpacer.verticalSpace(5),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/PngAssets/Winter.png',
                                height: 20,
                              ),
                              WhiteSpacer.horizontalSpace(5),
                              Text(
                                  result!.isSnowTires!
                                      ? "Snow Tires"
                                      : "Snow Tires NA",
                                  style: StaticTextStyles.normalBlackTextStyle),
                            ],
                          ),
                        ),
                        WhiteSpacer.verticalSpace(5),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/PngAssets/Bluetooth.png',
                                height: 20,
                              ),
                              WhiteSpacer.horizontalSpace(5),
                              Text(
                                  result!.isBluetooth!
                                      ? "Bluetooth"
                                      : "Bluetooth NA",
                                  style: StaticTextStyles.normalBlackTextStyle),
                            ],
                          ),
                        ),
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/PngAssets/Car Door.png',
                                height: 20,
                              ),
                              WhiteSpacer.horizontalSpace(10),
                              Text("${result!.doors ?? ''} Doors",
                                  style: StaticTextStyles.normalBlackTextStyle),
                            ],
                          ),
                        ),
                        WhiteSpacer.verticalSpace(5),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/PngAssets/GPS.png',
                                height: 20,
                              ),
                              WhiteSpacer.horizontalSpace(10),
                              Text(result!.isGps! ? "GPS" : "GPS NA",
                                  style: StaticTextStyles.normalBlackTextStyle),
                            ],
                          ),
                        ),
                        WhiteSpacer.verticalSpace(5),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/PngAssets/Book.png',
                                height: 20,
                              ),
                              WhiteSpacer.horizontalSpace(10),
                              Text(result!.isManual! ? "Manual" : "Automatic",
                                  style: StaticTextStyles.normalBlackTextStyle),
                            ],
                          ),
                        )
                      ],
                    )),
              ],
            ),
            WhiteSpacer.verticalSpace(30),
            Text("Information", style: StaticTextStyles.subTitleStyleBlack),
            WhiteSpacer.verticalSpace(10),
            Text(
              result!.description!,
              style: StaticTextStyles.normalGreyTextStyle,
            ),
            WhiteSpacer.verticalSpace(20),
            // commentSection(),
            // commentSection(),
            WhiteSpacer.verticalSpace(150),
            Container(
                height: height * .2,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: StaticColors.greyColor.withOpacity(.5)),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: TextField(
                    onChanged: (String value) {},
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: ' PlaceHolder Text',
                        hintStyle: StaticTextStyles.normalGreyTextStyle),
                  ),
                )),
            WhiteSpacer.verticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    child: Icon(
                      Icons.favorite,
                      color: StaticColors.greyColor.withOpacity(.5),
                    ),
                  ),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: StaticColors.greyColor.withOpacity(.3),
                            spreadRadius: 1,
                            blurRadius: 10)
                      ],
                      color: StaticColors.whiteColor,
                      borderRadius: BorderRadius.circular(10)),
                ),
                customizedButton(
                  onTap: () {},
                  textColor: StaticColors.whiteColor,
                  buttonColor: StaticColors.blueColor,
                  buttonText: "Send",
                  radius: 15,
                  buttonWidth: .6,
                ),
              ],
            ),
            WhiteSpacer.verticalSpace(20),
          ],
        ),
      )),
    );
  }
}

Widget commentSection() {
  return Column(children: [
    Row(
      children: [
        CircleAvatar(radius: 25, backgroundImage: NetworkImage(imageUrl)),
        WhiteSpacer.horizontalSpace(10),
        Text(
          "Zaki mohammad",
          style: StaticTextStyles.subTitleStyleBlack,
        )
      ],
    ),
    WhiteSpacer.verticalSpace(10),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        "The testimony in you is wounded. "
        "Thank you very much for your kind cooperation",
        style: StaticTextStyles.normalGreyTextStyle,
      ),
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        RatingBar.builder(
          initialRating: 4.5,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 15,
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {},
        ),
        WhiteSpacer.horizontalSpace(5),
        Text(
          '4.5',
          style: StaticTextStyles.normalBlackTextStyle,
        ),
      ],
    )
  ]);
}

Widget carFeatures({required title, required value,Widget icon=const Text("")}) {
  return Container(
    constraints: BoxConstraints(minWidth: width * .21),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
            color: StaticColors.greyColor.withOpacity(.5), width: 2)),
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            icon,
            const Expanded(child: SizedBox()),
            Text(title, style: StaticTextStyles.normalGreyTextStyle),
            Text(value,
                style: TextStyle(color: StaticColors.blackColor, fontSize: 13)),
          ]),
    ),
  );
}
