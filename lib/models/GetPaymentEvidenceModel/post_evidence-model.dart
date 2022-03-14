
import 'dart:convert';

PostPaymentEvidenceModel postPaymentEvidenceModelFromJson(String str) => PostPaymentEvidenceModel.fromJson(json.decode(str));

String postPaymentEvidenceModelToJson(PostPaymentEvidenceModel data) => json.encode(data.toJson());

class PostPaymentEvidenceModel {
  PostPaymentEvidenceModel({
     required this.message,
     required this.result,
  });

  String message;
  String result;

  factory PostPaymentEvidenceModel.fromJson(Map<String, dynamic> json) => PostPaymentEvidenceModel(
    message: json["message"],
    result: json["result"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "result": result,
  };
}
