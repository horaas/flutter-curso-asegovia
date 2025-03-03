import 'package:flutter/material.dart';

class MyMessageBublble extends StatelessWidget {
  const MyMessageBublble({super.key});
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
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical:  10),
            child: Text("menos texto", style: TextStyle(color: Colors.white,)),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}