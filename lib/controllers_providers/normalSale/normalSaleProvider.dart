import 'dart:io';

import 'package:auction/ApiServices/api_services.dart';
import 'package:auction/controllers_providers/Auth/auth_provider.dart';
import 'package:auction/models/AllCars/AllCarsSpecs.dart';
import 'package:auction/models/AllCars/all_cars_model.dart';
import 'package:auction/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_platform_interface/src/types/picked_file/unsupported.dart';
import 'package:provider/provider.dart';

import '../../utils/widgets.dart';
var normalSaleProvider=Provider.of<NormalSaleProvider>(Get.context!,listen: false);
class NormalSaleProvider extends ChangeNotifier{



  AllCarsModel? allCarsModel;
  bool isCarsLoaded=false;


  bool isBluetooth = false;
  bool isGPS = false;
  bool isSnowTiers = false;
  bool isManual = false;

  int companyId=-1;
  int colorId=-1;
  int cartypeId=-1;
  int carModelYearId=-1;

  String compannName="Comapny";

  String colorName="Color";

  String carModelYearName="Model";

  String carTypeName="Type";


  List<File> imagesList=[];

  TextEditingController priceController=TextEditingController();
  TextEditingController discountedPRiceController=TextEditingController();
  TextEditingController passengerController=TextEditingController();
  TextEditingController doorsController=TextEditingController();
  TextEditingController feulTankController=TextEditingController();
  TextEditingController millageController=TextEditingController();
  TextEditingController maxPowerController=TextEditingController();
  TextEditingController maxSpeedController=TextEditingController();
  TextEditingController plateNumbrController=TextEditingController();
  TextEditingController chassisController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();


  void getAllCars() async {
   String body=await ApiServices.simpleGet(ApiServices.ALL_CAR_SALES);
   if(body.isEmpty)return ;

   allCarsModel= allCarsModelFromJson(body);
   isCarsLoaded=true;
   notifyListeners();
  }

  void getMyUploadedCars()async {
    String body=await ApiServices.simpleGet('CarSales/get-cars-by-user?userId=44');
    allCarsModel= allCarsModelFromJson(body);
    isCarsLoaded=true;
    notifyListeners();

  }
  AllCarsSpecs? allCarsSpecs;
  void getAllCarSpecs() async {
    
    String body =await ApiServices.simpleGet(ApiServices.ALL_CAR_SPECS);
    if(body.isEmpty) return;
    allCarsSpecs=allCarsSpecsFromJson(body);
    notifyListeners();

  }

  void submitCar()async {
    print(cartypeId);
    print(carModelYearId);
    print(colorId);
    print(companyId);
    print(imagesList);

    if(cartypeId==-1 || carModelYearId==-1 || colorId==-1 || companyId==-1 || imagesList.isEmpty){
      return;
    }

    Map<String, String> body={
      "userId":"${getUser().result!.id}",
      "MakeCompanyId":"$companyId",
      "Model":"$carModelYearId",
      "TypeId":"$cartypeId",
      "YearId":"$carModelYearId",
      "ColorId":"$colorId",
      "Plate":"${plateNumbrController.text}",
      "Milleage":"${millageController.text}",
      "Chassis":"${chassisController.text}",
      "Price":"${priceController.text}",
      "DiscountedPrice":"${discountedPRiceController.text}",
      "SerialNo":"",
      "IsGPS":"$isGPS",
      "IsBluetooth":"$isBluetooth",
      "IsSnowTires":"$isSnowTiers",
      "IsManual":"$isManual",
      "Doors":"${doorsController.text}",
      "Passengers":"${passengerController.text}",
      "FuelTank":"${feulTankController.text}",
      "MaxSpeed":"${maxSpeedController.text}",
      "MaxPower":"${maxPowerController.text}",
      "Description":"${descriptionController.text}"
    };
    print(body);
    showProgressCircular();

    String response = await ApiServices.postMultiPartWithFile(ApiServices.ADD_A_CAR_NORMAL_PURCHASE, imagesList,pathName: "Pictures",body: body);
    stopProgressCircular();
    imagesList.clear();
    getAllCars();
    getMyUploadedCars();
    Get.back();

  }

  void setSelectedImage(pickedFile) {

    imagesList.add(File(pickedFile.path));
    notifyListeners();

  }

}