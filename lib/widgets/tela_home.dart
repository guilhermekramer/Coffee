
import 'package:flutter/material.dart';

class TelaHome extends StatelessWidget {

  

const TelaHome({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tipos de Café"),
        backgroundColor: const Color(0xFFe38542),
      ),
    );
  }
}