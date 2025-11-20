import 'package:flutter/material.dart';
import 'product.dart';

class Atelier4 extends StatefulWidget {
  const Atelier4({super.key});

  @override
  _Atelier4State createState() => _Atelier4State();
}

class _Atelier4State extends State<Atelier4> {
  int? openedIndex;

  final List<Product> products = [
    Product("iPhone 15", 999.0, "assets/iphone-15.jpg", isNew: true, rating: 4.5),
    Product("Samsung Galaxy", 799.0, "assets/samsung.jpg", rating: 4.2),
    Product("Google Pixel", 699.0, "assets/google.jpg", rating: 4.7),
  ];

  // ------------------------------ CART RECAP BOTTOM SHEET ------------------------------
  void showCartRecap() {
    final int articles = products.length;
    final double total = products.fold(0, (sum, p) => sum + p.price);

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(18),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Récapitulatif Panier",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 14),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Articles:", style: TextStyle(fontSize: 16)),
                  Text("$articles",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),

              const SizedBox(height: 8),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total:", style: TextStyle(fontSize: 16)),
                  Text("${total.toStringAsFixed(2)}€",
                      style: const TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )),
                ],
              ),

              const SizedBox(height: 26),

              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  child: Text("Fermer",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  // ------------------------------ MAIN PAGE UI ------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nos Produits"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: showCartRecap,
            icon: const Icon(Icons.shopping_cart_outlined,
                color: Colors.deepPurple),
          ),
        ],
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final p = products[index];
          final isOpen = openedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                openedIndex = isOpen ? null : index;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.only(bottom: 14),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ---------------- HEADER ----------------
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          p.image,
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                if (p.isNew)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: const Text("NEW",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12)),
                                  ),
                                const SizedBox(width: 6),
                                Text(p.name,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Icon(Icons.star,
                                    color: Colors.amber, size: 18),
                                const SizedBox(width: 4),
                                Text(p.rating.toString()),
                                const SizedBox(width: 10),
                                Text("${p.price}€",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Icon(
                        isOpen
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        size: 28,
                        color: Colors.deepPurple,
                      )
                    ],
                  ),

                  // ------------- DETAILS WHEN OPENED ----------------
                  if (isOpen) ...[
                    const SizedBox(height: 16),
                    const Text("Description",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 6),
                    const Text(
                      "Découvrez le ${''} , un produit haute performance conçu pour répondre à tous vos besoins. "
                      "Design élégant et fonctionnalités avancées pour une expérience exceptionnelle.",
                      style: TextStyle(color: Colors.black87),
                    ),
                    const SizedBox(height: 12),

                    const Text("Spécifications",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 6),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Écran"),
                        Text("6.1 pouces Super Retina XDR"),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Processeur"),
                        Text("A16 Bionic"),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Mémoire"),
                        Text("128 GB"),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Batterie"),
                        Text("Jusqu’à 20h de vidéo"),
                      ],
                    ),
                  ]
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
