import 'package:flutter/material.dart';
import 'package:segunda_prova/domain/coffee.dart';
import 'package:segunda_prova/helpers/coffee_helper.dart';
import 'package:segunda_prova/widgets/tela_home.dart';

class TelaCadastro extends StatelessWidget {
const TelaCadastro({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tipos de Café"),
        backgroundColor: const Color(0xFFe38542),
      ),
        body: const FormCadastro(),
    );
  }
}


class FormCadastro extends StatefulWidget {
  const FormCadastro({Key? key});

  @override
  State createState() => _FormCadastroState();
}

class _FormCadastroState extends State<FormCadastro> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController roastController = TextEditingController();
  final TextEditingController sensoryController = TextEditingController();
  final TextEditingController regionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column( //RESPOSTA QUESTÃO 5
        children: [
          TextFormField(
            //FALTA ESTILIZAR FALTA ESTILIZAR FALTA ESTILIZAR FALTA ESTILIZAR FALTA ESTILIZAR FALTA ESTILIZAR FALTA ESTILIZAR FALTA ESTILIZAR FALTA ESTILIZAR FALTA ESTILIZAR FALTA ESTILIZAR 
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Nome do Café'),
            validator:(value) {
              if(value == null) {return "adicione um nome pelo amor de deus";}else{return null;}
            },
          ),
          TextFormField(
            controller: priceController,
            decoration: const InputDecoration(labelText: 'Preço médio do Grão'),
            keyboardType: TextInputType.number,
            validator:(value) {
              if(value == null) {return "adicione um preço médio pelo amor de deus";}else{return null;}
            },
          ),
          TextFormField(
            controller: roastController,
            decoration: const InputDecoration(labelText: 'Torra'),
            validator:(value) {
              if(value == null) {return "adicione uma torra pelo amor de deus";}else{return null;}
            },
          ),
          TextFormField(
            controller: sensoryController,
            decoration: const InputDecoration(labelText: 'Descrição Sensorial'),
            validator:(value) {
              if(value == null) {return "adicione um sensory pelo amor de deus";}else{return null;}
            },
          ),
          TextFormField(
            controller: regionController,
            decoration: const InputDecoration(labelText: 'Região'),
            validator:(value) {
              if(value == null) {return "adicione uma região pelo amor de deus";}else{return null;}
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
               
              print('Nome do café: ${nameController.text}');
              print('Preço: ${priceController.text}');
              print('Tipo da Torra: ${roastController.text}');
              print('Descrição Sensorial: ${sensoryController.text}');
              print('Região: ${regionController.text}'); 
 

              Coffee entity = Coffee(nameController.text, double.parse(priceController.text), roastController.text, sensoryController.text, regionController.text );
      
              CoffeeHelper().saveCoffee(entity); 
              
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const TelaHome()),
                (route) => false,
              );

              ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Café Cadastrado com sucesso!'),
                    ),
              );
                           
            }, child: const Text('Cadastrar'),
        ),
        ],
      ),
    );
  }
}
