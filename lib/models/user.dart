// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.user,
    this.token,
  });

  User? user;
  String? token;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        token: json["token"] == null ? null : json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user == null ? null : user!.toJson(),
        "token": token == null ? null : token,
      };
}

class User {
  User({
    required this.id,
    required this.role,
    this.referedId,
    required this.country,
    required this.countryCode,
    required this.state,
    required this.currency,
    required this.name,
    required this.email,
    required this.phone,
    required this.flag,
    required this.address,
    required this.latitude,
    required this.longitude,
    this.image,
    required this.balance,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  int? id;
  String? role;
  int? referedId;
  String? country;
  String? countryCode;
  String? state;
  String? currency;
  String? name;
  String? email;
  String? phone;
  String? flag;
  String? address;
  String? latitude;
  String? longitude;
  String? image;
  String? balance;
  DateTime? emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        role: json["role"] == null ? null : json["role"],
        referedId: json["refered_id"],
        country: json["country"] == null ? null : json["country"],
        countryCode: json["country_code"] == null ? null : json["country_code"],
        state: json["state"] == null ? null : json["state"],
        currency: json["currency"] == null ? null : json["currency"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        phone: json["phone"] == null ? null : json["phone"],
        flag: json["flag"] == null ? null : json["flag"],
        address: json["address"] == null ? null : json["address"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        image: json["image"],
        balance: json["balance"] == null ? null : json["balance"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "role": role == null ? null : role,
        "refered_id": referedId,
        "country": country == null ? null : country,
        "country_code": countryCode == null ? null : countryCode,
        "state": state == null ? null : state,
        "currency": currency == null ? null : currency,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "phone": phone == null ? null : phone,
        "flag": flag == null ? null : flag,
        "address": address == null ? null : address,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "image": image,
        "balance": balance == null ? null : balance,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}
