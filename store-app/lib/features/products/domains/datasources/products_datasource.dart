import '../entities/product.dart';

abstract class ProductsDatasource {

  Future<List<Product>> getAllProducts({int limit = 10, int iffset = 0});
  Future<Product> getProductById( String idProduct);
  Future<List<Product>> searchByTerm( String term);
  Future<Product> createProduct( Map<String, dynamic> productList);
}

