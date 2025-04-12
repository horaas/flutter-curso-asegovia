import 'package:flutter/material.dart';
import 'package:shoesapp/widgets/custom_button.dart';

class AddCartButton extends StatelessWidget {
  final double price;

  const AddCartButton({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: const Color(0x3C9E9E9E),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: [
            const SizedBox(width: 10,),
            Text(
              '\$ $price',
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            const CustomButton(text: 'Add to cart',),
            const SizedBox(width: 10,)
          ],
        ),
      ),
    );
  }
}
