import 'dart:convert';

AuctionByUserModel auctionByUserModelFromJson(String str) =>
    AuctionByUserModel.fromJson(json.decode(str));

String auctionByUserModelToJson(AuctionByUserModel data) =>
    json.encode(data.toJson());

class AuctionByUserModel {
  AuctionByUserModel({
     required this.message,
     required this.result,
  });

  String message;
  List<Result> result;

  factory AuctionByUserModel.fromJson(Map<String, dynamic> json) =>
      AuctionByUserModel(
        message: json["message"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
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
     required this.carName,
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
     required this.minimumBidAmount,
  });

  int carInformationId;
  bool isManual;
  String carName;
  bool isGps;
  bool isBluetooth;
  bool isSnowTires;
  int doors;
  int passengers;
  String fuelTank;
  String milleage;
  String maxSpeed;
  String maxPower;
  Company company;
  Model model;
  dynamic bidding;
  User user;
  List<CarImage> carImages;
  List<BiddingList> biddingList;
  DateTime auctionExpiry;
  DateTime auctionCreated;
  bool isDownpaymentCleared;
  bool isAvailableForAuction;
  bool isCarSold;
  int reAuctionCount;
  double minimumBidAmount;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        carInformationId: json["carInformationId"],
        isManual: json["isManual"],
        carName: json["carName"],
        isGps: json["isGPS"],
        isBluetooth: json["isBluetooth"],
        isSnowTires: json["isSnowTires"],
        doors: json["doors"],
        passengers: json["passengers"],
        fuelTank: json["fuelTank"],
        milleage: json["milleage"],
        maxSpeed: json["maxSpeed"],
        maxPower: json["maxPower"],
        company: Company.fromJson(json["company"]),
        model: Model.fromJson(json["model"]),
        bidding: json["bidding"],
        user: User.fromJson(json["user"]),
        carImages: List<CarImage>.from(
            json["carImages"].map((x) => CarImage.fromJson(x))),
        biddingList: List<BiddingList>.from(
            json["biddingList"].map((x) => BiddingList.fromJson(x))),
        auctionExpiry: DateTime.parse(json["auctionExpiry"]),
        auctionCreated: DateTime.parse(json["auctionCreated"]),
        isDownpaymentCleared: json["isDownpaymentCleared"],
        isAvailableForAuction: json["isAvailableForAuction"],
        isCarSold: json["isCarSold"],
        reAuctionCount: json["reAuctionCount"],
        minimumBidAmount: json["minimumBidAmount"],
      );

  Map<String, dynamic> toJson() => {
        "carInformationId": carInformationId,
        "isManual": isManual,
        "carName": carName,
        "isGPS": isGps,
        "isBluetooth": isBluetooth,
        "isSnowTires": isSnowTires,
        "doors": doors,
        "passengers": passengers,
        "fuelTank": fuelTank,
        "milleage": milleage,
        "maxSpeed": maxSpeed,
        "maxPower": maxPower,
        "company": company.toJson(),
        "model": model.toJson(),
        "bidding": bidding,
        "user": user.toJson(),
        "carImages": List<dynamic>.from(carImages.map((x) => x.toJson())),
        "biddingList": List<dynamic>.from(biddingList.map((x) => x.toJson())),
        "auctionExpiry": auctionExpiry.toIso8601String(),
        "auctionCreated": auctionCreated.toIso8601String(),
        "isDownpaymentCleared": isDownpaymentCleared,
        "isAvailableForAuction": isAvailableForAuction,
        "isCarSold": isCarSold,
        "reAuctionCount": reAuctionCount,
        "minimumBidAmount": minimumBidAmount,
      };
}

class BiddingList {
  BiddingList({
     required this.biddingAmount,
     required this.biddingDate,
  });

  double biddingAmount;
  DateTime biddingDate;

  factory BiddingList.fromJson(Map<String, dynamic> json) => BiddingList(
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

  String imagePath;

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

  int id;
  String name;

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

  int carModelId;
  String modelName;

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

  dynamic name;
  int userId;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "userId": userId,
      };
}
