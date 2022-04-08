//@dart=2.9
import 'dart:convert';

AllCarsModel allCarsModelFromJson(String str) => AllCarsModel.fromJson(json.decode(str));

String allCarsModelToJson(AllCarsModel data) => json.encode(data.toJson());

class AllCarsModel {
  AllCarsModel({
      this.message,
       this.result,
  });

  String message;
  List<Result> result;

  factory AllCarsModel.fromJson(Map<String, dynamic> json) => AllCarsModel(
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
      this.carSaleId,
      this.userId,
      this.makeCompanyId,
      this.makeCompany,
      this.model,
      this.typeId,
      this.type,
      this.year,
      this.colorId,
      this.color,
      this.plate,
      this.milleage,
      this.chassis,
      this.price,
      this.discountedPrice,
      this.serialNo,
      this.isGps,
      this.isBluetooth,
      this.isSnowTires,
      this.isManual,
      this.doors,
      this.passengers,
      this.fuelTank,
      this.maxSpeed,
      this.maxPower,
      this.description,
      this.picture360,
      this.pictures,
  });

  int carSaleId;
  int userId;
  int makeCompanyId;
  dynamic makeCompany;
  String model;
  int typeId;
  dynamic type;
  String year;
  int colorId;
  String color;
  String plate;
  String milleage;
  String chassis;
  String price;
  String discountedPrice;
  String serialNo;
  bool isGps;
  bool isBluetooth;
  bool isSnowTires;
  bool isManual;
  int doors;
  int passengers;
  String fuelTank;
  String maxSpeed;
  String maxPower;
  String description;
  String picture360;
  List<String> pictures;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    carSaleId: json["carSaleId"],
    userId: json["userId"],
    makeCompanyId: json["makeCompanyId"],
    makeCompany: json["makeCompany"],
    model: json["model"],
    typeId: json["typeId"],
    type: json["type"],
    year: json["year"],
    colorId: json["colorId"],
    color: json["color"],
    plate: json["plate"],
    milleage: json["milleage"],
    chassis: json["chassis"],
    price: json["price"],
    discountedPrice: json["discountedPrice"],
    serialNo: json["serialNo"],
    isGps: json["isGPS"],
    isBluetooth: json["isBluetooth"],
    isSnowTires: json["isSnowTires"],
    isManual: json["isManual"],
    doors: json["doors"],
    passengers: json["passengers"],
    fuelTank: json["fuelTank"],
    maxSpeed: json["maxSpeed"],
    maxPower: json["maxPower"],
    description: json["description"],
    picture360: json["picture360"],
    pictures: List<String>.from(json["pictures"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "carSaleId": carSaleId,
    "userId": userId,
    "makeCompanyId": makeCompanyId,
    "makeCompany": makeCompany,
    "model": model,
    "typeId": typeId,
    "type": type,
    "year": year,
    "colorId": colorId,
    "color": color,
    "plate": plate,
    "milleage": milleage,
    "chassis": chassis,
    "price": price,
    "discountedPrice": discountedPrice,
    "serialNo": serialNo,
    "isGPS": isGps,
    "isBluetooth": isBluetooth,
    "isSnowTires": isSnowTires,
    "isManual": isManual,
    "doors": doors,
    "passengers": passengers,
    "fuelTank": fuelTank,
    "maxSpeed": maxSpeed,
    "maxPower": maxPower,
    "description": description == null ? null : description,
    "picture360": picture360,
    "pictures": List<dynamic>.from(pictures.map((x) => x)),
  };
}
