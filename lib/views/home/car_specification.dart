import 'package:auction/models/auction/GetAllAuctions.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:auction/views/home/bottom_nav_bar_screens/search_for_cars_screen.dart';
import 'package:auction/views/home/create_campaign_Screens/car_specs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarSpecification extends StatefulWidget {
  final Result? result;

  const CarSpecification({Key? key, this.result}) : super(key: key);

  @override
  _CarSpecificationState createState() => _CarSpecificationState(this.result);
}

class _CarSpecificationState extends State<CarSpecification> {
  String exampleText =
      "Tame Impala is the psychedelic music project of Australian multi-instrumentalist Kevin Parker. "
      "In the recording studio,Parker writes, records, performs,"
      " and produces all of theproject's music.";
  String imageUrl =
      "https://www.jeep.com/content/dam/fca-brands/na/jeep/en_us/bhp/promo/"
      "winter/2021-Winter-BHP-Wrangler-"
      "Promotile-Desktop.jpg";
  Result? result;

  _CarSpecificationState(this.result);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(),
      body: StaticKPadding.kPadding(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height * .4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image:
                    result!.carImages.isEmpty?const NetworkImage("https://image.shutterstock.com/image-"
                        "vector/no-image-available-sign-internet-26"
                        "0nw-261719003.jpg"):

                    NetworkImage(result!.carImages[0].imagePath),
                    fit: BoxFit.fill)),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 75,
            child: ListView.builder(
              itemCount: result!.carImages.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Container(
                      width: 85,
                      height: 85,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(
                                  result!.carImages[index].imagePath),
                              fit: BoxFit.fill)),
                    ),
                    const SizedBox(width: 10),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Text("Specifications", style: StaticTextStyles.headingStyle),
          const SizedBox(height: 10),
          Text(exampleText,
              style: StaticTextStyles.normalGreyTextStyle,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              maxLines: 10),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(width: 50, height: 50, color: Colors.red),
              const SizedBox(width: 10),
              Container(width: 50, height: 50, color: Colors.red),
              const SizedBox(width: 10),
              Container(width: 50, height: 50, color: Colors.black),
              const SizedBox(width: 10),
              Text(
                "View",
                style: StaticTextStyles.normalGreyTextStyle,
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          extendedButton(
              onTap: () {
                bottomSheet();
              },
              buttonColor: StaticColors.blueColor,
              textColor: StaticColors.whiteColor,
              buttonText: "Status")
        ],
      )),
    );
  }
}

bottomSheet() {
  return Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
            color: StaticColors.whiteColor,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15), topLeft: Radius.circular(15))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            Container(
              width: 75,
              height: 5,
              decoration: BoxDecoration(
                  color: StaticColors.greyColor,
                  borderRadius: BorderRadius.circular(100)),
            ),
            const SizedBox(height: 20),
            StaticKPadding.kPadding(
                child: Container(
                    width: width,
                    height: height * .3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(imageUrl), fit: BoxFit.fill)),
                    child: StaticKPadding.kPadding(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "BMW Q7",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: StaticColors.whiteColor),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              "Weekdays",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w200,
                                  color: StaticColors.whiteColor),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                  height: 20,
                                  width: 1,
                                  color: StaticColors.whiteColor),
                            ),
                            Text(
                              "7:00",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w200,
                                  color: StaticColors.whiteColor),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Riyadh",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w200,
                              color: StaticColors.whiteColor),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.red.withOpacity(.3)),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                    ),
                                  ),
                                  const Text(
                                    "Acceptable",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  const SizedBox(width: 10)
                                ],
                              ),
                            ),
                            const Text(
                              "25000 / SAR",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    )))),
            const Icon(Icons.cancel, size: 100, color: Colors.red),
            const SizedBox(height: 15),
            Text("Good Luck Again", style: StaticTextStyles.headingStyle),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Text(
                  "Sorry the car was rejected from the owner,"
                  " and the down payment will be refunded to your wallet",
                  style: StaticTextStyles.normalGreyTextStyle),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: extendedButton(
                  onTap: () {
                    Get.back();
                    Get.to(() => const SearchForCarsScreen());
                  },
                  buttonColor: StaticColors.blueColor,
                  textColor: StaticColors.whiteColor,
                  buttonText: "TO complete your request"),
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
      exitBottomSheetDuration: const Duration(milliseconds: 500),
      enterBottomSheetDuration: const Duration(milliseconds: 500),
      enableDrag: true,
      isScrollControlled: true);
}
