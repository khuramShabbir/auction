
import 'dart:convert';

UserModelPojo userModelPojoFromJson(String str) {
  return UserModelPojo.fromJson(json.decode(str));
}

String userModelPojoToJson(UserModelPojo data) => json.encode(data.toJson());

class UserModelPojo {
  UserModelPojo({
    this.message,
    this.result,
  });

  String? message;
  Result? result;

  factory UserModelPojo.fromJson(Map<String, dynamic> json) => UserModelPojo(
    message: json["message"],
    result: Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "result": result!.toJson(),
  };
}

class Result {
  Result({
    this.id,
    this.name,
    this.email,
    this.created,
    this.phoneNumber,
    this.isAvailable,
    this.vatEnabled,
  });

  int? id;
  String? name;
  String? email;
  DateTime? created;
  String? phoneNumber;
  bool? isAvailable;
  bool? vatEnabled;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    created: DateTime.parse(json["created"]),
    phoneNumber: json["phoneNumber"],
    isAvailable: json["isAvailable"],
    vatEnabled: json["vatEnabled"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "created": created!.toIso8601String(),
    "phoneNumber": phoneNumber,
    "isAvailable": isAvailable,
    "vatEnabled": vatEnabled,
  };
}
