import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:real_time_chat_app/models/message_model.dart';
import 'package:real_time_chat_app/models/user_model.dart';
import 'package:real_time_chat_app/config/environments.dart';
import 'package:real_time_chat_app/providers/auth_service.dart';
import 'package:real_time_chat_app/models/messages_model_response.dart';

class ChatService extends ChangeNotifier {
  late UserModel userTo;


  Future<List<MessageModel>> getMessages(String to) async {
    try {
      final messagesresp = await http.get(
        Uri.https(Environments.apiUrl, '/api/messages/$to'),
        headers: {'Content-Type': 'application/json', 'x-token': await AuthService.getToken()},);
      if (messagesresp.statusCode == 200) {
        final usersResponse = messageModelFromJson(messagesresp.body);
        return usersResponse.messages;
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}