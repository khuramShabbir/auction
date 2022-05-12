import 'package:auction/ApiServices/api_services.dart';
import 'package:auction/models/shipment/GetAllInsuranceCompanies.dart';
import 'package:auction/models/shipment/GetAllShippingCompanies.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

ShipmentProvider shipmentProvider =
    Provider.of<ShipmentProvider>(Get.context!, listen: false);

class ShipmentProvider extends ChangeNotifier {
  GetAllShippingCompanies? getAllShippingCompanies;

  void getShippingCompanies() async {
    String body =
        await ApiServices.simpleGet(ApiServices.GET_ALL_SHIPPING_COMPANIES);
    print(body);
    if (body.isNotEmpty) {
      getAllShippingCompanies = null;
      notifyListeners();
      getAllShippingCompanies = getAllShippingCompaniesFromJson(body);
      notifyListeners();
    }
  }

  GetAllInsuranceCompanies? getAllInsuranceCompanies;

  void getInsuranceCompanies() async {
    String body =
        await ApiServices.simpleGet(ApiServices.GET_ALL_INSURANCE_COMPANIES);
    if (body.isNotEmpty) {
      getAllInsuranceCompanies = null;
      notifyListeners();
      getAllInsuranceCompanies = getAllInsuranceCompaniesFromJson(body);
      notifyListeners();
    }
  }

  void bookAShipment(int insuranceID, int shippingID, int carID, dynamic total) async {
    String body = await ApiServices.simplePost(ApiServices.BOOK_A_SHIPMENT +"userId=${getUser()!.result!.id}&carId=$carID&InsuranceId=$insuranceID&ShipperId=$shippingID&Total=$total");
    if (body.isNotEmpty && body.contains("successful")) {
      showToast(msg: "Shipment Booked Successful");
    }
  }
}
