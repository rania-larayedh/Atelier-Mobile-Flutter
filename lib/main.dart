import 'package:flutter/material.dart';
import 'atelier6.dart';
import 'cart_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),

      // FIRST SCREEN
      home: const HomePage(),

      // ROUTES
      routes: {
        '/cart': (context) => const CartPage(),
      },
    );
  }
}
