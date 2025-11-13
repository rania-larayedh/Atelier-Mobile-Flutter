import 'package:flutter/material.dart';

// Modèle de données Product
class Product {
  final String name;
  final double price;
  final String image;
  final double rating;

  const Product(this.name, this.price, this.image, this.rating);
}

// Page de liste de produits
class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  final List<Product> products = const [
    Product('iPhone 15', 4200, 'assets/iphone-15.jpg', 4.5),
    Product('Galaxy S24', 3900, 'assets/google.jpg', 4.0),
    Product('Pixel 8', 3500, 'assets/samsung.jpg', 4.2),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Atelier 4 - Liste de produits')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index]; // Le produit sélectionné

          return Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                // Navigation + passage du produit au constructeur
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(product: product),
                  ),
                );
              },
              child: ListTile(
                leading: Image.asset(product.image, width: 50, height: 50),
                title: Text(product.name),
                subtitle: Text('${product.price.toStringAsFixed(2)} DT'),
                trailing: const Icon(Icons.chevron_right),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Page de détails du produit
class ProductDetailPage extends StatelessWidget {
  // Le produit reçu en paramètre
  final Product product;

  // Constructeur avec paramètre obligatoire
  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(product.image, height: 200),
            const SizedBox(height: 16),
            Text(
              product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('${product.price.toStringAsFixed(2)} DT'),
            const SizedBox(height: 8),
            Text('⭐ ${product.rating}'),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text('Retour à la liste'),
            ),
          ],
        ),
      ),
    );
  }
}


