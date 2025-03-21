import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teslo_shop/features/products/domains/domain.dart';

import 'products_repository_provider.dart';


final productsProvider = StateNotifierProvider<ProductsNotifier, ProductsState>((ref) {

  final productsRepository = ref.watch( productsRepositoryProvider );
  return ProductsNotifier(
    productsRepository: productsRepository
  );
  
});



class ProductsNotifier extends StateNotifier<ProductsState> {
  
  final ProductRepository productsRepository;

  ProductsNotifier({
    required this.productsRepository
  }): super( ProductsState() ) {
    loadNextPage();
  }

  Future loadNextPage() async {

    if ( state.isLoading || state.isLastPage ) return;

    state = state.copyWith( isLoading: true );


    final products = await productsRepository
      .getAllProducts(limit: state.limit, iffset: state.offset );

    if ( products.isEmpty ) {
      state = state.copyWith(
        isLoading: false,
        isLastPage: true
      );
      return;
    }

    state = state.copyWith(
      isLastPage: false,
      isLoading: false,
      offset: state.offset + 10,
      products: [...state.products, ...products ]
    );


  }

  Future getProductById(String productId) async {
    final product = await productsRepository
      .getProductById(productId);
  }
}


// El estate es como se requiere que se muestre o luzca informacion que vamos a mostrar 

class ProductsState {

  final bool isLastPage;
  final int limit;
  final int offset;
  final bool isLoading;
  final List<Product> products;

  ProductsState({
    this.isLastPage = false, 
    this.limit = 10, 
    this.offset = 0, 
    this.isLoading = false, 
    this.products = const[]
  });

  ProductsState copyWith({
    bool? isLastPage,
    int? limit,
    int? offset,
    bool? isLoading,
    List<Product>? products,
  }) => ProductsState(
    isLastPage: isLastPage ?? this.isLastPage,
    limit: limit ?? this.limit,
    offset: offset ?? this.offset,
    isLoading: isLoading ?? this.isLoading,
    products: products ?? this.products,
  );

}
