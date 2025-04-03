import 'package:flutter/material.dart';
import 'package:teslo_shop/features/products/domains/domain.dart';

class ListProducts extends StatelessWidget {
  final Product product;

  const ListProducts({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(20),
          //   child: Image.network(
          //     product.images[0],
          //     height: 250,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          _ImageViewer(images: product.images,),
          SizedBox(
            height: 10,
          ),
          Text(product.title)
        ],
      ),
    );
  }
}

class _ImageViewer extends StatelessWidget {
  final List<String> images;

  const _ImageViewer({required this.images});

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'assets/images/no-image.jpg',
          fit: BoxFit.cover,
          height: 250,
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: FadeInImage(
        fit: BoxFit.cover,
        height: 250,
        fadeOutDuration: const Duration(milliseconds: 100),
        fadeInDuration: const Duration(milliseconds: 200),
        image: NetworkImage(images.first),
        placeholder: const AssetImage('assets/loaders/loader.gif'),
      ),
    );
  }
}
