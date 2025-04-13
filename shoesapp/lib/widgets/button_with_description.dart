import 'package:flutter/material.dart';
import 'package:shoesapp/widgets/custom_button.dart';

class ButtonWithDescription extends StatelessWidget {
  final double price;
  final String text;
  final VoidCallback? onTap;
  final bool addBackground;

  const ButtonWithDescription({super.key, required this.price, required this.text, this.onTap, this.addBackground = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: addBackground ? BoxDecoration(
          color: const Color(0x3C9E9E9E),
          borderRadius: BorderRadius.circular(100),
        ) : null,
        child: Row(
          children: [
            const SizedBox(width: 10,),
            Text(
              '\$ $price',
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            CustomButton(text: text, onTap: onTap,),
            const SizedBox(width: 10,)
          ],
        ),
      ),
    );
  }
}
