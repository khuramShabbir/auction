import 'package:auction/ApiServices/api_services.dart';
import 'package:auction/controllers_providers/Auth/auth_provider.dart';
import 'package:auction/models/GetCoupon/getCoupons.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:auction/views/payment_method_screens/web_view_screen.dart';
import 'package:auction/views/wallet/wallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

CouponProvider couponProvider = Provider.of<CouponProvider>(Get.context!, listen: false);

class CouponProvider extends ChangeNotifier {
  int couponQuantity = 1;
  GetCoupon? getCoupon;
  bool couponLoaded = false;

  void addValue() {
    couponQuantity++;
    notifyListeners();
  }

  void couponRemove() {
    if (couponQuantity > 1) {
      couponQuantity--;
    }

    notifyListeners();
  }

  void getCoupons() async {
    String body = await ApiServices.simpleGet("Coupon");

    if (body.isEmpty) return logger.i(body);
    getCoupon = getCouponFromJson(body);
    // logger.i(body);
    couponLoaded = true;
    notifyListeners();
  }

  void purchaseCouponCode(Result result) async {
    if(result.price!=null){
      double totalPrice = double.parse(result.price.toString()) * couponQuantity;

      showProgressCircular();
      await walletProvider.getWallet();
      stopProgressCircular();
      if (walletProvider.walletModel != null && walletProvider.walletModel!.result.amount>=totalPrice) {
        /// goto direct purchase
        print("goto direct purchase ${walletProvider.walletModel!.result.amount}");
        _purchaseCouponCodeNow(result,totalPrice);
      }
      else{
        /// go to web-view here
        print("goto direct purchase");
        var resultBool= await Get.to(() => PaymentWebView(initUrl: "https://auction.cp.deeps.info/Home/Payment?userId=${getUser().result!.id}&amount=${double.parse((totalPrice*100).toString()).toInt()}"));
        if(resultBool==true){
          _purchaseCouponCodeNow(result,totalPrice);
        }

      }
    }
  }
  void _purchaseCouponCodeNow(Result result, double totalPrice,)async{
    showProgressCircular();
    String body= await ApiServices.simplePostWithBody(ApiServices.PURCHASE_A_COUPON,{
      // "created": "2022-04-14T19:17:40.282Z",
      // "couponCodeId": 0
      "amount": totalPrice.toInt().toString(),
      "quantity": couponQuantity.toString(),
      "userId": getUser().result!.id.toString(),
      "couponId": result.id.toString(),
    });
    stopProgressCircular();
    if(body.contains("successful")){
      Get.back();
      Get.back();
      showToast(msg: "Coupon Code Purchased");
    }
    print(body);

  }



}
