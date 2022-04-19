// To parse this JSON data, do
//
//     final getRevealedCoupons = getRevealedCouponsFromJson(jsonString);

import 'dart:convert';

GetRevealedCoupons getRevealedCouponsFromJson(str) => GetRevealedCoupons.fromJson(jsonDecode(utf8.decode(str)));

String getRevealedCouponsToJson(GetRevealedCoupons data) => json.encode(data.toJson());

class GetRevealedCoupons {
  GetRevealedCoupons({
    this.message,
    this.result,
  });

  String? message;
  List<Result>? result;

  factory GetRevealedCoupons.fromJson(Map<String, dynamic> json) => GetRevealedCoupons(
    message: json["message"],
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "result": List<dynamic>.from(result!.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.discountCode,
    this.isUsed,
    this.usedDate,
    this.couponTitle,
    this.quantity,
    this.picture,
    this.expiry,
  });

  String? discountCode;
  bool? isUsed;
  dynamic usedDate;
  String? couponTitle;
  int? quantity;
  String? picture;
  DateTime? expiry;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    discountCode: json["discountCode"],
    isUsed: json["isUsed"],
    usedDate: json["usedDate"],
    couponTitle: json["couponTitle"],
    quantity: json["quantity"],
    picture: json["picture"],
    expiry: DateTime.parse(json["expiry"]),
  );

  Map<String, dynamic> toJson() => {
    "discountCode": discountCode,
    "isUsed": isUsed,
    "usedDate": usedDate,
    "couponTitle": couponTitle,
    "quantity": quantity,
    "picture": picture,
    "expiry": expiry!.toIso8601String(),
  };
}
