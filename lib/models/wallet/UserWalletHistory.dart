//@dart=2.9

import 'dart:convert';

UserWalletHistory userWalletHistoryFromJson(String str) => UserWalletHistory.fromJson(json.decode(str));

String userWalletHistoryToJson(UserWalletHistory data) => json.encode(data.toJson());

class UserWalletHistory {
  UserWalletHistory({
    this.message,
    this.result,
  });

  String message;
  List<Result> result;

  factory UserWalletHistory.fromJson(Map<String, dynamic> json) => UserWalletHistory(
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
    this.walletId,
    this.wallet,
    this.amountPaid,
    this.remainingAmount,
    this.actualAmount,
    this.amountPaidFor,
    this.paymentDate,
    this.paymentId,
    this.status,
    this.transactionUrl,
    this.creationTime,
    this.paymentTime,
    this.referenceId,
    this.reference,
  });

  int id;
  int walletId;
  Wallet wallet;
  int amountPaid;
  int remainingAmount;
  int actualAmount;
  String amountPaidFor;
  DateTime paymentDate;
  String paymentId;
  String status;
  String transactionUrl;
  DateTime creationTime;
  dynamic paymentTime;
  dynamic referenceId;
  String reference;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    walletId: json["walletId"],
    wallet: Wallet.fromJson(json["wallet"]),
    amountPaid: json["amountPaid"],
    remainingAmount: json["remainingAmount"],
    actualAmount: json["actualAmount"],
    amountPaidFor: json["amountPaidFor"] == null ? null : json["amountPaidFor"],
    paymentDate: DateTime.parse(json["paymentDate"]),
    paymentId: json["paymentId"] == null ? null : json["paymentId"],
    status: json["status"],
    transactionUrl: json["transactionUrl"] == null ? null : json["transactionUrl"],
    creationTime: DateTime.parse(json["creationTime"]),
    paymentTime: json["paymentTime"],
    referenceId: json["referenceId"],
    reference: json["reference"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "walletId": walletId,
    "wallet": wallet.toJson(),
    "amountPaid": amountPaid,
    "remainingAmount": remainingAmount,
    "actualAmount": actualAmount,
    "amountPaidFor": amountPaidFor == null ? null : amountPaidFor,
    "paymentDate": paymentDate.toIso8601String(),
    "paymentId": paymentId == null ? null : paymentId,
    "status": status,
    "transactionUrl": transactionUrl == null ? null : transactionUrl,
    "creationTime": creationTime.toIso8601String(),
    "paymentTime": paymentTime,
    "referenceId": referenceId,
    "reference": reference,
  };
}

class Wallet {
  Wallet({
    this.id,
    this.userId,
    this.user,
    this.amount,
  });

  int id;
  int userId;
  dynamic user;
  int amount;

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
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
