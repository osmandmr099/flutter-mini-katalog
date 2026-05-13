class ProductModel {
  final int? id;
  final String? title;
  final String? tagline;
  final String? description;
  final String? price;
  final String? imageUrl;
  final Map<String, dynamic>? specs;

  ProductModel({
    this.id,
    this.title,
    this.tagline,
    this.description,
    this.price,
    this.imageUrl,
    this.specs,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    String rawPrice = json['price'] ?? '0';
    String cleanPrice = rawPrice.replaceAll('\$', '');

    return ProductModel(
      id: json['id'],
      title: json['name'], 
      tagline: json['tagline'],
      description: json['description'],
      price: cleanPrice,
      imageUrl: json['image'], 
      specs: json['specs'],
    );
  }
}
List<ProductModel> globalCart = [];