import 'package:flutter/material.dart';
import 'package:segunda_prova/widgets/tela_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Tipos de Café',
      debugShowCheckedModeBanner: false,
      home: const TelaHome(),
      theme: ThemeData(
        primaryColor: const Color(0xFF8B4513), // SaddleBrown
        hintColor: const Color(0xFFD2B48C),  // Tan
        scaffoldBackgroundColor: const Color(0xFFF5DEB3), // Wheat
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF8B4513),
        ),
      ),
    );
  }
}