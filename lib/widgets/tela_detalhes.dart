import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:segunda_prova/domain/coffee.dart';
import 'package:segunda_prova/helpers/coffee_helper.dart';
import 'package:segunda_prova/widgets/tela_altera.dart';

class TelaDetalhes extends StatefulWidget {

  final int id;
  
  const TelaDetalhes({super.key, required this.id});

  @override
  State createState() => _TelaDetalhesState();
}

class _TelaDetalhesState extends State<TelaDetalhes> {
  bool updated = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Tipos de Café"), 
        backgroundColor: const Color(0xFFe38542),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          height: 300.0,
          decoration: BoxDecoration(
            
            color: const Color.fromARGB(255, 65, 35, 14),
            borderRadius: BorderRadius.circular(10.0), 
          ),
          child: FutureBuilder(
            future: carregarId(), //RESPOSTA DA QUESTÃO 7
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Erro pegando o snapshot em detalhes: ${snapshot.error}');
              } else {
                Coffee coffee = snapshot.data as Coffee;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  
                    Text(
                      'ID: ${coffee.id}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Nome do Café: ${coffee.name}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        
                      ),
                    ),
                    Text(
                      'Preço: ${coffee.price}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                    Text(
                      'Tipo de Torra: ${coffee.roast}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                    Text(
                      'Descrição Sensorial: ${coffee.sensory}',
                      style:const TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                    
                      ),
                    ),
                    Text(
                      'Região: ${coffee.region}',
                      style:const  TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                      
                      await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TelaAltera(id: coffee.id)),
                      );

                    
              
                    },
                    child: const Text("Detalhes")
                  ),
                  ],
                  

                );
              }
            },            
          )
        ),
      )
    );
      
  }
   Future<Coffee?> carregarId() async {
    Coffee? coffee = await CoffeeHelper().getCoffee(widget.id);

    coffee = await CoffeeHelper().getCoffee(widget.id);
    return coffee;
    }
}
