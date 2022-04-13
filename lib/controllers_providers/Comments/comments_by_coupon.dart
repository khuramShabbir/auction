import 'package:auction/api_services.dart';
import 'package:auction/controllers_providers/auth_provider.dart';
import 'package:auction/models/GetCoupon/GetCouponComments.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';


CommentByCoupon commentByCouponProvider=Provider.of<CommentByCoupon>(Get.context!,listen: false);


class CommentByCoupon extends ChangeNotifier{



  bool loaded=false;
  GetCouponComments? getCouponComments;
  String? comment;

  void getComments(String couponId)async {

  String body=await ApiServices.simpleGet("Coupon/comments-by-coupon?couponId=$couponId");
   if(body.isEmpty)return ;
  getCouponComments=null;
  loaded=false;
  notifyListeners();
  await Future.delayed(Duration.zero);
   getCouponComments=getCouponCommentsFromJson(body);
   loaded=true;
   notifyListeners();
  }

  void postComment(String couponID)async {
    Map<String,String> commentBody={
      "comment": comment!,
      "userId": getUser().result!.id.toString(),
      "couponId": couponID};
    String body=await ApiServices.simplePostWithBody("Coupon/add-coupon-comments", commentBody);
    if(body.isEmpty)return showToast(msg: "Something Went Wrong");

    logger.i(body);

  }

}