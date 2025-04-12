import 'package:flutter/material.dart';
import 'package:shoesapp/widgets/custom_button.dart';

class AddCartButton extends StatelessWidget {
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
        child: const Row(
          children: [
            SizedBox(width: 10,),
            Text(
              '\$180.0',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            CustomButton(),
            SizedBox(width: 10,)
          ],
        ),
      ),
    );
  }
}
