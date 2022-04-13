// @dart=2.9

import 'dart:convert';

GetCoupon getCouponFromJson(String str) => GetCoupon.fromJson(json.decode(str));

String getCouponToJson(GetCoupon data) => json.encode(data.toJson());

class GetCoupon {
  GetCoupon({
    this.message,
    this.result,
  });

  String message;
  List<Result> result;

  factory GetCoupon.fromJson(Map<String, dynamic> json) => GetCoupon(
    message: json["message"],
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.id,
    this.couponTitle,
    this.couponCode,
    this.couponDescription,
    this.couponDiscount,
    this.isPercent,
    this.usage,
    this.created,
    this.expiry,
    this.picturePath,
    this.picture,
  });

  int id;
  String couponTitle;
  String couponCode;
  String couponDescription;
  String couponDiscount;
  bool isPercent;
  String usage;
  DateTime created;
  DateTime expiry;
  String picturePath;
  dynamic picture;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    couponTitle: json["couponTitle"],
    couponCode: json["couponCode"],
    couponDescription: json["couponDescription"],
    couponDiscount: json["couponDiscount"],
    isPercent: json["isPercent"],
    usage: json["usage"],
    created: DateTime.parse(json["created"]),
    expiry: DateTime.parse(json["expiry"]),
    picturePath: json["picturePath"] == null ? null : json["picturePath"],
    picture: json["picture"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "couponTitle": couponTitle,
    "couponCode": couponCode,
    "couponDescription": couponDescription,
    "couponDiscount": couponDiscount,
    "isPercent": isPercent,
    "usage": usage,
    "created": created.toIso8601String(),
    "expiry": expiry.toIso8601String(),
    "picturePath": picturePath == null ? null : picturePath,
    "picture": picture,
  };
}
