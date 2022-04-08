import 'dart:convert';

AllCarsModel allCarsModelFromJson(String str) => AllCarsModel.fromJson(json.decode(str));

String allCarsModelToJson(AllCarsModel data) => json.encode(data.toJson());

class AllCarsModel {
  AllCarsModel({
    this.message,
    this.result,
  });

  String? message;
  List<Result>? result;

  factory AllCarsModel.fromJson(Map<String, dynamic> json) => AllCarsModel(
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
    this.user,
  });

  dynamic carSaleId;
  dynamic userId;
  dynamic makeCompanyId;
  dynamic makeCompany;
  String? model;
  dynamic typeId;
  dynamic type;
  String? year;
  dynamic colorId;
  String? color;
  String? plate;
  String? milleage;
  String? chassis;
  String? price;
  String? discountedPrice;
  String? serialNo;
  bool? isGps;
  bool? isBluetooth;
  bool? isSnowTires;
  bool? isManual;
  dynamic doors;
  dynamic passengers;
  String? fuelTank;
  String? maxSpeed;
  String? maxPower;
  String? description;
  String? picture360;
  List<String>? pictures;
  User? user;

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
    serialNo: json["serialNo"] == null ? null : json["serialNo"],
    isGps: json["isGPS"],
    isBluetooth: json["isBluetooth"],
    isSnowTires: json["isSnowTires"],
    isManual: json["isManual"],
    doors: json["doors"],
    passengers: json["passengers"],
    fuelTank: json["fuelTank"],
    maxSpeed: json["maxSpeed"],
    maxPower: json["maxPower"],
    description: json["description"] == null ? null : json["description"],
    picture360: json["picture360"],
    pictures: List<String>.from(json["pictures"].map((x) => x)),
    user: User.fromJson(json["user"]),
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
    "serialNo": serialNo == null ? null : serialNo,
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
    "pictures": List<dynamic>.from(pictures!.map((x) => x)),
    "user": user!.toJson(),
  };
}

class User {
  User({
    this.name,
    this.created,
    this.isActive,
    this.address,
    this.phoneNumber,
    this.vatEnabled,
    this.vatNumber,
    this.vatValue,
  });

  String? name;
  DateTime? created;
  bool? isActive;
  dynamic address;
  String? phoneNumber;
  bool? vatEnabled;
  dynamic vatNumber;
  dynamic vatValue;

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    created: DateTime.parse(json["created"]),
    isActive: json["isActive"],
    address: json["address"],
    phoneNumber: json["phoneNumber"],
    vatEnabled: json["vatEnabled"],
    vatNumber: json["vatNumber"],
    vatValue: json["vatValue"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "created": created!.toIso8601String(),
    "isActive": isActive,
    "address": address,
    "phoneNumber": phoneNumber,
    "vatEnabled": vatEnabled,
    "vatNumber": vatNumber,
    "vatValue": vatValue,
  };
}
