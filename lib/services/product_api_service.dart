import 'package:dio/dio.dart';

import '../models/product_model.dart';
import '../models/product_response_model.dart';

class ProductApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<List<ProductModel>> fetchProducts() async {
    try {
      final response = await _dio.get('/products?limit=20');

      final productResponse = ProductResponseModel.fromJson(response.data);

      return productResponse.products;
    } on DioException catch (error) {
      throw Exception(error.message ?? 'Network error');
    } catch (_) {
      throw Exception('Something went wrong');
    }
  }
}