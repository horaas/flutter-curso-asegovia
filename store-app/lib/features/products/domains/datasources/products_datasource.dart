import '../entities/product.dart';

abstract class ProductsDatasource {

  Future<List<Product>> getAllProducts(String autorizationId);
  Future<Product> getProductById( String idProduct);

}

