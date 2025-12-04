import 'package:flutter/material.dart';
import 'product.dart';

class Atelier4 extends StatefulWidget {
  const Atelier4({super.key});

  @override
  Atelier4State createState() => Atelier4State();
}

class Atelier4State extends State<Atelier4> {
  int? openedIndex;

  final List<Product> products = [
    Product("iPhone 15", 999.0, "assets/iphone-15.jpg", isNew: true, rating: 4.5),
    Product("Samsung Galaxy", 799.0, "assets/samsung.jpg", rating: 4.2),
    Product("Google Pixel", 699.0, "assets/google.jpg", rating: 4.7),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nos Produits"),
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
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                        child: Text(
                          p.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "${p.price} €",
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
