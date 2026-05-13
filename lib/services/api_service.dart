import 'dart:convert';
import 'dart:io';
import '../models/product_model.dart';

class ApiService {
  static const String apiUrl = 'https://wantapi.com/products.php';

  static Future<List<ProductModel>> fetchProducts() async {
    try {
      HttpClient client = HttpClient();
      HttpClientRequest request = await client.getUrl(Uri.parse(apiUrl));
      HttpClientResponse response = await request.close();

      if (response.statusCode == 200) {
        String reply = await response.transform(utf8.decoder).join();
        
        Map<String, dynamic> jsonResponse = jsonDecode(reply);
        
        List<dynamic> productsList = jsonResponse['data']; 
        
        return productsList.map((data) => ProductModel.fromJson(data)).toList();
      } else {
        throw Exception('API Hatası: ${response.statusCode}');
      }
    } catch (e) {
      print('Veri çekilirken bir hata oluştu: $e');
      return [];
    }
  }
}