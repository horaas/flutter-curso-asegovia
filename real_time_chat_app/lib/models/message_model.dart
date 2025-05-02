
class MessageModel {
    final String from;
    final String to;
    final String message;

    MessageModel({
        required this.from,
        required this.to,
        required this.message,
    });

    factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        from: json["from"],
        to: json["to"],
        message: json["message"]
    );

    Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "message": message
    };
}
