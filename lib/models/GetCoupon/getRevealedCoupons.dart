
//@dart=2.9


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

  String message;
  List<Result> result;

  factory GetRevealedCoupons.fromJson(Map<String, dynamic> json) => GetRevealedCoupons(
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
    this.amount,
    this.discountCode,
    this.isUsed,
    this.usedDate,
    this.couponTitle,
    this.quantity,
    this.picture,
    this.couponDescription,
    this.barCodeImage,
    this.qrCodeImage,
    this.couponDiscount,
    this.isPercent,
    this.expiry,
    this.storeId,
    this.storeName,
    this.storeAddress,
    this.storeContact,
    this.storePicture,
    this.storeTimings,
    this.branches,
  });

  dynamic amount;
  String discountCode;
  bool isUsed;
  dynamic usedDate;
  String couponTitle;
  dynamic quantity;
  String picture;
  String couponDescription;
  String barCodeImage;
  String qrCodeImage;
  String couponDiscount;
  bool isPercent;
  DateTime expiry;
  int storeId;
  String storeName;
  String storeAddress;
  String storeContact;
  String storePicture;
  String storeTimings;
  List<Branch> branches;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    amount: json["amount"],
    discountCode: json["discountCode"],
    isUsed: json["isUsed"],
    usedDate: json["usedDate"],
    couponTitle: json["couponTitle"],
    quantity: json["quantity"],
    picture: json["picture"],
    couponDescription: json["couponDescription"],
    barCodeImage: json["barCodeImage"] == null ? null : json["barCodeImage"],
    qrCodeImage: json["qrCodeImage"] == null ? null : json["qrCodeImage"],
    couponDiscount: json["couponDiscount"],
    isPercent: json["isPercent"],
    expiry: DateTime.parse(json["expiry"]),
    storeId: json["storeId"],
    storeName: json["storeName"],
    storeAddress: json["storeAddress"],
    storeContact: json["storeContact"],
    storePicture: json["storePicture"],
    storeTimings: json["storeTimings"],
    branches: List<Branch>.from(json["branches"].map((x) => Branch.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "discountCode": discountCode,
    "isUsed": isUsed,
    "usedDate": usedDate,
    "couponTitle": couponTitle,
    "quantity": quantity,
    "picture": picture,
    "couponDescription": couponDescription,
    "barCodeImage": barCodeImage == null ? null : barCodeImage,
    "qrCodeImage": qrCodeImage == null ? null : qrCodeImage,
    "couponDiscount": couponDiscount,
    "isPercent": isPercent,
    "expiry": expiry.toIso8601String(),
    "storeId": storeId,
    "storeName": storeName,
    "storeAddress": storeAddress,
    "storeContact": storeContact,
    "storePicture": storePicture,
    "storeTimings": storeTimings,
    "branches": List<dynamic>.from(branches.map((x) => x.toJson())),
  };
}

class Branch {
  Branch({
    this.id,
    this.branchName,
    this.branchAddress,
    this.branchPhone,
    this.branchTimings,
    this.storeId,
    this.store,
  });

  dynamic id;
  String branchName;
  String branchAddress;
  String branchPhone;
  String branchTimings;
  dynamic storeId;
  dynamic store;

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
    id: json["id"],
    branchName: json["branchName"],
    branchAddress: json["branchAddress"],
    branchPhone: json["branchPhone"],
    branchTimings: json["branchTimings"],
    storeId: json["storeId"],
    store: json["store"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "branchName": branchName,
    "branchAddress": branchAddress,
    "branchPhone": branchPhone,
    "branchTimings": branchTimings,
    "storeId": storeId,
    "store": store,
  };
}
