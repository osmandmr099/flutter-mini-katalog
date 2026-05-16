import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/product_model.dart';

class CartService {
  static const String _cartKey = 'cart_items';

  // Sepeti kaydet
  static Future<void> saveCart(List<ProductModel> cart) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> cartJson = cart.map((product) {
      return jsonEncode({
        'id': product.id,
        'title': product.title,
        'tagline': product.tagline,
        'description': product.description,
        'price': product.price,
        'imageUrl': product.imageUrl,
        'specs': product.specs,
      });
    }).toList();
    await prefs.setStringList(_cartKey, cartJson);
  }

  // Sepeti yükle
  static Future<List<ProductModel>> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? cartJson = prefs.getStringList(_cartKey);
    if (cartJson == null) return [];

    return cartJson.map((item) {
      final Map<String, dynamic> json = jsonDecode(item);
      return ProductModel(
        id: json['id'],
        title: json['title'],
        tagline: json['tagline'],
        description: json['description'],
        price: json['price'],
        imageUrl: json['imageUrl'],
        specs: json['specs'] != null ? Map<String, dynamic>.from(json['specs']) : null,
      );
    }).toList();
  }

  // Sepeti temizle
  static Future<void> clearCart() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_cartKey);
  }
}
