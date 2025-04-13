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
          Stack(
            children: [
              const Hero(
                tag: 'widget-shoe-1',
                child: ShoeSizePreview(isFullScreen: true)
                ),
              Positioned(
                top: 100,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.chevron_left, size: 60, color: Colors.white),
                ),
              ),
            ],
          ),
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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const _ButtonShadowCircle(icon: Icon(Icons.favorite, color: Colors.red,),),
          _ButtonShadowCircle(icon: Icon(Icons.shopping_cart, color: Colors.grey.withValues(alpha: 0.5),),),
          _ButtonShadowCircle(icon: Icon(Icons.settings, color: Colors.grey.withValues(alpha: 0.5),),),
        ],
      ),
    
    );
  }
}

class _ButtonShadowCircle extends StatelessWidget {
  final Icon icon;
  final double size;
  final Color backgroundColor;
  final Function? onTap;

  const _ButtonShadowCircle({required this.icon, this.size = 50, this.onTap, this.backgroundColor = Colors.white,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        boxShadow: [
           const BoxShadow(
            color: Colors.black12, blurRadius: 20, spreadRadius: -5, offset: Offset(0, 10)
          )
        ], 
      ),
      child: icon,
    );
  }
}
