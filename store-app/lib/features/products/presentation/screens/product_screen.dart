import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teslo_shop/features/products/presentation/providers/products_provider.dart';

class ProductScreen extends ConsumerStatefulWidget {

  final String productId;

  const ProductScreen({ super.key, required this.productId });

  @override
  ProductState createState() => ProductState();
}

class ProductState extends ConsumerState<ProductScreen> {

  @override
  void initState() {
    super.initState();

    // ref.read(productsProvider.notifier).loadNextPage();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  
   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('aca va la linea del producto'),),
           body: Center(
            child: Text(widget.productId),
           ),
       );
  }
}