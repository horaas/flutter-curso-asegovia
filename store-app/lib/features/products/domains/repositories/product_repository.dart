
import '../entities/product.dart';

abstract class ProductRepository {

  Future<List<Product>> getAllProducts(String autorizationId);
  Future<Product> getProductById( String idProduct);

}

