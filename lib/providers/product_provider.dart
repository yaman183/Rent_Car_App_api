import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product_model.dart';
import '../services/product_api_service.dart';

final productApiServiceProvider = Provider<ProductApiService>((ref) {
  return ProductApiService();
});

final productListProvider = FutureProvider<List<ProductModel>>((ref) async {
  final service = ref.read(productApiServiceProvider);
  return service.fetchProducts();
});