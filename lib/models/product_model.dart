class ProductModel {
  final int id;
  final String name;
  final double price;
  final String image;

  const ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int,
      name: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      image: json['thumbnail'] as String,
    );
  }
}