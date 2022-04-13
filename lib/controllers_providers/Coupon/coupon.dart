import 'package:auction/api_services.dart';
import 'package:auction/controllers_providers/auth_provider.dart';
import 'package:auction/models/GetCoupon/getCoupons.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

CouponProvider couponProvider =
    Provider.of<CouponProvider>(Get.context!, listen: false);

class CouponProvider extends ChangeNotifier {
  int couponValue = 1;
  GetCoupon? getCoupon;
 bool couponLoaded=false;

  void addValue() {
    couponValue++;
    notifyListeners();
  }
  void couponRemove() {
    if (couponValue > 1) {
      couponValue--;
    }

    notifyListeners();
  }

  void getCoupons()async{
   String body=await ApiServices.simpleGet("Coupon");

   if(body.isEmpty)return logger.i(body);
   getCoupon=getCouponFromJson(body);
   logger.i(body);
   couponLoaded=true;
  notifyListeners();

  }


}
