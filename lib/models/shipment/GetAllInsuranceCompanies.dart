// To parse this JSON data, do
//
//     final getAllInsuranceCompanies = getAllInsuranceCompaniesFromJson(jsonString);

import 'dart:convert';

GetAllInsuranceCompanies getAllInsuranceCompaniesFromJson(String str) => GetAllInsuranceCompanies.fromJson(json.decode(str));

String getAllInsuranceCompaniesToJson(GetAllInsuranceCompanies data) => json.encode(data.toJson());

class GetAllInsuranceCompanies {
  GetAllInsuranceCompanies({
    this.message,
    this.result,
  });

  String? message;
  List<Result>? result;

  factory GetAllInsuranceCompanies.fromJson(Map<String, dynamic> json) => GetAllInsuranceCompanies(
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
    this.name,
    this.contact,
    this.address,
    this.email,
    this.charges,
    this.duration,
    this.logo,
    this.picture,
  });

  dynamic? id;
  String? name;
  String? contact;
  String? address;
  String? email;
  dynamic? charges;
  String? duration;
  String? logo;
  dynamic picture;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    name: json["name"],
    contact: json["contact"],
    address: json["address"],
    email: json["email"],
    charges: json["charges"],
    duration: json["duration"],
    logo: json["logo"],
    picture: json["picture"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "contact": contact,
    "address": address,
    "email": email,
    "charges": charges,
    "duration": duration,
    "logo": logo,
    "picture": picture,
  };
}
