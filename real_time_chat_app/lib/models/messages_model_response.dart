

import 'dart:convert';

import 'package:real_time_chat_app/models/message_model.dart';

MessageModelResponse messageModelFromJson(String str) => MessageModelResponse.fromJson(json.decode(str));

String messageModelToJson(MessageModelResponse data) => json.encode(data.toJson());

class MessageModelResponse {
    final bool ok;
    final List<MessageModel> messages;

    MessageModelResponse({
        required this.ok,
        required this.messages,
    });

    factory MessageModelResponse.fromJson(Map<String, dynamic> json) => MessageModelResponse(
        ok: json["ok"],
        messages: List<MessageModel>.from(json["messages"].map((x) => MessageModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
    };
}
