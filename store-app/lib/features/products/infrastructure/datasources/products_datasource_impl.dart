import 'package:teslo_shop/features/products/domains/domain.dart';


class ProductsDatasourceImpl extends ProductsDatasource {
  @override
  Future<Product> createProduct(Map<String, dynamic> productList) {
    // TODO: implement createProduct
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getAllProducts({int limit = 10, int iffset = 0}) {
    // TODO: implement getAllProducts
    throw UnimplementedError();
  }

  @override
  Future<Product> getProductById(String idProduct) {
    // TODO: implement getProductById
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> searchByTerm(String term) {
    // TODO: implement searchByTerm
    throw UnimplementedError();
  }

}

