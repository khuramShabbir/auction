import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:auction/views/home/bottom_nav_bar_screens/auction_availability_screen.dart';
import 'package:auction/views/home/create_campaign_Screens/car_specs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';

class SearchForCarsScreen extends StatefulWidget {
  const SearchForCarsScreen({Key? key}) : super(key: key);

  @override
  State<SearchForCarsScreen> createState() => _SearchForCarsScreenState();
}

class _SearchForCarsScreenState extends State<SearchForCarsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: StaticKPadding.kPadding(
                child: Column(
      children: [
        Row(
          children: [
            InkWell(
              onTap: (){Get.back();},
              child: Icon(
                Icons.arrow_back,
                color: StaticColors.blackColor,
              ),
            ),
            WhiteSpacer.horizontalSpace(5),
            Expanded(
              child: SearchField(
                  suggestions: [],
                  searchInputDecoration: InputDecoration(
                      suffixIcon:
                          Row(mainAxisSize: MainAxisSize.min, children: [
                        SvgPicture.asset(
                          'assets/SvgAssets/filter.svg',
                          color: StaticColors.blackColor,
                        ),
                        WhiteSpacer.horizontalSpace(5),
                        Icon(
                          Icons.cancel,
                          color: StaticColors.greyColor.withOpacity(.4),
                        ),
                        WhiteSpacer.horizontalSpace(5),
                      ]),
                      prefixIcon: Icon(
                        Icons.search,
                        color: StaticColors.blackColor,
                      ),
                      filled: true,
                      fillColor: StaticColors.greyColor.withOpacity(.1),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(100)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(100)))),
            ),
            WhiteSpacer.horizontalSpace(5),
            Text(
              "cancel",
              style: StaticTextStyles.normalGreyTextStyle,
            )
          ],
        ),
        WhiteSpacer.verticalSpace(15),
        ListView.builder(
          itemCount: 4,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: InkWell(
                onTap: () {
                  Get.to(() => const CarSpecsScreen());
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: width * .25,
                      height: width * .18,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: NetworkImage(imageUrl), fit: BoxFit.fill)),
                    ),
                    WhiteSpacer.horizontalSpace(5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Car",
                          style: StaticTextStyles.subTitleStyleBlack,
                        ),
                        Text(
                          "Color : Blue",
                          style: StaticTextStyles.normalGreyTextStyle,
                        ),
                        Text(
                          "Size : 37",
                          style: StaticTextStyles.normalGreyTextStyle,
                        ),
                        Text(
                          "Qty : 1",
                          style: StaticTextStyles.normalGreyTextStyle,
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    Text("\$67", style: StaticTextStyles.subTitleStyleBlack)
                  ],
                ),
              ),
            );
          },
        ),
      ],
    ))));
  }
}