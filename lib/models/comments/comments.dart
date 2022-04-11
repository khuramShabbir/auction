

import 'dart:convert';

CommentsByCars commentsByCarsFromJson(String str) => CommentsByCars.fromJson(json.decode(str));

String commentsByCarsToJson(CommentsByCars data) => json.encode(data.toJson());

class CommentsByCars {
  CommentsByCars({
    required this.message,
    required this.result,
  });

  String message;
  List<Result> result;

  factory CommentsByCars.fromJson(Map<String, dynamic> json) => CommentsByCars(
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
    required this.comment,
    required this.userId,
    required this.username,
    this.userPicture,
    required this.phoneNumber,
    required this.carId,
    required this.commentDate,
  });

  String comment;
  int userId;
  String username;
  dynamic userPicture;
  String phoneNumber;
  int carId;
  DateTime commentDate;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    comment: json["comment"],
    userId: json["userId"],
    username: json["username"],
    userPicture: json["userPicture"],
    phoneNumber: json["phoneNumber"],
    carId: json["carId"],
    commentDate: DateTime.parse(json["commentDate"]),
  );

  Map<String, dynamic> toJson() => {
    "comment": comment,
    "userId": userId,
    "username": username,
    "userPicture": userPicture,
    "phoneNumber": phoneNumber,
    "carId": carId,
    "commentDate": commentDate.toIso8601String(),
  };
}
