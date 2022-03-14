import 'dart:convert';

GetPaymentEvidenceModel getPaymentEvidenceModelFromJson(String str) =>
    GetPaymentEvidenceModel.fromJson(json.decode(str));

String getPaymentEvidenceModelToJson(GetPaymentEvidenceModel data) =>
    json.encode(data.toJson());

class GetPaymentEvidenceModel {
  GetPaymentEvidenceModel({
    required this.message,
    required this.result,
  });

  String message;
  Result result;

  factory GetPaymentEvidenceModel.fromJson(Map<String, dynamic> json) =>
      GetPaymentEvidenceModel(
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
    required this.carId,
    required this.carInformation,
    required this.filePath,
  });

  int id;
  int userId;
  dynamic user;
  int carId;
  dynamic carInformation;
  String filePath;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        userId: json["userId"],
        user: json["user"],
        carId: json["carId"],
        carInformation: json["carInformation"],
        filePath: json["filePath"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "user": user,
        "carId": carId,
        "carInformation": carInformation,
        "filePath": filePath,
      };
}
