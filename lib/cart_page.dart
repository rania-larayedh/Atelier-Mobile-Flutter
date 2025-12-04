import 'package:flutter/material.dart';
import 'product.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  static List<Product> cartItems = [];

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  double getTotal() {
    double total = 0;
    for (var p in CartPage.cartItems) {
      total += p.price * p.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Votre Panier"),
        backgroundColor: Colors.green,
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: CartPage.cartItems.length,
              itemBuilder: (_, index) {
                final product = CartPage.cartItems[index];

                return ListTile(
                  leading: Image.asset(product.image, width: 50, height: 50),
                  title: Text(product.name),
                  subtitle: Text("${product.price} TND"),

                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // MINUS
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (product.quantity > 1) {
                              product.quantity--;
                            }
                          });
                        },
                      ),

                      Text("${product.quantity}", style: const TextStyle(fontSize: 18)),

                      // PLUS
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            product.quantity++;
                          });
                        },
                      ),

                      // DELETE
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            CartPage.cartItems.removeAt(index);
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // TOTAL + BUTTON
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  "Total : ${getTotal().toStringAsFixed(2)} TND",
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Paiement en cours...")),
                    );
                  },
                  child: const Text("Payer", style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
