import 'package:flutter/material.dart';
import 'package:pelis_app/config/helpers/get_yes_no_answer.dart';
import 'package:pelis_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  final chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();


  List<Message> message = [
    Message(text: 'hola', fromWho: FromWho.me),
    Message(text: 'ya regresaste del traabajo?', fromWho: FromWho.me)
  ];


  Future<void> sendMessage(String text) async {
    if(text.isEmpty) return;

    final Message myMessage = Message(text: text, fromWho: FromWho.me);
    message.add(myMessage);

    if(text.endsWith('?')) {
      herReply();
    }


    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut
      );
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    message.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }

}