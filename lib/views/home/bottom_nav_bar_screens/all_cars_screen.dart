import 'package:auction/controllers_providers/auth_provider.dart';
import 'package:auction/controllers_providers/normalSale/normalSaleProvider.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/views/home/create_campaign_Screens/car_specs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:searchfield/searchfield.dart';

import '../../../models/AllCars/all_cars_model.dart';
import 'upload_car_screen.dart';

class AllCarsScreen extends StatefulWidget {
  final bool? myCarsLoaded;

  AllCarsScreen(this.myCarsLoaded);

  @override
  State<AllCarsScreen> createState() => _AllCarsScreenState(this.myCarsLoaded);
}

class _AllCarsScreenState extends State<AllCarsScreen> {
  bool? myCarsLoaded;

  _AllCarsScreenState(this.myCarsLoaded);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (myCarsLoaded == true) {
      normalSaleProvider.getAllCars();
    }
    normalSaleProvider.getMyUploadedCars();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NormalSaleProvider>(
      builder: (BuildContext context, data, Widget? child) {
        return Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: myCarsLoaded == false
                ? FloatingActionButton(
                    backgroundColor: StaticColors.blueColor,
                    child: Icon(
                      Icons.add,
                      color: StaticColors.orangeColor,
                    ),
                    onPressed: () {
                      Get.to(() => const UploadCarScreen());
                    })
                : null,
            body: StaticKPadding.kPadding(
                child: Column(
                  children: [
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: StaticColors.blackColor,
                        )),
                    WhiteSpacer.horizontalSpace(5),
                    Expanded(
                      child: SearchField(
                          suggestions: [],
                          searchInputDecoration: InputDecoration(
                              suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/SvgAssets/filter.svg',
                                      color: StaticColors.blackColor,
                                    ),
                                    WhiteSpacer.horizontalSpace(5),
                                    Icon(
                                      Icons.cancel,
                                      color: StaticColors.greyColor
                                          .withOpacity(.4),
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
                Flexible(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics:ScrollPhysics(),
                      itemCount: data.allCarsModel == null
                          ? 0
                          : data.allCarsModel!.result!.length,
                      itemBuilder: (BuildContext context, int index) {
                        var singleCarDetail = data.allCarsModel!.result![index];
                        Result result = data.allCarsModel!.result![index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: InkWell(
                            onTap: () {
                              Get.to(() => CarSpecsScreen(result: result));
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: width * .25,
                                  height: width * .18,
                                  decoration: BoxDecoration(
                                      color: StaticColors.greyColor
                                          .withOpacity(0.15),
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://auction.api.deeps.info/${singleCarDetail.pictures!.isEmpty ? "" : singleCarDetail.pictures![0]}"),
                                          fit: BoxFit.fill)),
                                ),
                                WhiteSpacer.horizontalSpace(5),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      singleCarDetail.model ?? "",
                                      style: StaticTextStyles.subTitleStyleBlack,
                                    ),
                                    Text(
                                      "Color : ${singleCarDetail.color ?? ""}",
                                      style: StaticTextStyles.normalGreyTextStyle,
                                    ),
                                    Text(
                                      "Milleage : ${singleCarDetail.milleage ?? ""}",
                                      style: StaticTextStyles.normalGreyTextStyle,
                                    ),
                                    Text(
                                      "year : ${singleCarDetail.year ?? ""}",
                                      style: StaticTextStyles.normalGreyTextStyle,
                                    )
                                  ],
                                ),
                                const Expanded(child: SizedBox()),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("SAR",
                                        style:
                                            StaticTextStyles.subTitleStyleBlack),
                                    Text(singleCarDetail.price ?? "",
                                        style:
                                            StaticTextStyles.subTitleStyleBlack)
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            )));
      },
    );
  }
}
