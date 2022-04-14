import 'package:auction/ApiServices/api_services.dart';
import 'package:auction/controllers_providers/Auth/auth_provider.dart';
import 'package:auction/models/GetCoupon/GetCouponComments.dart';
import 'package:auction/models/GetCoupon/coupon_comment_rating.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

CommentByCoupon commentByCouponProvider =
    Provider.of<CommentByCoupon>(Get.context!, listen: false);

class CommentByCoupon extends ChangeNotifier {
  bool loaded = false;
  GetCouponComments? getCouponComments;
  GetCouponCommentsRating? getCouponCommentsRating;

  String? comment;

  void getComments(String couponId) async {
    String body = await ApiServices.simpleGet("Coupon/comments-by-coupon?couponId=$couponId");
    print(body);

    getCouponComments = null;
    loaded = true;
    notifyListeners();
    if (body.isEmpty) return;

    await Future.delayed(Duration.zero);
    getCouponComments = getCouponCommentsFromJson(body);
    loaded = true;
    notifyListeners();
  }

  Future<void> postComment(String couponID) async {
    Map<String, String> commentBody = {
      "comment": comment!,
      "userId": getUser().result!.id.toString(),
      "couponId": couponID
    };

    print(commentBody);
    String body = await ApiServices.simplePostWithBody(
        "Coupon/add-coupon-comments", commentBody);
    if (body.isEmpty) return showToast(msg: "Something Went Wrong");

    logger.i(body);
  }

  void getCommentRating(String couponID) async {
    String body = await ApiServices.simpleGet(
        "Coupon/rating-by-coupon?couponId=$couponID");

    getCouponCommentsRating = getCouponCommentsRatingFromJson(body);
    if (body.isEmpty) return;
  }

  void postCommentRating(String couponID) async {
    Map<String, String> response = {
      "rating": "3.0",
      "userId": getUser().result!.id.toString(),
      "couponId": couponID
    };

    String body = await ApiServices.simplePostWithBody(
        "Coupon/add-coupon-rating", response);

    if (body.isEmpty) return showToast(msg: "Something went wrong");
  }
}
