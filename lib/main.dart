import 'package:flutter/material.dart';
import 'product.dart';
import 'atelier3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final exampleProduct = Product(
      name: 'iPhone 17',
      price: 999.0,
      rating: 0.0,
      image: 'assets/iphone17.png', 
    );

    return MaterialApp(
      title: 'My atelier3 work',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: ProductDetailPage(product: exampleProduct),
    );
  }
}
