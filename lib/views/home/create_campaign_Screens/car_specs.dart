import 'package:auction/controllers_providers/Comments/comments_by_cars.dart';
import 'package:auction/controllers_providers/Auth/auth_provider.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/AllCars/all_cars_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get_time_ago/get_time_ago.dart';

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

  int imageIndex = 0;
  final formKey = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    commentProvider.commentsByCars = null;
    commentProvider.isLoaded = false;
    commentProvider.getComments(result!.carSaleId);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CommentProvider>(
      builder: (BuildContext context, data, Widget? child) {
        // logger.i(data.isLoaded);
        return Scaffold(
            appBar: CustomAppBar.appBar(title: result!.model ?? ""),
            body: StaticKPadding.kPadding(
                child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: height * .28,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://auction.api.deeps.info/${result!.pictures![imageIndex]}"),
                              fit: BoxFit.fill)),
                    ),
                    WhiteSpacer.verticalSpace(10),
                    SizedBox(
                      height: 65,
                      child: ListView.builder(
                        itemCount: result!.pictures!.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  imageIndex = index;
                                  setState(() {});
                                },
                                child: Container(
                                  width: 85,
                                  height: 85,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://auction.api.deeps.info/${result!.pictures![index]}"),
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
                    Text("Event By", style: AppTextStyles.subTitleStyleBlack),
                    WhiteSpacer.verticalSpace(10),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                  image: NetworkImage(imageUrl),
                                  fit: BoxFit.fill)),
                        ),
                        WhiteSpacer.horizontalSpace(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${result!.user!.name}",
                                style: AppTextStyles.subTitleStyleBlack),
                            // Text("${result!.user!.created}",
                            //     style: AppTextStyles.normalGreyTextStyle),
                          ],
                        ),
                        const Expanded(child: SizedBox()),
                        InkWell(
                          onTap: () {
                            launch("tel://${result!.user!.phoneNumber}");
                          },
                          child: CircleAvatar(
                              backgroundColor: AppColors.blueColor,
                              radius: 20,
                              child: Icon(Icons.phone,
                                  color: AppColors.whiteColor)),
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
                    Text("Specifications",
                        style: AppTextStyles.subTitleStyleBlack),
                    WhiteSpacer.verticalSpace(10),
                    SizedBox(
                      width: width,
                      height: height * .1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          carFeatures(
                              title: "Color", value: result!.color ?? 'NA'),
                          carFeatures(
                              title: "Max Power",
                              value: result!.maxPower ?? 'NA',
                              icon:
                                  Image.asset("assets/PngAssets/maxspeed.png")),
                          carFeatures(
                              title: "Max Speed",
                              value: result!.maxSpeed ?? 'NA',
                              icon:
                                  Image.asset("assets/PngAssets/maxspeed.png")),
                          carFeatures(
                              title: "Fuel Tank",
                              value: result!.fuelTank ?? 'NA',
                              icon: Image.asset("assets/PngAssets/Petrol.png")),
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
                          carFeatures(
                              title: "Year", value: result!.year ?? 'NA'),
                          carFeatures(
                              title: "Milleage",
                              value: result!.milleage ?? 'NA',
                              icon:
                                  Image.asset("assets/PngAssets/millage.png")),
                          carFeatures(
                              title: "Serial No",
                              value: result!.serialNo ?? "NA"),
                          carFeatures(
                              title: "Plate", value: result!.plate ?? "NA"),
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
                          carFeatures(
                              title: "chassis", value: result!.chassis ?? 'NA'),
                        ],
                      ),
                    ),
                    WhiteSpacer.verticalSpace(20),
                    Text("Car Feature",
                        style: AppTextStyles.subTitleStyleBlack),
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
                                      Text(
                                          "${result!.passengers ?? ''} Passengers",
                                          style: AppTextStyles
                                              .normalBlackTextStyle),
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
                                          style: AppTextStyles
                                              .normalBlackTextStyle),
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
                                          style: AppTextStyles
                                              .normalBlackTextStyle),
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
                                          style: AppTextStyles
                                              .normalBlackTextStyle),
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
                                          style: AppTextStyles
                                              .normalBlackTextStyle),
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
                                      Text(
                                          result!.isManual!
                                              ? "Manual"
                                              : "Automatic",
                                          style: AppTextStyles
                                              .normalBlackTextStyle),
                                    ],
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                    WhiteSpacer.verticalSpace(30),
                    Text("Information",
                        style: AppTextStyles.subTitleStyleBlack),
                    WhiteSpacer.verticalSpace(10),
                    Text(
                      result!.description!,
                      style: TextStyle(color: Colors.grey,fontSize: 16),
                    ),
                    WhiteSpacer.verticalSpace(20),
                    data.commentsByCars == null
                        ? Container()
                        : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:
                                commentProvider.commentsByCars!.result.length,
                            itemBuilder: (BuildContext context, int index) {
                              var data =
                                  commentProvider.commentsByCars!.result[index];
                              String timestamp = data.commentDate
                                  .toString(); // [DateTime] formatted as String.
                              DateTime convertedTimestamp = DateTime.parse(
                                  timestamp); // Converting into [DateTime] object
                              var timeResult =
                                  GetTimeAgo.parse(convertedTimestamp);

                              return commentSection(
                                  name: data.username,
                                  imageUrl: imageUrl,
                                  comment: data.comment,
                                  time: timeResult);
                            },
                          ),
                    WhiteSpacer.verticalSpace(20),
                    customTextFormField(
                        borderColor: AppColors.greyColor,
                        controller: textEditingController,
                        isOutLinedBorder: true,
                        hintText: "Post your Comment",
                        validator: (v) {
                          if (v!.isEmpty) return "Enter something";
                          return null;
                        },
                        onChange: (v) {
                          commentProvider.commentText = v;
                        }),
                    WhiteSpacer.verticalSpace(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        customizedButton(
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                               await  commentProvider.postComment(result!.carSaleId.toString());
                                textEditingController.clear();
                              }
                            },
                            textColor: AppColors.whiteColor,
                            buttonColor: AppColors.blueColor,
                            buttonText: "Post",
                            radius: 20,
                            buttonWidth: .85),
                      ],
                    ),
                    WhiteSpacer.verticalSpace(20),
                  ],
                ),
              ),
            )));
      },
    );
  }
}

Widget commentSection(
    {required String name,
    required String imageUrl,
    required String comment,
    required String time}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          CircleAvatar(radius: 25, backgroundImage: NetworkImage(imageUrl)),
          WhiteSpacer.horizontalSpace(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTextStyles.subTitleStyleBlack,
                ),
                SizedBox(height: 5,),
                Row(children: [
                  Expanded(
                    child: Text(
                      comment,
                      style: TextStyle(color: Colors.grey,fontSize: 16),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        time,
                        style: AppTextStyles.normalBlackTextStyle,
                      ),
                    ],
                  )
                ],)
              ],
            ),
          ),

        ],
      ),


    ]),
  );
}

Widget carFeatures(
    {required title, required value, Widget icon = const Text("")}) {
  return Container(
    constraints: BoxConstraints(minWidth: width * .21),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border:
            Border.all(color: AppColors.greyColor.withOpacity(.5), width: 2)),
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            icon,
            const Expanded(child: SizedBox()),
            Text(title, style: AppTextStyles.normalGreyTextStyle),
            Text(value,
                style: TextStyle(color: AppColors.blackColor, fontSize: 13)),
          ]),
    ),
  );
}
