import 'package:auction/ApiServices/api_services.dart';
import 'package:auction/controllers_providers/Auth/auth_provider.dart';
import 'package:auction/models/Cart/get_cart.dart' as get_cart_result;
import 'package:auction/models/GetCoupon/getCoupons.dart';
import 'package:auction/models/GetCoupon/getRevealedCoupons.dart' as revealedCoupon;
import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:auction/views/payment_method_screens/web_view_screen.dart';
import 'package:auction/views/wallet/wallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

CouponProvider couponProvider =
    Provider.of<CouponProvider>(Get.context!, listen: false);

class CouponProvider extends ChangeNotifier {
  int couponQuantity = 1;
  GetCoupon? getCoupon;
  get_cart_result.GetCart? getCart;
  bool couponLoaded = false;
  bool cartLoaded = false;
  dynamic couponTotalPrice = 0;
  dynamic averageDiscount = 0;

  int increaseCouponValue(int index) {
    couponQuantity++;
    notifyListeners();
    return couponQuantity;
  }

  int decreaseCouponValue(int index) {
    if (couponQuantity > 1) {
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

  Future<void> purchaseCouponCode(Result result) async {
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

      return;
    }
  }

  Future<void> purchaseAllCouponCodeFromCart() async {
    showProgressCircular();

    if (couponTotalPrice != 0) {
      await walletProvider.getWallet();

      if (walletProvider.walletModel != null &&
          walletProvider.walletModel!.result.amount >= couponTotalPrice) {
        /// goto direct purchase
        print(
            "goto direct purchase ${walletProvider.walletModel!.result.amount}");

        for (int i = 0; i < getCart!.result.length; i++) {
          _purchaseCouponCodeNow(Result.fromJson(getCart!.result[i].toJson()),
              getCart!.result[i].quantity * getCart!.result[i].coupon.price);
        }
      } else {
        /// go to web-view here
        print("goto direct purchase");
        var resultBool = await Get.to(() => PaymentWebView(
            initUrl:
                "https://auction.cp.deeps.info/Home/Payment?userId=${getUser().result!.id}&amount=${double.parse((couponTotalPrice * 100).toString()).toInt()}"));
        if (resultBool == true) {
          for (int i = 0; i < getCart!.result.length; i++) {
            _purchaseCouponCodeNow(Result.fromJson(getCart!.result[i].toJson()),
                getCart!.result[i].quantity * getCart!.result[i].coupon.price);
          }
        }
      }
    }
    getCart = null;
    cartLoaded = false;
    couponTotalPrice = 0;
    averageDiscount = 0;

    notifyListeners();
  }

  void _purchaseCouponCodeNow(
    Result result,
    double totalPrice,
  ) async {
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
      showToast(msg: "Coupon Code Purchased");
    }
    print(body);
  }

  void getCartByUser() async {
    String body =
        await ApiServices.simpleGet("Cart/cart?userId=${getUser().result!.id}");
    if (body.isEmpty) return showToast(msg: "Something went wrong");
    getCart = get_cart_result.getCartFromJson(body);
    cartLoaded = true;
    couponTotalPrice = 0;
    averageDiscount = 0;
    try {
      if (getCart != null) {
        getCart!.result.forEach((element) {
          if (!element.coupon.couponDiscount.contains("RT40R33")) {
            averageDiscount = averageDiscount + int.parse(element.coupon.couponDiscount.toString());
          }
          couponTotalPrice = couponTotalPrice + element.quantity * element.coupon.price;
        });
      }
      // result.quantity * result.coupon.price).toInt()

    } catch (e) {
      print(e);
    }

    notifyListeners();
  }

  Future<dynamic> addCartByUser(String couponID) async {
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

    return true;
  }

  void updateCartByUser(String couponID, int quantity) async {
    showProgressCircular();
    String body = await ApiServices.simplePost(
        "Cart/Update-cart?couponId=$couponID&UserId=${getUser().result!.id}&Quantity=$quantity");

    if (body.isEmpty) {
      showToast(msg: "Something went wrong");
    }

    if (body.contains("POST Request successful")) {
      showToast(msg: 'successful updated');
    }
    getCartByUser();
    stopProgressCircular();
  }

  Future<void> deleteCartItemByUser(String couponId) async {
    String body = await ApiServices.simplePost(
        "Cart/Delete-cart?userId=${getUser().result!.id}&CouponId=$couponId");
    if (body.isEmpty) {
      showToast(msg: "Something went wrong");
    }

    if (body.contains("POST Request successful")) {
      showToast(msg: 'successful updated');
    }
    getCartByUser();
    return;
  }

  Future<dynamic> clearCart() async {
    String body = await ApiServices.simplePost(
        "Cart/Delete-all-cart?userId=${getUser().result!.id}");
  }

  revealedCoupon.GetRevealedCoupons? getRevealedCoupon;

  void getRevealedCoupons() async {
    var body = await ApiServices.simpleGet("Coupon/Coupon-Code?id=${getUser().result!.id}",isBytesRequired: true);
    print(body);

    if (body.isEmpty) {
      showToast(msg: "Something went wrong");
      return;
    }

    // if (body.contains("successful")) {
      getRevealedCoupon = null;
      notifyListeners();
      await Future.delayed(Duration.zero);
      getRevealedCoupon = revealedCoupon.getRevealedCouponsFromJson(body);
      notifyListeners();
    // }
  }
}
