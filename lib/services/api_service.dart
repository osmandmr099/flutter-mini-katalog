import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/product_model.dart';

class ApiService {
  static const String apiUrl = 'https://wantapi.com/products.php';
  static const String _cacheKey = 'cached_products';
  static const String _cacheTimeKey = 'cache_time';
  static const int _cacheDurationMinutes = 10; // Cache 10 dakika geçerli

  static Future<List<ProductModel>> fetchProducts() async {
    final cached = await _loadFromCache();
    if (cached != null) return cached;

    try {
      HttpClient client = HttpClient();
      HttpClientRequest request = await client.getUrl(Uri.parse(apiUrl));
      HttpClientResponse response = await request.close();

      if (response.statusCode == 200) {
        String reply = await response.transform(utf8.decoder).join();
        Map<String, dynamic> jsonResponse = jsonDecode(reply);
        List<dynamic> productsList = jsonResponse['data'];
        final products = productsList
            .map((data) => ProductModel.fromJson(data))
            .toList();

        await _saveToCache(reply);

        return products;
      } else {
        throw Exception('API Hatası: ${response.statusCode}');
      }
    } catch (e) {
      return [];
    }
  }

  static Future<List<ProductModel>?> _loadFromCache() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cacheTime = prefs.getInt(_cacheTimeKey);
      final cacheData = prefs.getString(_cacheKey);

      if (cacheTime == null || cacheData == null) return null;

      final now = DateTime.now().millisecondsSinceEpoch;
      final diff = now - cacheTime;
      final isExpired = diff > _cacheDurationMinutes * 60 * 1000;

      if (isExpired) return null;

      Map<String, dynamic> jsonResponse = jsonDecode(cacheData);
      List<dynamic> productsList = jsonResponse['data'];
      return productsList.map((data) => ProductModel.fromJson(data)).toList();
    } catch (e) {
      return null;
    }
  }

  static Future<void> _saveToCache(String rawJson) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_cacheKey, rawJson);
    await prefs.setInt(_cacheTimeKey, DateTime.now().millisecondsSinceEpoch);
  }

  static Future<void> clearCache() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_cacheKey);
    await prefs.remove(_cacheTimeKey);
  }
}
