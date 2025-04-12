import 'package:flutter/material.dart';

class ShoeSizePreview extends StatelessWidget {

  const ShoeSizePreview({ super.key });

   @override
   Widget build(BuildContext context) {
       return _ContainerImage();
  }
}

class _ContainerImage extends StatelessWidget {
  const _ContainerImage();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: Container(
        width: 400,
        height: 430,
        // margin: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: const Color(0xFFFFD54F),
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _ShoeWhitShadow(),
            // SizedBox(height: 20),
            // _SizesList(),
          ],
        ),
      ),
    );
  }
}

class _ShoeWhitShadow extends StatelessWidget {
  const _ShoeWhitShadow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Stack(
        children: [
          Image.asset('assets/imgs/azul.png', height: 300),
        ],
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
