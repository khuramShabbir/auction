import 'dart:convert';

GetWalletHistory getWalletHistoryFromJson(String str) => GetWalletHistory.fromJson(json.decode(str));

String getWalletHistoryToJson(GetWalletHistory data) => json.encode(data.toJson());

class GetWalletHistory {
  GetWalletHistory({
    this.message,
    this.result,
  });

  String? message;
   List<Result>? result;

  factory GetWalletHistory.fromJson(Map<String, dynamic> json) => GetWalletHistory(
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

  dynamic id;
  dynamic walletId;
  Wallet? wallet;
  dynamic amountPaid;
  dynamic remainingAmount;
  dynamic actualAmount;
  String? amountPaidFor;
  DateTime? paymentDate;
  dynamic paymentId;
  String? status;
  dynamic transactionUrl;
  DateTime? creationTime;
  dynamic paymentTime;
  dynamic referenceId;
  String? reference;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    walletId: json["walletId"],
    wallet: Wallet.fromJson(json["wallet"]),
    amountPaid: json["amountPaid"],
    remainingAmount: json["remainingAmount"],
    actualAmount: json["actualAmount"],
    amountPaidFor: json["amountPaidFor"],
    paymentDate: DateTime.parse(json["paymentDate"]),
    paymentId: json["paymentId"],
    status: json["status"],
    transactionUrl: json["transactionUrl"],
    creationTime: DateTime.parse(json["creationTime"]),
    paymentTime: json["paymentTime"],
    referenceId: json["referenceId"],
    reference: json["reference"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "walletId": walletId,
    "wallet": wallet!.toJson(),
    "amountPaid": amountPaid,
    "remainingAmount": remainingAmount,
    "actualAmount": actualAmount,
    "amountPaidFor": amountPaidFor,
    "paymentDate": paymentDate!.toIso8601String(),
    "paymentId": paymentId,
    "status": status,
    "transactionUrl": transactionUrl,
    "creationTime": creationTime!.toIso8601String(),
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

  dynamic id;
  dynamic userId;
  dynamic user;
  dynamic amount;

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
