import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CarSpecsScreen extends StatefulWidget {
  const CarSpecsScreen({Key? key}) : super(key: key);

  @override
  State<CarSpecsScreen> createState() => _CarSpecsScreenState();
}

String imageUrl =
    "https://www.jeep.com/content/dam/fca-brands/na/jeep/en_us/bhp/promo/"
    "winter/2021-Winter-BHP-Wrangler-"
    "Promotile-Desktop.jpg";
class _CarSpecsScreenState extends State<CarSpecsScreen> {

  double rating=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(title: "BMW Q7"),
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
                          image: NetworkImage(imageUrl), fit: BoxFit.fill)),
                ),
                WhiteSpacer.verticalSpace(10),
                SizedBox(
                  height: 75,
                  child: ListView.builder(
                    itemCount: 25,
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
                                    image: NetworkImage(imageUrl),
                                    fit: BoxFit.fill)),
                          ),
                          const SizedBox(width: 10),
                        ],
                      );
                    },
                  ),
                ),
                WhiteSpacer.verticalSpace(10),
                Text("Event By", style: StaticTextStyles.subTitleStyleBlack),
                WhiteSpacer.verticalSpace(10),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(imageUrl),
                    ),
                    WhiteSpacer.horizontalSpace(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Sunburn",
                            style: StaticTextStyles.subTitleStyleBlack),
                        Text("Posted on 30 jan,2022",
                            style: StaticTextStyles.normalGreyTextStyle),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    CircleAvatar(
                        backgroundColor: StaticColors.blueColor,
                        radius: 20,
                        child: Icon(
                            Icons.phone, color: StaticColors.whiteColor)),
                    WhiteSpacer.horizontalSpace(5),
                    CircleAvatar(
                        backgroundColor: StaticColors.blueColor,
                        radius: 20,
                        child: Icon(Icons.mail_outline,
                            color: StaticColors.whiteColor)),
                  ],
                ),
                WhiteSpacer.verticalSpace(10),
                Text("Specifications",
                    style: StaticTextStyles.subTitleStyleBlack),
                WhiteSpacer.verticalSpace(10),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 8,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: StaticColors.greyColor.withOpacity(.2),
                              width: 2)),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.battery_charging_full_outlined,
                                  color: StaticColors.greyColor.withOpacity(
                                      .7)),
                              const Expanded(child: SizedBox()),
                              Text("Max Power",
                                  style: StaticTextStyles.normalGreyTextStyle),
                              Text("320 hp",
                                  style: TextStyle(
                                      color: StaticColors.blackColor,
                                      fontSize: 13)),
                            ]),
                      ),
                    );
                  },
                ),
                WhiteSpacer.verticalSpace(10),
                Text("Car Feature", style: StaticTextStyles.subTitleStyleBlack),
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/PngAssets/User Account.png',
                                  height: 20,
                                ),
                                WhiteSpacer.horizontalSpace(5),
                                Text("2 Passenger",
                                    style: StaticTextStyles
                                        .normalBlackTextStyle),
                                const Expanded(child: SizedBox()),
                              ],
                            ),
                            WhiteSpacer.verticalSpace(5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/PngAssets/Winter.png',
                                  height: 20,
                                ),
                                WhiteSpacer.horizontalSpace(5),
                                Text("Snow Tires",
                                    style: StaticTextStyles
                                        .normalBlackTextStyle),
                              ],
                            ),
                            WhiteSpacer.verticalSpace(5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/PngAssets/Bluetooth.png',
                                  height: 20,
                                ),
                                WhiteSpacer.horizontalSpace(5),
                                Text("Bluetooth",
                                    style: StaticTextStyles
                                        .normalBlackTextStyle),
                              ],
                            ),
                          ],
                        )),
                    Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/PngAssets/Car Door.png',
                                  height: 20,
                                ),
                                WhiteSpacer.horizontalSpace(10),
                                Text("4 Doors",
                                    style: StaticTextStyles
                                        .normalBlackTextStyle),
                              ],
                            ),
                            WhiteSpacer.verticalSpace(5),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/PngAssets/GPS.png',
                                  height: 20,
                                ),
                                WhiteSpacer.horizontalSpace(10),
                                Text("GPS",
                                    style: StaticTextStyles
                                        .normalBlackTextStyle),
                              ],
                            ),
                            WhiteSpacer.verticalSpace(5),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/PngAssets/Book.png',
                                  height: 20,
                                ),
                                WhiteSpacer.horizontalSpace(10),
                                Text("Manual",
                                    style: StaticTextStyles
                                        .normalBlackTextStyle),
                              ],
                            )
                          ],
                        )),
                  ],
                ),
                WhiteSpacer.verticalSpace(20),
                Text("Information Furniture",
                    style: StaticTextStyles.subTitleStyleBlack),
                WhiteSpacer.verticalSpace(10),
                Text(
                  "This sofa Make your leisure time"
                      " or rest at home ore quality "
                      "accompanied by the comfort "
                      "of Grolind 2-seat Sofa's."
                      " Read more",
                  style: StaticTextStyles.normalGreyTextStyle,
                ),
                WhiteSpacer.verticalSpace(20),
                commentSection(),
                commentSection(),
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
                        buttonWidth: .6
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

Widget commentSection(

    ) {

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

          itemBuilder: (context, _) =>
           const Icon(
           Icons.star,
           color: Colors.amber,
           ),
          onRatingUpdate: (rating) {


          },
        ),
        WhiteSpacer.horizontalSpace(5),
        Text('4.5',style: StaticTextStyles.normalBlackTextStyle,),

      ],
    )
  ]);
}
