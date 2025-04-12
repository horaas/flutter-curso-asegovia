import 'package:flutter/material.dart';

class ShoeSizePreview extends StatelessWidget {

  const ShoeSizePreview({ super.key });

   @override
   Widget build(BuildContext context) {
       return const _ContainerImage();
  }
}

class _ContainerImage extends StatelessWidget {
  const _ContainerImage();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: Container(
        width: double.infinity,
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
            _SizesList(),
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
          const Positioned(
            top: 140,
            left: 15,
            child: _ShadowShoe()
          ),
          Image.asset('assets/imgs/azul.png'),
        ],
      ),
    );
  }
}

class _ShadowShoe extends StatelessWidget {
  const _ShadowShoe();

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -10,
      child: Container(
        width: 235,
        height: 100,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xFFEAA14E), blurRadius: 40
            )
          ]
        ),
      ),
    );
  }
}

class _SizesList extends StatelessWidget {
  const _SizesList();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _SizeItem(7),
        _SizeItem(7.5),
        _SizeItem(8),
        _SizeItem(8.5),
        _SizeItem(9, true),
        _SizeItem(9.5),
      ],
    );
  }
}

class _SizeItem extends StatelessWidget {
  final double size;
  final bool isSelected;
  const _SizeItem(this.size, [this.isSelected = false]);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(3),
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFFF9e00) : Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          const BoxShadow(color: Color(0xFFF1A23A), blurRadius: 10, offset: Offset(0, 5)),
        ],
      ),
      child: Text(
        size.toString().replaceAll('.0', ''),
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.orange,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
