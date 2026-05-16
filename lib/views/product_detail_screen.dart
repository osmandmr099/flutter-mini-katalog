import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../services/cart_service.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      product.imageUrl ?? '',
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) =>
                          const SizedBox(height: 250, child: Center(child: Icon(Icons.broken_image, size: 50))),
                    ),
                  ),
                  const SizedBox(height: 24),

                  Text(
                    product.title ?? 'Product Name',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  if (product.tagline != null && product.tagline!.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      product.tagline!,
                      style: const TextStyle(color: Colors.grey, fontSize: 16, fontStyle: FontStyle.italic),
                    ),
                  ],

                  const SizedBox(height: 16),
                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.description ?? 'No description available.',
                    style: const TextStyle(color: Colors.grey, fontSize: 14, height: 1.5),
                  ),

                  if (product.specs != null && product.specs!.isNotEmpty) ...[
                    const SizedBox(height: 24),
                    const Text(
                      'Specifications',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    ...product.specs!.entries.map((entry) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Row(
                            children: [
                              Text('${entry.key.toUpperCase()}: ',
                                  style: const TextStyle(fontWeight: FontWeight.bold)),
                              Expanded(child: Text(entry.value.toString())),
                            ],
                          ),
                        )),
                  ],
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () async {
                  final messenger = ScaffoldMessenger.of(context);
                  globalCart.add(product);
                  await CartService.saveCart(globalCart);
                  messenger.showSnackBar(
                    SnackBar(content: Text('${product.title} added to cart!')),
                  );
                },
                child: Text(
                  'Buy Now for \$${product.price}',
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
