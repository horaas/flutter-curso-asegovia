// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

UserModel userFromJson(String str) => UserModel.fromJson(json.decode(str));

String userToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    final bool online;
    final String name;
    final String email;
    final String uuid;

    UserModel({
        required this.online,
        required this.name,
        required this.email,
        required this.uuid,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        online: json["online"],
        name: json["name"],
        email: json["email"],
        uuid: json["uuid"],
    );

    Map<String, dynamic> toJson() => {
        "online": online,
        "name": name,
        "email": email,
        "uuid": uuid,
    };
}
