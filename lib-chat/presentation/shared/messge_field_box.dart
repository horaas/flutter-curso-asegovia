import 'package:flutter/material.dart';
import 'package:pelis_app/domain/entities/message.dart';
import 'package:provider/provider.dart';
import 'package:pelis_app/presentation/providers/chat_provider.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final controllerInput = TextEditingController();
    final focusNode = FocusNode();


    final outlinelineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(15));

    final inputDecoration = InputDecoration(
        hintText: 'End your text with a "??"',
        enabledBorder: outlinelineInputBorder,
        focusedBorder: outlinelineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            onValue(controllerInput.value.text);
            controllerInput.clear();
          },
        ));

    return TextFormField(
      controller: controllerInput,
      focusNode: focusNode,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        controllerInput.clear();
        focusNode.requestFocus();
        onValue(value);
      },
    );
  }
}
