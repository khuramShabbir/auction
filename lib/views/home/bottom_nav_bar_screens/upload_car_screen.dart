import 'dart:io';

import 'package:auction/controllers_providers/auth_provider.dart';
import 'package:auction/controllers_providers/normalSale/normalSaleProvider.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UploadCarScreen extends StatefulWidget {
  const UploadCarScreen({Key? key}) : super(key: key);

  @override
  State<UploadCarScreen> createState() => _UploadCarScreenState();
}

class _UploadCarScreenState extends State<UploadCarScreen> {

  final formKey = GlobalKey<FormState>();

  final picker = ImagePicker();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    normalSaleProvider.getAllCarSpecs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(title: "Add Car"),
      body: StaticKPadding.kPadding(
          child: SingleChildScrollView(
        reverse: true,
        child: Consumer<NormalSaleProvider>(builder: (builder, data, child) {
          return Form(
            key: formKey,
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                        child: customTextFormField(
                            inputType: TextInputType.number,
                            controller: data.priceController,
                            validator: (v) {
                              if (v!.isEmpty) {
                                return "Invalid Information";
                              }
                              return null;
                            },
                            isOutLinedBorder: true,
                            hintText: "Price",
                            borderColor: Colors.grey)),
                    WhiteSpacer.horizontalSpace(10),
                    Expanded(
                        child: customTextFormField(
                            inputType: TextInputType.number,
                            controller: data.discountedPRiceController,
                            validator: (v) {
                              if (v!.isEmpty) {
                                return "Invalid Information";
                              }
                              return null;
                            },
                            isOutLinedBorder: true,
                            borderColor: Colors.grey,
                            hintText: "Discounted Price")),
                  ],
                ),
                WhiteSpacer.horizontalSpace(10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                        child: customTextFormField(
                            inputType: TextInputType.number,
                            controller: data.passengerController,

                            validator: (v) {
                              if (v!.isEmpty) {
                                return "Invalid Information";
                              }
                              return null;
                            },
                            isOutLinedBorder: true,
                            hintText: "Passengers",
                            borderColor: Colors.grey)),
                    WhiteSpacer.horizontalSpace(10),
                    Expanded(
                        child: customTextFormField(
                            inputType: TextInputType.number,
                            controller: data.doorsController,
                            validator: (v) {
                              if (v!.isEmpty) {
                                return "Invalid Information";
                              }
                              return null;
                            },
                            isOutLinedBorder: true,
                            hintText: "Doors",
                            borderColor: Colors.grey)),
                  ],
                ),
                WhiteSpacer.horizontalSpace(10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                        child: customTextFormField(
                            inputType: TextInputType.number,
                            controller: data.feulTankController,
                            validator: (v) {
                              if (v!.isEmpty) {
                                return "Invalid Information";
                              }
                              return null;
                            },
                            isOutLinedBorder: true,
                            hintText: "Fuel Tank",
                            borderColor: Colors.grey)),
                    WhiteSpacer.horizontalSpace(10),
                    Expanded(
                        child: customTextFormField(
                            inputType: TextInputType.number,
                            controller: data.millageController,
                            validator: (v) {
                              if (v!.isEmpty) {
                                return "Invalid Information";
                              }
                              return null;
                            },
                            isOutLinedBorder: true,
                            hintText: "Millage",
                            borderColor: Colors.grey)),
                  ],
                ),
                WhiteSpacer.horizontalSpace(10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                        child: customTextFormField(
                            inputType: TextInputType.number,
                            controller: data.maxPowerController,
                            validator: (v) {
                              if (v!.isEmpty) {
                                return "Invalid Information";
                              }
                              return null;
                            },
                            isOutLinedBorder: true,
                            hintText: "Max Power",
                            borderColor: Colors.grey)),
                    WhiteSpacer.horizontalSpace(10),
                    Expanded(
                        child: customTextFormField(
                            inputType: TextInputType.number,
                            controller: data.maxSpeedController,
                            validator: (v) {
                              if (v!.isEmpty) {
                                return "Invalid Information";
                              }
                              return null;
                            },
                            isOutLinedBorder: true,
                            hintText: "Max Speed",
                            borderColor: Colors.grey)),
                  ],
                ),
                WhiteSpacer.horizontalSpace(10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                        child: customTextFormField(
                            controller: data.plateNumbrController,
                            validator: (v) {
                              if (v!.isEmpty) {
                                return "Invalid Information";
                              }
                              return null;
                            },
                            isOutLinedBorder: true,
                            hintText: "Plate",
                            borderColor: Colors.grey)),
                    WhiteSpacer.horizontalSpace(10),
                    Expanded(
                        child: customTextFormField(
                            controller: data.chassisController,
                            validator: (v) {
                              if (v!.isEmpty) {
                                return "Invalid Information";
                              }
                              return null;
                            },
                            isOutLinedBorder: true,
                            hintText: "Chassis",
                            borderColor: Colors.grey)),
                  ],
                ),
                WhiteSpacer.horizontalSpace(10),

                /// Check Box
                ///
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                              value: data.isBluetooth,
                              onChanged: (v) {
                                data.isBluetooth = v!;
                                setState(() {});
                              },
                              checkColor: StaticColors.orangeColor,
                              activeColor: StaticColors.orangeColor),
                          Text(
                            "Bluetooth",
                            style: StaticTextStyles.normalBlackTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                              value: data.isGPS,
                              onChanged: (v) {
                                data.isGPS = v!;
                                setState(() {});
                              },
                              checkColor: StaticColors.orangeColor,
                              activeColor: StaticColors.orangeColor),
                          Text(
                            "GPS",
                            style: StaticTextStyles.normalBlackTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                WhiteSpacer.horizontalSpace(20),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                              value: data.isSnowTiers,
                              onChanged: (v) {
                                data.isSnowTiers = v!;
                                setState(() {});
                              },
                              checkColor: StaticColors.orangeColor,
                              activeColor: StaticColors.orangeColor),
                          Text(
                            "Snow Tiers",
                            style: StaticTextStyles.normalBlackTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                              value: data.isManual,
                              onChanged: (v) {
                                data.isManual = v!;
                                setState(() {});
                              },
                              checkColor: StaticColors.orangeColor,
                              activeColor: StaticColors.orangeColor),
                          Text(
                            "Manual",
                            style: StaticTextStyles.normalBlackTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                WhiteSpacer.horizontalSpace(20),
                data.allCarsSpecs != null
                    ? Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownButton(
                                    isExpanded: true,
                                    hint: Text(data.compannName),
                                    items: data.allCarsSpecs!.result!.companies!
                                        .map((value) {
                                      return DropdownMenuItem<String>(
                                        value: value.id.toString(),
                                        child: Text(
                                          value.name ?? "",
                                          style: const TextStyle(color: Colors.black),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (v) {
                                      setState(() {
                                        var where = data
                                            .allCarsSpecs!.result!.companies!
                                            .where((element) =>
                                                element.id.toString() ==
                                                v.toString());
                                        if (where.isNotEmpty) {
                                          data.compannName = where.first.name!;
                                          data.companyId = where.first.id!;
                                        }
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownButton(
                                    isExpanded: true,
                                    hint: Text(data.colorName),
                                    items: data.allCarsSpecs!.result!.colors!
                                        .map((value) {
                                      return DropdownMenuItem<String>(
                                        value: value.id.toString(),
                                        child: Text(value.name ?? ""),
                                      );
                                    }).toList(),
                                    onChanged: (v) {
                                      var where = data
                                          .allCarsSpecs!.result!.colors!
                                          .where((element) =>
                                              element.id.toString() ==
                                              v.toString());
                                      if (where.isNotEmpty) {
                                        data.colorName = where.first.name!;
                                        data.colorId = where.first.id!;
                                      }
                                      // data.colorName = v.toString();
                                      setState(() {});
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          WhiteSpacer.horizontalSpace(20),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownButton(
                                    isExpanded: true,
                                    hint: Text(data.carModelYearName),
                                    items: data.allCarsSpecs!.result!.models!
                                        .map((value) {
                                      return DropdownMenuItem<String>(
                                        value: value.id.toString(),
                                        child: Text(value.name ?? ""),
                                      );
                                    }).toList(),
                                    onChanged: (v) {
                                      setState(() {
                                        var where = data
                                            .allCarsSpecs!.result!.models!
                                            .where((element) =>
                                                element.id.toString() ==
                                                v.toString());
                                        if (where.isNotEmpty) {
                                          data.carModelYearName =
                                              where.first.name!;
                                          data.carModelYearId = where.first.id!;
                                        }
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownButton(
                                    isExpanded: true,
                                    hint: Text(data.carTypeName),
                                    items: data.allCarsSpecs!.result!.types!
                                        .map((value) {
                                      return DropdownMenuItem<String>(
                                        value: value.carTypeId.toString(),
                                        child: Text(value.typeName ?? ""),
                                      );
                                    }).toList(),
                                    onChanged: (v) {
                                      var where = data
                                          .allCarsSpecs!.result!.types!
                                          .where((element) =>
                                              element.carTypeId.toString() ==
                                              v.toString());
                                      if (where.isNotEmpty) {
                                        data.carTypeName = where.first.typeName!;
                                        data.cartypeId = where.first.carTypeId!;
                                      }

                                      setState(() {});
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          WhiteSpacer.verticalSpace(10),
                        ],
                      )
                    : Container(),
                WhiteSpacer.horizontalSpace(20),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () async {
                            Get.bottomSheet(uploadphotosbottomSheet());

                          },
                          child: Text("Upload Pictures",
                              style: TextStyle(
                                  color: StaticColors.blueColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  decoration: TextDecoration.underline))),

                    ]),
                WhiteSpacer.verticalSpace(20),
                SizedBox(
                  height: normalSaleProvider.imagesList.isNotEmpty ? height * .15 : 0,
                  child: normalSaleProvider.imagesList.isNotEmpty
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: normalSaleProvider.imagesList.length,
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
                                              image: FileImage(normalSaleProvider.imagesList[index]),
                                              fit: BoxFit.fill)),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        normalSaleProvider.imagesList.removeAt(index);
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
                        )
                      : null,
                ),

                WhiteSpacer.verticalSpace(30),

                /// Description
                Container(
                    height: height * .2,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: StaticColors.greyColor.withOpacity(.5)),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextField(
                        controller: data.descriptionController,
                        maxLines: null,
                        maxLength: null,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Description',
                            hintStyle: StaticTextStyles.normalGreyTextStyle),
                      ),
                    )),
                WhiteSpacer.horizontalSpace(35),

                extendedButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        data.submitCar();
                      }
                    },
                    buttonColor: StaticColors.orangeColor,
                    textColor: StaticColors.whiteColor,
                    buttonText: "Submit"),
                WhiteSpacer.horizontalSpace(35),
              ],
            ),
          );
        }),
      )),
    );
  }

  Widget uploadphotosbottomSheet() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _imgFromCamera();
                      },
                      child: Container(
                        width: Get.width,
                        child: Center(
                          child: Text(
                            'Open Camera'.tr,
                            style: const TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 0.5,
                    width: Get.width,
                    color: Colors.grey,
                  ),
                  Expanded(
                    child: InkWell(
                        onTap: () {
                          _imgFromGallery();
                        },
                        child: Container(
                          width: Get.width,
                          child: Center(
                            child: Text(
                              'Photo Roll'.tr,
                              style: const TextStyle(color: Colors.blue),
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: (){
                Get.back();
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(15)),
                alignment: Alignment.center,
                child: Text(
                  'Cancel'.tr,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 18)
          ],
        ),
      ),
    );
  }

  _imgFromCamera() async {
    Get.back();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      normalSaleProvider.setSelectedImage(pickedFile);
    }
  }

  _imgFromGallery() async {
    Get.back();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      normalSaleProvider.setSelectedImage(pickedFile);
    }
  }

}
