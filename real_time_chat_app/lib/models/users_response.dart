// To parse this JSON data, do
//
//     final usersResponse = usersResponseFromJson(jsonString);

import 'dart:convert';

import 'package:real_time_chat_app/models/user_model.dart';

UsersResponse usersResponseFromJson(String str) => UsersResponse.fromJson(json.decode(str));

String usersResponseToJson(UsersResponse data) => json.encode(data.toJson());

class UsersResponse {
    final bool ok;
    final List<UserModel> users;

    UsersResponse({
        required this.ok,
        required this.users,
    });

    factory UsersResponse.fromJson(Map<String, dynamic> json) => UsersResponse(
        ok: json["ok"],
        users: List<UserModel>.from(json["users"].map((x) => UserModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
    };
}

