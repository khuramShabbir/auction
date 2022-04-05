// To parse this JSON data, do
//
//     final getAllAuctions = getAllAuctionsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetAllAuctions getAllAuctionsFromJson(String str) => GetAllAuctions.fromJson(json.decode(str));

String getAllAuctionsToJson(GetAllAuctions data) => json.encode(data.toJson());

class GetAllAuctions {
  GetAllAuctions({
     required this.message,
     required this.result,
  });

  final String message;
  final List<Result> result;

  factory GetAllAuctions.fromJson(Map<String, dynamic> json) => GetAllAuctions(
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
     required this.carInformationId,
     required this.isManual,
     required this.alreadyBid,
     required this.carName,
     required this.image360,
     required this.isGps,
     required this.isBluetooth,
     required this.isSnowTires,
     required this.doors,
     required this.passengers,
     required this.fuelTank,
     required this.milleage,
     required this.maxSpeed,
     required this.maxPower,
     required this.company,
     required this.model,
     required this.bidding,
     required this.user,
     required this.carImages,
     required this.biddingList,
     required this.auctionExpiry,
     required this.auctionCreated,
     required this.isDownpaymentCleared,
     required this.isAvailableForAuction,
     required this.isCarSold,
     required this.reAuctionCount,
     required this.downPayment,
     required this.bidIncrement,
     required this.inspectionPdf,
     required this.isWinning,
  });

  final dynamic carInformationId;
  final bool isManual;
  final bool alreadyBid;
  final String carName;
  final String? image360;
  final bool isGps;
  final bool isBluetooth;
  final bool isSnowTires;
  final dynamic doors;
  final dynamic passengers;
  final String fuelTank;
  final String? inspectionPdf;
  final String milleage;
  final String maxSpeed;
  final String maxPower;
  final Company company;
  final Model model;
  final Bidding bidding;
  final User user;
  final List<CarImage> carImages;
  final dynamic biddingList;
  final DateTime auctionExpiry;
  final DateTime auctionCreated;
  final bool isDownpaymentCleared;
  final bool isAvailableForAuction;
  final bool isWinning;
  final bool isCarSold;
  final dynamic reAuctionCount;
  final dynamic downPayment;
  final dynamic bidIncrement;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    carInformationId: json["carInformationId"],
    isWinning: json["isWinning"],
    image360: json["image360"],
    isManual: json["isManual"],
    alreadyBid: json["alreadyBid"],
    carName: json["carName"],
    isGps: json["isGPS"],
    isBluetooth: json["isBluetooth"],
    isSnowTires: json["isSnowTires"],
    doors: json["doors"],
    passengers: json["passengers"],
    fuelTank: json["fuelTank"],
    milleage: json["milleage"],
    maxSpeed: json["maxSpeed"],
    inspectionPdf: json["inspectionPdf"],
    maxPower: json["maxPower"],
    company: Company.fromJson(json["company"]),
    model: Model.fromJson(json["model"]),
    bidding: Bidding.fromJson(json["bidding"]),
    user: User.fromJson(json["user"]),
    carImages: List<CarImage>.from(json["carImages"].map((x) => CarImage.fromJson(x))),
    biddingList: json["biddingList"],
    auctionExpiry: DateTime.parse(json["auctionExpiry"]),
    auctionCreated: DateTime.parse(json["auctionCreated"]),
    isDownpaymentCleared: json["isDownpaymentCleared"],
    isAvailableForAuction: json["isAvailableForAuction"],
    isCarSold: json["isCarSold"],
    reAuctionCount: json["reAuctionCount"],
    downPayment: json["downPayment"],
    bidIncrement: json["bidIncrement"],
  );

  Map<String, dynamic> toJson() => {
    "carInformationId": carInformationId,
    "isWinning": isWinning,
    "isManual": isManual,
    "alreadyBid": alreadyBid,
    "image360": image360,
    "carName": carName,
    "isGPS": isGps,
    "isBluetooth": isBluetooth,
    "isSnowTires": isSnowTires,
    "doors": doors,
    "passengers": passengers,
    "fuelTank": fuelTank,
    "inspectionPdf": inspectionPdf,
    "milleage": milleage,
    "maxSpeed": maxSpeed,
    "maxPower": maxPower,
    "company": company.toJson(),
    "model": model.toJson(),
    "bidding": bidding.toJson(),
    "user": user.toJson(),
    "carImages": List<dynamic>.from(carImages.map((x) => x.toJson())),
    "biddingList": biddingList,
    "auctionExpiry": auctionExpiry.toIso8601String(),
    "auctionCreated": auctionCreated.toIso8601String(),
    "isDownpaymentCleared": isDownpaymentCleared,
    "isAvailableForAuction": isAvailableForAuction,
    "isCarSold": isCarSold,
    "reAuctionCount": reAuctionCount,
    "minimumBidAmount": downPayment,
    "bidIncrement": bidIncrement,
  };
}

class Bidding {
  Bidding({
     required this.biddingAmount,
     required this.biddingDate,
  });

  final dynamic biddingAmount;
  final DateTime biddingDate;

  factory Bidding.fromJson(Map<String, dynamic> json) => Bidding(
    biddingAmount: json["biddingAmount"],
    biddingDate: DateTime.parse(json["biddingDate"]),
  );

  Map<String, dynamic> toJson() => {
    "biddingAmount": biddingAmount,
    "biddingDate": biddingDate.toIso8601String(),
  };
}

class CarImage {
  CarImage({
     required this.imagePath,
  });

  final String imagePath;

  factory CarImage.fromJson(Map<String, dynamic> json) => CarImage(
    imagePath: json["imagePath"],
  );

  Map<String, dynamic> toJson() => {
    "imagePath": imagePath,
  };
}

class Company {
  Company({
     required this.id,
     required this.name,
  });

  final dynamic id;
  final String? name;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class Model {
  Model({
     required this.carModelId,
     required this.modelName,
  });

  final dynamic carModelId;
  final String? modelName;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
    carModelId: json["carModelId"],
    modelName: json["modelName"],
  );

  Map<String, dynamic> toJson() => {
    "carModelId": carModelId,
    "modelName": modelName,
  };
}

class User {
  User({
     required this.name,
     required this.userId,
  });

  final String? name;
  final dynamic userId;

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "userId": userId,
  };
}
