import 'package:auction/utils/const.dart';
import 'package:auction/views/home/create_campaign_Screens/car_specs.dart';
import 'package:flutter/material.dart';

class AuctionAvailability extends StatefulWidget {
  const AuctionAvailability({Key? key}) : super(key: key);

  @override
  _AuctionAvailabilityState createState() => _AuctionAvailabilityState();
}

class _AuctionAvailabilityState extends State<AuctionAvailability> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: StaticColors.whiteColor,
        appBar: CustomAppBar.appBar(),
        body: StaticKPadding.kPadding(
            child: ListView.builder(
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                WhiteSpacer.verticalSpace(20),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: StaticColors.whiteColor,
                      boxShadow: [
                        BoxShadow(
                            color: StaticColors.greyColor.withOpacity(.1),
                            spreadRadius: 0,
                            blurRadius: 20)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            height: 75,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(imageUrl),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        WhiteSpacer.horizontalSpace(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Mercedes jeep',
                              style: StaticTextStyles.subTitleStyleBlack,
                            ),
                            const Text(
                              'Check available',
                              style: TextStyle(color: Colors.green),
                            ),
                            Text(
                              'Riyadh - standard',
                              style: TextStyle(
                                  fontSize: 10,
                                  color:
                                      StaticColors.greyColor.withOpacity(.3)),
                            ),
                          ],
                        ),
                        const Expanded(child: SizedBox()),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.bookmark_border_outlined,
                                color: StaticColors.blueColor,
                              ),
                              Text(
                                "\$2.350",
                                style: TextStyle(
                                    color: StaticColors.blueColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                WhiteSpacer.verticalSpace(15),
              ],
            );
          },
        )),
      ),
    );
  }
}
