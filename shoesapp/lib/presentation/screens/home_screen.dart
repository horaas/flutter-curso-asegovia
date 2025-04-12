import 'package:flutter/material.dart';
import 'package:shoesapp/widgets/add_cart_button.dart';
import 'package:shoesapp/widgets/custom_appbar_wiget.dart';
import 'package:shoesapp/widgets/shoe_description.dart';
import 'package:shoesapp/widgets/shoe_size_preview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomAppbarWiget(title: 'For You',),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ShoeSizePreview(),
                  ShoeDescription(title: 'Nike Air Max 720', description: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",),
                ],
              ),
            ),
          ),
          AddCartButton(price: 180,),
        ],
      ),
    );
  }
}
