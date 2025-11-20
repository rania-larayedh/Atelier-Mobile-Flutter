import 'package:flutter/material.dart';
import 'atelier4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Atelier 4 & 5',
      home: Atelier4(),
    );
  }
}
