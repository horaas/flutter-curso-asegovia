import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teslo_shop/features/auth/presentation/providers/providers.dart';
import 'package:teslo_shop/features/products/domains/domain.dart';
import 'package:teslo_shop/features/products/infrastructure/domain.dart';

final productsRepositoryProvider = Provider<ProductRepository>((ref) {
  
  final accessToken = ref.watch( authProvider ).user?.token ?? '';
  
  final productsRepository = ProductRepositoryImpl (
    ProductsDatasourceImpl(accessToken: accessToken )
  );

  return productsRepository;
});