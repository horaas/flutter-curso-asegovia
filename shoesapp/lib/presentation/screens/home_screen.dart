import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'For You',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        actions: [
          const Icon(Icons.search, size: 30, color: Colors.black),
          SizedBox(width: 25),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _ContainerImage(),
            _TextDescription(),
            _PriceDescription(),
          ],
        ),
      ),
    );
  }
}

class _ContainerImage extends StatelessWidget {
  const _ContainerImage();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        height: 450,
        margin: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Color(0xFFFFD54F),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/imgs/azul.png', height: 300),
            SizedBox(height: 20),
            _SizesList(),
          ],
        ),
      ),
    );
  }
}

class _SizesList extends StatelessWidget {
  const _SizesList();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        _SizeItem('7'),
        _SizeItem('7.5'),
        _SizeItem('8'),
        _SizeItem('8.5'),
        _SizeItem('9', true),
        _SizeItem('9.5'),
        Spacer(),
      ],
    );
  }
}

class _SizeItem extends StatelessWidget {
  final String size;
  final bool isSelected;
  const _SizeItem(this.size, [this.isSelected = false]);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(3),
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFFFF9e00) : Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Color(0xFFFF9e00), blurRadius: 10, spreadRadius: -2),
        ],
      ),
      child: Text(
        size,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.orange,
          fontSize: 15,
          fontWeight: FontWeight.bold,
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
