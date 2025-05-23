import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:teslo_shop/features/products/presentation/providers/products_provider.dart';
import 'package:teslo_shop/features/products/presentation/widgets/widgets.dart';
import 'package:teslo_shop/features/shared/shared.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      drawer: SideMenu( scaffoldKey: scaffoldKey ),
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon( Icons.search_rounded)
          )
        ],
      ),
      body: const _ProductsView(),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Nuevo producto'),
        icon: const Icon( Icons.add ),
        onPressed: () {
          context.push('/product/new');
        },
      ),
    );
  }
}


class _ProductsView extends ConsumerStatefulWidget {
  const _ProductsView();

  @override
  _ProductsViewState createState() => _ProductsViewState();
}

class _ProductsViewState extends ConsumerState<_ProductsView> {
  final ScrollController scrollController = ScrollController();


@override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if ((scrollController.position.pixels + 200) >= scrollController.position.maxScrollExtent) {
         ref.read(productsProvider.notifier).loadNextPage();
      }
    });

  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    final products = ref.watch(productsProvider).products;

    return Center(child: MasonryGridView.count(
      controller: scrollController,
      crossAxisCount: 2,
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        if (index == 1){
         return GestureDetector(
          onTap: () => context.push('/product/${product.id}'),
           child: Column(children: [
              SizedBox(height: 30,),
              ListProducts(product: product)
            ],),
         );
        }
      return GestureDetector(
          onTap: () => context.push('/product/${product.id}'),
          child: ListProducts(product: product,),);
    },));
  }
}
