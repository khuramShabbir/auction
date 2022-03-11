
import 'dart:convert';

WalletModel walletModelFromJson(String str) => WalletModel.fromJson(json.decode(str));

String walletModelToJson(WalletModel data) => json.encode(data.toJson());

class WalletModel {
  WalletModel({
      required this.message,
      required this.result,
  });

  String message;
  Result result;

  factory WalletModel.fromJson(Map<String, dynamic> json) => WalletModel(
    message: json["message"],
    result: Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "result": result.toJson(),
  };
}

class Result {
  Result({
      required this.id,
      required this.userId,
      required this.user,
      required this.amount,
  });

  int id;
  int userId;
  dynamic user;
  dynamic amount;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    userId: json["userId"],
    user: json["user"],
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "user": user,
    "amount": amount,
  };
}
