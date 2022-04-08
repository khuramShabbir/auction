// @dart=2.9

import 'dart:convert';

AllCarsSpecs allCarsSpecsFromJson(String str) => AllCarsSpecs.fromJson(json.decode(str));

String allCarsSpecsToJson(AllCarsSpecs data) => json.encode(data.toJson());

class AllCarsSpecs {
  AllCarsSpecs({
    this.message,
    this.result,
  });

  String message;
  Result result;

  factory AllCarsSpecs.fromJson(Map<String, dynamic> json) => AllCarsSpecs(
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
    this.companies,
    this.colors,
    this.types,
    this.models,
  });

  List<Data> companies;
  List<Data> colors;
  List<Type> types;
  List<Data> models;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    companies: List<Data>.from(json["companies"].map((x) => Data.fromJson(x))),
    colors: List<Data>.from(json["colors"].map((x) => Data.fromJson(x))),
    types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
    models: List<Data>.from(json["models"].map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "companies": List<dynamic>.from(companies.map((x) => x.toJson())),
    "colors": List<dynamic>.from(colors.map((x) => x.toJson())),
    "types": List<dynamic>.from(types.map((x) => x.toJson())),
    "models": List<dynamic>.from(models.map((x) => x.toJson())),
  };
}

class Data {
  Data({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class Type {
  Type({
    this.carTypeId,
    this.typeName,
  });

  int carTypeId;
  String typeName;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
    carTypeId: json["carTypeId"],
    typeName: json["typeName"],
  );

  Map<String, dynamic> toJson() => {
    "carTypeId": carTypeId,
    "typeName": typeName,
  };
}
