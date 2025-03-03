import 'package:flutter/material.dart';

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
      body: _ChatView(),
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
                  itemCount: 10,
                  itemBuilder: (contex, index) {
                  return Text("indice $index");
                },)
                ),
            const Text("mundo")
          ],
        ),
      ),
    );
  }
}
