import 'package:flutter/material.dart';
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
  const _ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  itemCount: 50,
                  itemBuilder: (contex, index) {
                    return (index % 2 == 0) ? const HerMessageBublble() : const MyMessageBublble();
                },)
                ),
            const MessageFieldBox()
          ],
        ),
      ),
    );
  }
}
