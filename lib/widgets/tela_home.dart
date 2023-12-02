import 'package:flutter/material.dart';
import 'package:segunda_prova/domain/coffee.dart';
import 'package:segunda_prova/helpers/coffee_helper.dart';
import 'package:segunda_prova/widgets/tela_altera.dart';
import 'package:segunda_prova/widgets/tela_cadastro.dart';
import 'package:segunda_prova/widgets/tela_detalhes.dart';
import 'package:segunda_prova/widgets/tela_sobre.dart';

class TelaHome extends StatelessWidget {
  const TelaHome({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tipos de Café",
          style: TextStyle( 
          fontSize: 20.0, 
          fontWeight: FontWeight.bold,    
        ),),
        
        backgroundColor: const Color(0xFFe38542),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0), // Ajuste a margem conforme necessário
            child: IconButton(
              icon: const Icon(Icons.info),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TelaSobre()),
                );
              },
            ),
          )
        ],
      ),
      body: FutureBuilder(
        future: CoffeeHelper().getAll(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Deu erro montando o snapshot: ${snapshot.error}');
          } else {
            List? coffeeList = snapshot.data;
            return ListView.builder(
              itemCount: coffeeList?.length ?? 0,
              itemBuilder: (context, index) {
                Coffee coffee = coffeeList![index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TelaDetalhes(id: coffee.id)),
                    );
                  },
                  onLongPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TelaAltera(id: coffee.id)),
                    );
                  },
                  child: Card(
                    color: const Color(0xFFe38542),
                    elevation: 2.0, // Ajuste a elevação conforme necessário
                    margin: const EdgeInsets.all(8.0), // Ajuste a margem conforme necessário
                    child: ListTile(
                      title: Text(coffee.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Preço: ${coffee.roast}'),
                          Text('Região: ${coffee.region}'),
                          Text('Notas: ${coffee.sensory}'),
                          
                        ],
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TelaDetalhes(id: coffee.id)),
                          );
                        },
                        child: const Text(
                          "Detalhes",
                          style: TextStyle(color: Colors.deepOrange),
                        ),
                      ),
                    ),
                ),);
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TelaCadastro()),
          );
        },
        backgroundColor: const Color(0xFFe38542),
        child: const Icon(Icons.add),
      ),
    );
  }
}

 