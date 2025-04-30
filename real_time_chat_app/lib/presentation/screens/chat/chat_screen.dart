import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_time_chat_app/presentation/widgets/chat_message.dart';
import 'package:real_time_chat_app/providers/chat_service.dart';


class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {

  final textController = TextEditingController();
  final focusNode = FocusNode();
  bool writing = false;

  List<ChatMessage> messages = [];

  @override
  void dispose() {
    for (var message in messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final chatService = Provider.of<ChatService>(context);
    final userTo = chatService.userTo;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            CircleAvatar(
              radius: 13,
              child: Text(userTo.name.substring(0,2), style: const TextStyle(fontSize: 13),), 
            ),
            Text(userTo.name, style: const TextStyle(fontSize: 14),),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemBuilder: (context, index) => messages[index],
              reverse: true,
              physics: const BouncingScrollPhysics(),
              itemCount: messages.length,
              
            )
          ),
          const Divider(height: 2,),
          _inputChat(context)

        ],
      ),
   );
  }

   Widget _inputChat(BuildContext _context) {

    return Container(
      height: 100,
      color: Colors.white,
      child: SafeArea(child: 
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8, ),
          child: Row(
            children: [
              Expanded(child: TextField(
                controller: textController,
                onSubmitted: _handleSubmitText,
                onChanged: (value) {
                  print(value);
                  writing = value.isNotEmpty && value.trim() != '' ? true : false;

                  setState(() {
                    
                  });
                },
                decoration: InputDecoration.collapsed(
                  hintText: 'Enviar mensage'
                ),
                focusNode: focusNode,
              )),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                child: Platform.isIOS ? CupertinoButton(child: Text('Enviar'), onPressed: writing ? () => _handleSubmitText(textController.text) : null,) : IconTheme(
                  data: IconThemeData(
                    color: Colors.blue[400]
                  ),
                  child: IconButton(onPressed: writing ? () => _handleSubmitText(textController.text) : null, icon: Icon(Icons.send,)),
                ),
              )
            ],
          ),
        )
      ),
    );
  }

  _handleSubmitText(String text) {
    if (text.isNotEmpty && text.trim() != '') {
      print(text);
      final newMessage = ChatMessage(uuid: '123', message: text, animationController: AnimationController(vsync: this, duration: Duration(milliseconds: 200)));
      messages.insert(0, newMessage);
      newMessage.animationController.forward();
    }
    textController.clear();
    focusNode.requestFocus();
    setState(() {
      writing = false;
    });
  }

}
