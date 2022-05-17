import 'package:auction/controllers_providers/Auth/auth_provider.dart';
import 'package:auction/controllers_providers/normalSale/normalSaleProvider.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/views/home/bottom_nav_bar_screens/home_screen.dart';
import 'package:auction/views/home/create_campaign_Screens/car_specs.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:searchfield/searchfield.dart';

import '../../../models/AllCars/all_cars_model.dart';
import 'upload_car_screen.dart';

class AllCarsScreen extends StatefulWidget {
  final bool? myCarsLoaded;
  bool isAppBarRequired;

  AllCarsScreen(this.myCarsLoaded, {this.isAppBarRequired = true});

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
    } else {
      normalSaleProvider.getMyUploadedCars();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NormalSaleProvider>(
      builder: (BuildContext context, data, Widget? child) {
        return Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: myCarsLoaded == false
                ? FloatingActionButton(
                    backgroundColor: AppColors.orangeColor,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Get.to(() => const UploadCarScreen());
                    })
                : null,
            appBar: widget.isAppBarRequired
                ? getAppBar("Cars for Sale", isLeadingRequired: myCarsLoaded!)
                : null,
            body: StaticKPadding.kPadding(
                child:Center(
                  child: Container(
                    width: Get.width*0.6,
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: height * .45,
                          crossAxisSpacing: 3,
                          mainAxisSpacing: 2,
                          crossAxisCount:
                              kIsWeb
                              &&
                              context.height > 600
                              &&
                              context.width >600 ? 4 : 2,
                        ),
                        scrollDirection: Axis.vertical,
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
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                      border:Border.all(color: AppColors.greyColor)
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: width * .25,
                                        height: width * .13,
                                        decoration: BoxDecoration(
                                            color: AppColors.greyColor
                                                .withOpacity(0.15),
                                            borderRadius: BorderRadius.circular(8),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://auction.api.deeps.info/${singleCarDetail.pictures!.isEmpty ? "" : singleCarDetail.pictures![0]}"),
                                                fit: BoxFit.fill)),
                                      ),
                                      WhiteSpacer.horizontalSpace(5),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              singleCarDetail.model ?? "",
                                              style: AppTextStyles.subTitleStyleBlack,
                                            ),
                                            SizedBox(height: 2,),
                                            Text(
                                              "Color : ${singleCarDetail.color ?? ""}",
                                              style: AppTextStyles.normalGreyTextStyle,
                                            ),
                                            SizedBox(height: 2,),
                                            Text(
                                              "Mileage : ${singleCarDetail.milleage ?? ""}",
                                              style: AppTextStyles.normalGreyTextStyle,
                                            ),
                                            SizedBox(height: 2,),
                                            Text(
                                              "year : ${singleCarDetail.year ?? ""}",
                                              style: AppTextStyles.normalGreyTextStyle,
                                            ),
                                            SizedBox(height: 2,),
                                            Text("SAR ${singleCarDetail.price}",
                                                style:
                                                AppTextStyles.subTitleStyleBlack)

                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
            )
        );
      },
    );
  }
}
