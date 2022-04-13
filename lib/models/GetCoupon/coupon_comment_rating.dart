// @dart=2.9

import 'dart:convert';

GetCouponCommentsRating getCouponCommentsRatingFromJson(String str) => GetCouponCommentsRating.fromJson(json.decode(str));

String getCouponCommentsRatingToJson(GetCouponCommentsRating data) => json.encode(data.toJson());

class GetCouponCommentsRating {
  GetCouponCommentsRating({
    this.message,
    this.result,
  });

  String message;
  List<Result> result;

  factory GetCouponCommentsRating.fromJson(Map<String, dynamic> json) => GetCouponCommentsRating(
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
    this.comment,
    this.rating,
    this.username,
    this.phoneNumber,
    this.userId,
    this.couponId,
    this.created,
  });

  dynamic comment;
  String rating;
  String username;
  String phoneNumber;
  int userId;
  int couponId;
  DateTime created;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    comment: json["comment"],
    rating: json["rating"],
    username: json["username"],
    phoneNumber: json["phoneNumber"],
    userId: json["userId"],
    couponId: json["couponId"],
    created: DateTime.parse(json["created"]),
  );

  Map<String, dynamic> toJson() => {
    "comment": comment,
    "rating": rating,
    "username": username,
    "phoneNumber": phoneNumber,
    "userId": userId,
    "couponId": couponId,
    "created": created.toIso8601String(),
  };
}
