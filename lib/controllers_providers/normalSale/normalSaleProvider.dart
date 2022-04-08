import 'package:auction/api_services.dart';
import 'package:auction/models/AllCars/AllCarsSpecs.dart';
import 'package:auction/models/AllCars/all_cars_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
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

    if(cartypeId==1 || carModelYearId==-1 || colorId==-1 || companyId==-1){}


  }

}