import 'package:flutter/material.dart';
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
        title: const Text("Tipos de Café"), //appbar do projeto, ajeitar fonte
        backgroundColor: const Color(0xFFe38542),
      ),
      body: Container(
          margin: const EdgeInsets.all(10.0),
          color: Colors.amber[600],
          child: FutureBuilder(
            future: _loadData(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return const CircularProgressIndicator();
              }else if (snapshot.hasError) {
                
                return Text('Erro pegando o snapshot em detalhes: ${snapshot.error}');
              }else {
                
                Coffee coffee = snapshot.data as Coffee;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('ID: ${coffee.id}'),
                    Text('Nome do Café: ${coffee.name}'),
                    Text('Preço: ${coffee.price}'),
                    Text('Tipo de Torra: ${coffee.roast}'),
                    Text('Descrição Sensorial: ${coffee.sensory}'),
                    Text('Região: ${coffee.region}'),
                    ElevatedButton(
                      onPressed: () async {
                      
                      await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TelaAltera(id: coffee.id)),
                      );

                    
                      /* if (coffee) {
                        setState(() {
                          updated = false;
                        });
                        _loadData();
                      } */
                    },
                    child: const Text("Detalhes")
                  ),
                  ],
                  

                );
              }
            },            
          )
        ),
    );
      
  }
   Future<Coffee?> _loadData() async {
    Coffee? coffee = await CoffeeHelper().getCoffee(widget.id);

    coffee = await CoffeeHelper().getCoffee(widget.id);
    return coffee;
    }
}
