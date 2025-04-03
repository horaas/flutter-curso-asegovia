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
  Future<Product> createProduct(Map<String, dynamic> productList) async {
    try {
      final String? productId = productList['id'];
      final String method = productId == null ? 'POST' : 'PATCH';
      final String url = productId == null ? '/products' : '/products/$productId';
      productList.remove('id');

      productList['images'] = await _uploadPhotos(productList['images']);

      final response = await dio.request(url,
          data: productList, options: Options(method: method));

      final product = ProductMapper.productJsonToEntity(response.data);

      return product;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) throw ProductNotFound();

      throw Exception();
    } catch (e) {
      throw Exception();
    }
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
  Future<Product> getProductById(String idProduct) async {
    try {
      final response = await dio.get('/products/$idProduct');

      final product = ProductMapper.productJsonToEntity(response.data);

      return product;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) throw ProductNotFound();

      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<List<Product>> searchByTerm(String term) {
    // TODO: implement searchByTerm
    throw UnimplementedError();
  }

    Future<List<String>> _uploadPhotos( List<String> photos ) async {
    
    final photosToUpload = photos.where((element) => element.contains('/') ).toList();
    final photosToIgnore = photos.where((element) => !element.contains('/') ).toList();
    final List<Future<String>> uploadJob = photosToUpload.map(_uploadFile).toList();

    final newImages = await Future.wait(uploadJob);
    
    return [...photosToIgnore, ...newImages ];
  }

  Future<String> _uploadFile( String path ) async {

    try {

      final fileName = path.split('/').last;
      final FormData data = FormData.fromMap({
        'file': MultipartFile.fromFileSync(path, filename: fileName)
      });

      final respose = await dio.post('/files/product', data: data );

      return respose.data['image'];

    } catch (e) {
      throw Exception();
    }


  }
}
