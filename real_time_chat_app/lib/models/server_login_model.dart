// To parse this JSON data, do
//
//     final serverLoginModel = serverLoginModelFromJson(jsonString);

import 'dart:convert';

import 'package:real_time_chat_app/models/user_model.dart';

ServerLoginModel serverLoginModelFromJson(String str) => ServerLoginModel.fromJson(json.decode(str));

String serverLoginModelToJson(ServerLoginModel data) => json.encode(data.toJson());

class ServerLoginModel {
    final bool ok;
    final UserModel user;
    final String token;

    ServerLoginModel({
        required this.ok,
        required this.user,
        required this.token,
    });

    factory ServerLoginModel.fromJson(Map<String, dynamic> json) => ServerLoginModel(
        ok: json["ok"],
        user: UserModel.fromJson(json["user"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "user": user.toJson(),
        "token": token,
    };
}

