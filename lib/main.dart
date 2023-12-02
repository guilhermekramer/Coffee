import 'package:flutter/material.dart';
import 'package:segunda_prova/widgets/tela_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Meu Aplicativo',
      home: TelaHome(),
    );
  }
}



