import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_time_chat_app/presentation/widgets/chat_message.dart';
import 'package:real_time_chat_app/providers/auth_service.dart';
import 'package:real_time_chat_app/providers/chat_service.dart';
import 'package:real_time_chat_app/providers/socket_provider.dart';


class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {

  final textController = TextEditingController();
  final focusNode = FocusNode();
  bool writing = false;
  late ChatService chatService;
  late SocketProvider socketService;
  late AuthService authService;

  List<ChatMessage> messages = [];

  @override
  void initState() {
    super.initState();
    chatService = Provider.of<ChatService>(context, listen: false);
    socketService = Provider.of<SocketProvider>(context, listen: false);
    authService = Provider.of<AuthService>(context, listen: false);
    _loadChats();
    socketService.soket.on('personal-message', _handleProcessMessage);
  }

  @override
  void dispose() {
    socketService.soket.off('personal-message');
    for (var message in messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }

  void _loadChats() async  {
    // await Future.delayed(const Duration(milliseconds: 1000));
    final chatResponse = await chatService.getMessages(chatService.userTo.uuid);

    messages = chatResponse.map((data){
      return ChatMessage(
      uuid: data.from,
      message: data.message,
      animationController: AnimationController(vsync: this, duration: const Duration(milliseconds: 200))..forward()
      );},).toList();
    setState(() {});
  }

  _handleProcessMessage(dynamic message) {
    final newMessage = ChatMessage(
      animationController: AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 200),
      ),
      uuid: message['from'],
      message: message['message'],
    );
    print(message);
    setState(() {
      messages.insert(0, newMessage);
      newMessage.animationController.forward();
    });
  }



  @override
  Widget build(BuildContext context) {
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
      height: MediaQuery.of(context).size.height * 0.08,
      color: Colors.white,
      child: SafeArea(child: 
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Expanded(child: TextField(
                controller: textController,
                onSubmitted: _handleSubmitText,
                onChanged: (value) {
                  print(value);
                  writing = value.isNotEmpty && value.trim() != '' ? true : false;
                  setState(() {});
                },
                decoration: const InputDecoration.collapsed(
                  hintText: 'Enviar mensage'
                ),
                focusNode: focusNode,
              )),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child:
                    Platform.isIOS
                        ? CupertinoButton(
                          onPressed:
                              writing
                                  ? () => _handleSubmitText(textController.text)
                                  : null,
                          child: const Text('Enviar'),
                        )
                        : IconTheme(
                          data: IconThemeData(color: Colors.blue[400]),
                          child: IconButton(
                            onPressed:
                                writing
                                    ? () =>
                                        _handleSubmitText(textController.text)
                                    : null,
                            icon: const Icon(Icons.send),
                          ),
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

      final newMessage = ChatMessage(uuid: authService.user!.uuid, message: text, animationController: AnimationController(vsync: this, duration: const Duration(milliseconds: 200)));
      messages.insert(0, newMessage);
      newMessage.animationController.forward();
      socketService.soket.emit('personal-message', {
        'from': authService.user!.uuid,
        'to': chatService.userTo.uuid,
        'message': text
      });
    }
    textController.clear();
    focusNode.requestFocus();
    setState(() {
      writing = false;
    });
  }

}
