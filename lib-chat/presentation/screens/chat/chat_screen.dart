import 'package:flutter/material.dart';
import 'package:pelis_app/domain/entities/message.dart';
import 'package:provider/provider.dart';
import 'package:pelis_app/presentation/providers/chat_provider.dart';
import 'package:pelis_app/presentation/shared/messge_field_box.dart';
import 'package:pelis_app/presentation/widgets/chat/her_mesage_bubble.dart';
import 'package:pelis_app/presentation/widgets/chat/my_mesage_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://upload.wikimedia.org/wikipedia/commons/e/ea/Logo_Grupo_Imagen_Multimedia.2016.png"),
          ),
        ),
        title: const Text("prueba chat"),
        centerTitle: false,
      ),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();



    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  controller: chatProvider.chatScrollController,
                  itemCount: chatProvider.message.length,
                  itemBuilder: (contex, index) {
                    final message = chatProvider.message[index];
                    return (message.fromWho == FromWho.her ) ? HerMessageBublble(messageData: message,) : MyMessageBublble(messageData: message,);
                },)
                ),
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
            )
          ],
        ),
      ),
    );
  }
}
