import 'package:flutter/material.dart';
import 'product_data.dart';
import 'cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nos Produits"),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CartPage()),
              );
            },
          ),
        ],
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.70,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
        ),
        itemCount: products.length,
        itemBuilder: (_, index) {
          final p = products[index];

          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),

            child: Column(
              children: [
                const SizedBox(height: 10),
                Image.asset(p.image, height: 110),
                const SizedBox(height: 10),

                Text(
                  p.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),

                Text("${p.price} TND",
                    style: const TextStyle(fontSize: 15, color: Colors.green)),

                const SizedBox(height: 10),

                ElevatedButton(
                  onPressed: () {
                    CartPage.cartItems.add(p);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("${p.name} ajouté au panier")),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text("Ajouter au panier"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
