import 'package:teslo_shop/features/products/domains/domain.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductsDatasource dataSource;

  ProductRepositoryImpl(this.dataSource);

  @override
  Future<Product> createProduct(Map<String, dynamic> productList) {
    return dataSource.createProduct(productList);
  }

  @override
  Future<List<Product>> getAllProducts({int limit = 10, int iffset = 0}) {
    return dataSource.getAllProducts(limit: limit, iffset: limit);
  }

  @override
  Future<Product> getProductById(String idProduct) {
    return dataSource.getProductById(idProduct);
  }

  @override
  Future<List<Product>> searchByTerm(String term) {
    return dataSource.searchByTerm(term);
  }
}
