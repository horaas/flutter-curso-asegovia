import 'package:dio/dio.dart';
import 'package:teslo_shop/config/config.dart';
import 'package:teslo_shop/features/products/domains/domain.dart';
import 'package:teslo_shop/features/products/infrastructure/domain.dart';

class ProductsDatasourceImpl extends ProductsDatasource {
  late final Dio dio;
  final String accessToken;

  ProductsDatasourceImpl({required this.accessToken})
      : dio = Dio(BaseOptions(
            baseUrl: Environment.apiUrl,
            headers: {'Authorization': 'Bearer $accessToken'}));

  @override
  Future<Product> createProduct(Map<String, dynamic> productList) {
    // TODO: implement createProduct
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getAllProducts({int limit = 10, int iffset = 0}) async {
    final response =
        await dio.get<List>('/products?limit=$limit&offset=$iffset');
    final List<Product> products = [];
    for (final product in response.data ?? []) {
      products.add(ProductMapper.productJsonToEntity(product));
    }

    return products;
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
