import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final String image;
  final double rating;
  final bool isNew;
  final String description;
  final Map<String, String> specs;

  const Product({
    required this.name,
    required this.price,
    required this.image,
    required this.rating,
    this.isNew = false,
    this.description = '',
    this.specs = const {},
  });
}

class Atelier5Page extends StatefulWidget {
  const Atelier5Page({super.key});

  @override
  State<Atelier5Page> createState() => _Atelier5PageState();
}

class _Atelier5PageState extends State<Atelier5Page> {
  final List<Product> products = const [
    Product(
      name: 'iPhone 15',
      price: 4999,
      image: 'assets/iphone-15.jpg',
      rating: 4.9,
      isNew: true,
      description:
          'Découvrez le iPhone 15, un produit haute performance conçu pour répondre à tous vos besoins.',
      specs: {
        'Écran': '6.1 pouces Super Retina XDR',
        'Processeur': 'A16 Bionic',
        'Mémoire': '128 Go',
        'Batterie': 'Jusqu’à 20h de vidéo',
      },
    ),
    Product(
      name: 'Samsung Galaxy',
      price: 4799,
      image: 'assets/samsung.jpg',
      rating: 4.7,
    ),
    Product(
      name: 'Google Pixel',
      price: 4699,
      image: 'assets/google.jpg',
      rating: 4.7,
    ),
  ];

  int cartCount = 4;
  double totalPrice = 3196.00;

  void _showCartRecap() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                '🛒 Récapitulatif Panier',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text('Articles : $cartCount'),
              Text('Total : ${totalPrice.toStringAsFixed(2)} DT'),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Fermer'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f7f7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Nos Produits',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.deepPurple),
            onPressed: _showCartRecap,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final p = products[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(p.image, width: 70, height: 70),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    p.name,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                if (p.isNew)
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: const Text(
                                      'NEW',
                                      style: TextStyle(color: Colors.white, fontSize: 12),
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '⭐ ${p.rating}',
                              style: const TextStyle(color: Colors.orange),
                            ),
                            Text(
                              '${p.price.toStringAsFixed(2)} DT',
                              style: const TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (p.description.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    const Text(
                      'Description',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(p.description),
                  ],
                  if (p.specs.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    const Text(
                      'Spécifications',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    ...p.specs.entries.map((e) => Text('${e.key}: ${e.value}')),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
