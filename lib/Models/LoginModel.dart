// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.status,
    this.payload,
  });

  Status status;
  Payload payload;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: Status.fromJson(json["status"]),
        payload: Payload.fromJson(json["payload"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status.toJson(),
        "payload": payload.toJson(),
      };
}

class Payload {
  Payload({
    this.user,
    this.token,
  });

  User user;
  String token;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
      };
}

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.createdAt,
  });

  String id;
  String name;
  String email;
  DateTime createdAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "createdAt": createdAt.toIso8601String(),
      };
}

class Status {
  Status({
    this.statusCode,
    this.message,
  });

  int statusCode;
  String message;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        statusCode: json["status_code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "message": message,
      };
}
