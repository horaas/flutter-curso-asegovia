import 'package:flutter/material.dart';
import 'package:pelis_app/domain/entities/message.dart';

class MyMessageBublble extends StatelessWidget {
  final Message messageData;

  const MyMessageBublble({super.key, required this.messageData});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(15)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical:  10),
            child: Text(messageData.text, style: const TextStyle(color: Colors.white,)),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}