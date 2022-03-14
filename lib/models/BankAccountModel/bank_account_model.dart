
import 'dart:convert';

BankAccountModel bankAccountModelFromJson(String str) => BankAccountModel.fromJson(json.decode(str));

String bankAccountModelToJson(BankAccountModel data) => json.encode(data.toJson());

class BankAccountModel {
  BankAccountModel({
     required this.message,
     required this.result,
  });

  String message;
  List<Result> result;

  factory BankAccountModel.fromJson(Map<String, dynamic> json) => BankAccountModel(
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
     required this.iban,
     required this.accountName,
     required this.accountNumber,
     required this.bankName,
     required this.userId,
  });

  String iban;
  String accountName;
  String accountNumber;
  String bankName;
  int userId;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    iban: json["iban"],
    accountName: json["accountName"],
    accountNumber: json["accountNumber"],
    bankName: json["bankName"],
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "iban": iban,
    "accountName": accountName,
    "accountNumber": accountNumber,
    "bankName": bankName,
    "userId": userId,
  };
}
