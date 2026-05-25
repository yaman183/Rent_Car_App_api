import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/product_list_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: RiverCartApiApp(),
    ),
  );
}

class RiverCartApiApp extends StatelessWidget {
  const RiverCartApiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'River Cart API',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const ProductListScreen(),
    );
  }
}