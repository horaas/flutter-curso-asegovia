import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final outlinelineInputBorder = UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(15)
        );


    final inputDecoration = InputDecoration(
        enabledBorder: outlinelineInputBorder,
        focusedBorder: outlinelineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            print("obtener valor");
          },
        )
      );

    return TextFormField(
      decoration: inputDecoration,
      onFieldSubmitted:(value) {
        print(value);
      },
      onChanged: (value) {
        print(value);
      },
    );
  }
}