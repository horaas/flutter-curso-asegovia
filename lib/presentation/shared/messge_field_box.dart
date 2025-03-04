import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

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
            print("obtener valor ${controllerInput.value.text}");
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
        print(value);
        controllerInput.clear();
        focusNode.requestFocus();
      },
    );
  }
}
