import 'package:flutter/material.dart';
import 'package:pelis_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> message = [
    Message(text: 'hola', fromWho: FromWho.me),
    Message(text: 'ya regresaste del traabajo?', fromWho: FromWho.me)
  ];


  Future<void> sendMessage(String text) async {

  }
}