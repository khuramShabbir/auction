// @dart=2.9



import 'dart:convert';

GetCart getCartFromJson(String str) => GetCart.fromJson(json.decode(str));

String getCartToJson(GetCart data) => json.encode(data.toJson());

class GetCart {
  GetCart({
    this.message,
    this.result,
  });

  String message;
  List<Result> result;

  factory GetCart.fromJson(Map<String, dynamic> json) => GetCart(
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
    this.quantity,
    this.created,
    this.userId,
    this.user,
    this.couponId,
    this.coupon,
  });

  int id;
  int quantity;
  DateTime created;
  int userId;
  dynamic user;
  int couponId;
  Coupon coupon;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    quantity: json["quantity"],
    created: DateTime.parse(json["created"]),
    userId: json["userId"],
    user: json["user"],
    couponId: json["couponId"],
    coupon: Coupon.fromJson(json["coupon"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "quantity": quantity,
    "created": created.toIso8601String(),
    "userId": userId,
    "user": user,
    "couponId": couponId,
    "coupon": coupon.toJson(),
  };
}

class Coupon {
  Coupon({
    this.id,
    this.couponTitle,
    this.couponCode,
    this.couponDescription,
    this.couponDiscount,
    this.price,
    this.isPercent,
    this.usage,
    this.created,
    this.expiry,
    this.picturePath,
    this.picture,
    this.discoutCode,
  });

  int id;
  String couponTitle;
  String couponCode;
  String couponDescription;
  String couponDiscount;
  double price;
  bool isPercent;
  String usage;
  DateTime created;
  DateTime expiry;
  String picturePath;
  dynamic picture;
  dynamic discoutCode;

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
    id: json["id"],
    couponTitle: json["couponTitle"],
    couponCode: json["couponCode"],
    couponDescription: json["couponDescription"],
    couponDiscount: json["couponDiscount"],
    price: json["price"],
    isPercent: json["isPercent"],
    usage: json["usage"],
    created: DateTime.parse(json["created"]),
    expiry: json["expiry"] == null ? null : DateTime.parse(json["expiry"]),
    picturePath: json["picturePath"],
    picture: json["picture"],
    discoutCode: json["discoutCode"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "couponTitle": couponTitle,
    "couponCode": couponCode,
    "couponDescription": couponDescription,
    "couponDiscount": couponDiscount,
    "price": price,
    "isPercent": isPercent,
    "usage": usage,
    "created": created.toIso8601String(),
    "expiry": expiry == null ? null : expiry.toIso8601String(),
    "picturePath": picturePath,
    "picture": picture,
    "discoutCode": discoutCode,
  };
}
