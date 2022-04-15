import 'package:auction/ApiServices/api_services.dart';
import 'package:auction/controllers_providers/Auth/auth_provider.dart';
import 'package:auction/models/Cart/get_cart.dart' as get_cart_result;
import 'package:auction/models/GetCoupon/getCoupons.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:auction/views/payment_method_screens/web_view_screen.dart';
import 'package:auction/views/wallet/wallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

CouponProvider couponProvider =
    Provider.of<CouponProvider>(Get.context!, listen: false);

class CouponProvider extends ChangeNotifier {
  int couponQuantity =1;
  GetCoupon? getCoupon;
  get_cart_result.GetCart? getCart;
  bool couponLoaded = false;
  bool cartLoaded = false;

  int increaseCouponValue(int index) {
    couponQuantity=getCart!.result[index].quantity;

    couponQuantity++;
    notifyListeners();
    return couponQuantity;
  }

  int decreaseCouponValue(int index) {
    if (couponQuantity > 1) {
      couponQuantity=getCart!.result[index].quantity;

      couponQuantity--;
    }
    notifyListeners();
    return couponQuantity;
  }

  void getCoupons() async {
    String body = await ApiServices.simpleGet("Coupon");

    if (body.isEmpty) return logger.i(body);
    getCoupon = getCouponFromJson(body);

    couponLoaded = true;
    notifyListeners();
  }

  void purchaseCouponCode(Result result) async {
    if (result.price != null) {
      double totalPrice =
          double.parse(result.price.toString()) * couponQuantity;

      showProgressCircular();
      await walletProvider.getWallet();
      stopProgressCircular();
      if (walletProvider.walletModel != null &&
          walletProvider.walletModel!.result.amount >= totalPrice) {
        /// goto direct purchase
        print(
            "goto direct purchase ${walletProvider.walletModel!.result.amount}");
        _purchaseCouponCodeNow(result, totalPrice);
      } else {
        /// go to web-view here
        print("goto direct purchase");
        var resultBool = await Get.to(() => PaymentWebView(
            initUrl:
                "https://auction.cp.deeps.info/Home/Payment?userId=${getUser().result!.id}&amount=${double.parse((totalPrice * 100).toString()).toInt()}"));
        if (resultBool == true) {
          _purchaseCouponCodeNow(result, totalPrice);
        }
      }
    }
  }

  void _purchaseCouponCodeNow(
    Result result,
    double totalPrice,
  ) async {
    showProgressCircular();
    String body =
        await ApiServices.simplePostWithBody(ApiServices.PURCHASE_A_COUPON, {
      // "created": "2022-04-14T19:17:40.282Z",
      // "couponCodeId": 0
      "amount": totalPrice.toInt().toString(),
      "quantity": couponQuantity.toString(),
      "userId": getUser().result!.id.toString(),
      "couponId": result.id.toString(),
    });
    stopProgressCircular();
    if (body.contains("successful")) {
      Get.back();
      Get.back();
      showToast(msg: "Coupon Code Purchased");
    }
    print(body);
  }

  void getCartByUser() async {
    String body =
        await ApiServices.simpleGet("Cart/cart?userId=${getUser().result!.id}");
    if (body.isEmpty) return showToast(msg: "Something went wrong");
    logger.i(body);

    getCart = get_cart_result.getCartFromJson(body);
    cartLoaded = true;
    notifyListeners();
  }

  void addCartByUser(String couponID) async {
    Map<String, String> body = {
      "userId": getUser().result!.id.toString(),
      "couponId": couponID,
      "quantity": couponQuantity.toString()
    };

    String response =
        await ApiServices.simplePostWithBody("Cart/add-cart", body);
    if (response.isEmpty) return showToast(msg: "Something went Wrong");
    if (response.contains("Added successfully")) {
      showToast(msg: "Added successfully");
    }
  }

  void updateCartByUser(String couponID, int quantity ) async {
    showProgressCircular();
    String body = await ApiServices.simplePost(
        "Cart/Update-cart?couponId=$couponID&UserId=${getUser().result!.id}&Quantity=$quantity");
    
    if(body.isEmpty) {
    showToast(msg: "Something went wrong");
    }

    
    if(body.contains("POST Request successful")){
      showToast(msg: 'successful updated');
    }
    getCartByUser();
    stopProgressCircular();



  }
}
