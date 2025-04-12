import 'package:flutter/material.dart';
import 'package:shoesapp/widgets/custom_appbar_wiget.dart';
import 'package:shoesapp/widgets/shoe_size_preview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppbarWiget(title: 'For You',),
            ShoeSizePreview(),
            _TextDescription(),
            _PriceDescription(),
          ],
        ),
      ),
    );
  }
}

class _TextDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 30, right: 30),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Nike Air Max 720',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
              style: TextStyle(fontSize: 17, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

class _PriceDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0x3C9E9E9E),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$ 180.0',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Color(0xFFFF9e00)),
                padding: WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 35, vertical: 12),
                ),
              ),
              child: const Text(
                'Add to cart',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
