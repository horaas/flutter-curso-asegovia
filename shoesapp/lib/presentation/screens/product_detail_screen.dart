import 'package:flutter/material.dart';
import 'package:shoesapp/widgets/button_with_description.dart';
import 'package:shoesapp/widgets/custom_button.dart';
import 'package:shoesapp/widgets/shoe_description.dart';
import 'package:shoesapp/widgets/shoe_size_preview.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ShoeSizePreview(isFullScreen: true),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const ShoeDescription(title: 'Nike Air Max 720', description: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",),
                  const ButtonWithDescription(price: 180, text: 'Buy now', addBackground: false),
                  _ColorsReferences(),
                  _ButtonsContainer()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ColorsReferences extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        // color: Color(0x3C9E9E9E),
        borderRadius: BorderRadius.circular(50),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: 90,
                  child: _ButtonCircularColors(Color(0xFFCCDD3D)),
                ),
                Positioned(
                  left: 60,
                  child:  _ButtonCircularColors(Color(0xFFFF9e00))
                ),
                Positioned(
                  left: 30,
                  child:  _ButtonCircularColors(Color(0xFF3AA8F7))
                ),
                Positioned(
                  child:  _ButtonCircularColors(Color(0xFF435560))
                ),
              ],
            ),
          ),
          CustomButton(text: 'More related item', color: Color(0xFFFFCC7A), height: 5,),
         ],
      ),
    
    );
  }
}

class _ButtonCircularColors extends StatelessWidget {
  final Color color;
  const _ButtonCircularColors(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
      ),
    );
  }
}


class _ButtonsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: () {
              
            }, icon: const Icon(Icons.favorite), color: Colors.red,
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.green),
                padding: WidgetStatePropertyAll(
                  EdgeInsets.all(15),
                ),
              )),
            IconButton(onPressed: () {
              
            }, icon: const Icon(Icons.shopping_cart), style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.green),
                padding: WidgetStatePropertyAll(
                  EdgeInsets.all(15),
                ),
              )),
            IconButton(onPressed: () {
              
            }, icon: const Icon(Icons.settings), style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.green),
                padding: WidgetStatePropertyAll(
                  EdgeInsets.all(15),
                ),
              )),
          ],
        ),
      
      ),
    );
  }
}
