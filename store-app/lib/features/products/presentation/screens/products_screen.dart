import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
        onPressed: () {},
      ),
    );
  }
}


class _ProductsView extends StatelessWidget {
  const _ProductsView();

  @override
  Widget build(BuildContext context) {
    return Center(child: MasonryGridView.count(
      crossAxisCount: 2,
      itemCount: 10,
      itemBuilder: (context, index) {
        if (index == 1){
         return Column(children: [
            SizedBox(height: 30,),
            _ListProducts()
          ],);
        }
      return _ListProducts();
    },));
  }
}

class _ListProducts extends StatelessWidget {
  const _ListProducts();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network('https://assets-global.website-files.com/5ec7dad2e6f6295a9e2a23dd/6582f25642a96b818502c50d_Design.ai.jpg', height: 250, fit: BoxFit.cover,),
          ),
          SizedBox(height: 10,),
          Text('Descripcion del la imagen')
        ],
      ),
    );
  }
}