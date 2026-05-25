import 'product_model.dart';

class ProductResponseModel {
  final List<ProductModel> products;

  const ProductResponseModel({
    required this.products,
  });

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) {
    return ProductResponseModel(
      products: (json['products'] as List)
          .map((item) => ProductModel.fromJson(item))
          .toList(),
    );
  }
}