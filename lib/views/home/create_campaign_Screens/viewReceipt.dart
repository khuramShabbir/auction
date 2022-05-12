import 'package:auction/ApiServices/api_services.dart';
import 'package:auction/controllers_providers/shipment_provider/shipmentProvider.dart';
import 'package:auction/models/auction/auction_by_user.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:auction/views/payment_method_screens/web_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ViewReceiptScreen extends StatefulWidget {
  Result result;

  ViewReceiptScreen(this.result, {Key? key}) : super(key: key);

  @override
  _ViewReceiptScreenState createState() => _ViewReceiptScreenState(this.result);
}

class _ViewReceiptScreenState extends State<ViewReceiptScreen> {
  Result result;

  _ViewReceiptScreenState(this.result);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    shipmentProvider.getShippingCompanies();
    shipmentProvider.getInsuranceCompanies();
  }

  String deliveyCost = "0";
  String insuranceCost = "0";
  int shippingIndex = -1;
  int insuranceIndex = -1;
  int shippingID = -1;
  int insuranceID = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar.appBar(title: "Complete"),
      body: StaticKPadding.kPadding(
          child: Consumer<ShipmentProvider>(builder: (context, data, child) {
        return Column(
          children: [
            WhiteSpacer.verticalSpace(20),
            Container(
              width: width,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.1),
                        blurRadius: 20,
                        spreadRadius: 10),
                  ],
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WhiteSpacer.verticalSpace(10),
                    Text(
                      "Shipping",
                      style: AppTextStyles.normalBlackTextStyle,
                    ),
                    WhiteSpacer.verticalSpace(10),
                    SizedBox(
                      height: height * .165,
                      child: ListView.builder(
                        itemCount: data.getAllShippingCompanies == null
                            ? 0
                            : data.getAllShippingCompanies!.result!.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          var result =
                              data.getAllShippingCompanies!.result![index];
                          return InkWell(
                            onTap: () {
                              deliveyCost = result.charges.toString();
                              shippingIndex = index;
                              shippingID = result.id;
                              setState(() {});
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: shippingIndex == index
                                    ? AppColors.orangeColor.withOpacity(0.5)
                                    : Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(.1),
                                      blurRadius: 20,
                                      spreadRadius: 1),
                                ],
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: SizedBox(
                                      width: width * .20,
                                      height: width * .20,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.network(
                                            ApiServices.BASE_IMAGE +
                                                "${result.logo}"),
                                      ),
                                    ),
                                  ),
                                  Text("${result.duration}",
                                      style: AppTextStyles.normalGreyTextStyle),
                                  Text(
                                      "SAR ${double.parse(result.charges.toString()).toInt()}",
                                      style: AppTextStyles.normalGreyTextStyle),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            WhiteSpacer.verticalSpace(20),
            Container(
              width: width,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.1),
                        blurRadius: 20,
                        spreadRadius: 10),
                  ],
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WhiteSpacer.verticalSpace(10),
                    Text(
                      "Vehicle insurance",
                      style: AppTextStyles.normalBlackTextStyle,
                    ),
                    WhiteSpacer.verticalSpace(10),
                    SizedBox(
                      height: height * .165,
                      child: ListView.builder(
                        itemCount: data.getAllInsuranceCompanies == null
                            ? 0
                            : data.getAllInsuranceCompanies!.result!.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          var result =
                              data.getAllInsuranceCompanies!.result![index];
                          return InkWell(
                            onTap: () {
                              insuranceCost = result.charges.toString();
                              insuranceIndex = index;
                              insuranceID = result.id;
                              setState(() {});
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: insuranceIndex == index
                                    ? AppColors.orangeColor.withOpacity(0.5)
                                    : Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(.1),
                                      blurRadius: 20,
                                      spreadRadius: 1),
                                ],
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: SizedBox(
                                      width: width * .20,
                                      height: width * .20,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.network(
                                            ApiServices.BASE_IMAGE +
                                                "${result.logo}"),
                                      ),
                                    ),
                                  ),
                                  Text("${result.duration} Month(s)",
                                      style: AppTextStyles.normalGreyTextStyle),
                                  Text(
                                      "SAR ${double.parse(result.charges.toString()).toInt()}",
                                      style: AppTextStyles.normalGreyTextStyle),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            WhiteSpacer.verticalSpace(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delivery Cost",
                  style: AppTextStyles.normalGreyTextStyle,
                ),
                Text(
                  "SAR ${double.parse(deliveyCost).toInt()}",
                  style: AppTextStyles.subTitleStyleBlack,
                ),
              ],
            ),
            WhiteSpacer.verticalSpace(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Insurance Cost",
                  style: AppTextStyles.normalGreyTextStyle,
                ),
                Text(
                  "SAR ${double.parse(insuranceCost).toInt()}",
                  style: AppTextStyles.subTitleStyleBlack,
                ),
              ],
            ),
            WhiteSpacer.verticalSpace(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Vat",
                  style: AppTextStyles.normalGreyTextStyle,
                ),
                Text(
                  "15%",
                  style: AppTextStyles.subTitleStyleBlack,
                ),
              ],
            ),
            WhiteSpacer.verticalSpace(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: AppTextStyles.normalGreyTextStyle,
                ),
                Text(
                  "SAR ${(double.parse(deliveyCost) + double.parse(insuranceCost)).toInt()}",
                  style: AppTextStyles.headingStyle,
                ),
              ],
            ),
            const Expanded(child: SizedBox()),
            extendedButton(
                onTap: () async {
                  if (insuranceIndex != -1 && shippingIndex != -1) {
                    var resultBool = await Get.to(() => PaymentWebView(
                        initUrl: "https://auction.cp.deeps.info/Home/Payment?"
                            "userId=${getUser()!.result!.id}"
                            "&amount=${(double.parse(deliveyCost) + double.parse(insuranceCost)).toInt() * 100}"));

                    if (resultBool==true) {
                      data.bookAShipment(insuranceID,shippingID,result.carInformationId,(double.parse(deliveyCost) + double.parse(insuranceCost)));
                    } else {
                      showToast(msg: "Unable to charge amount");
                    }
                  }
                },
                buttonText: "Next",
                buttonColor: AppColors.orangeColor.withOpacity(
                    insuranceIndex != -1 && shippingIndex != -1 ? 1 : 0.3),
                textColor: AppColors.blackColor)
          ],
        );
      })),
    );
  }
}
