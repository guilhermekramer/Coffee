import 'package:flutter/material.dart';
import 'package:segunda_prova/domain/coffee.dart';
import 'package:segunda_prova/helpers/coffee_helper.dart';
import 'package:segunda_prova/widgets/tela_detalhes.dart';
import 'package:segunda_prova/widgets/tela_home.dart';

class TelaAltera extends StatefulWidget {
  final int id;

  const TelaAltera({Key? key, required this.id}) : super(key: key);

  @override
  _TelaAlteraState createState() => _TelaAlteraState();
}

class _TelaAlteraState extends State<TelaAltera> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController roastController = TextEditingController();
  final TextEditingController sensoryController = TextEditingController();
  final TextEditingController regionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadCoffeeData();
  }

  Future<void> loadCoffeeData() async {
    Coffee? coffee = await CoffeeHelper().getCoffee(widget.id);

    if (coffee != null) {
      setState(() {
        nameController.text = coffee.name;
        priceController.text = coffee.price.toString();
        roastController.text = coffee.roast;
        sensoryController.text = coffee.sensory;
        regionController.text = coffee.region;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alterar Café"),
        backgroundColor: const Color(0xFFe38542),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nome do Café'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Digite um nome válido.";
                } else {
                  return null;
                }
              },
            ),
            TextFormField(
              controller: priceController,
              decoration: const InputDecoration(labelText: 'Preço médio do Grão'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Digite um preço médio válido.";
                } else {
                  return null;
                }
              },
            ),
            TextFormField(
              controller: roastController,
              decoration: const InputDecoration(labelText: 'Torra'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Digite uma torra válida.";
                } else {
                  return null;
                }
              },
            ),
            TextFormField(
              controller: sensoryController,
              decoration: const InputDecoration(labelText: 'Descrição Sensorial'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Digite uma descrição sensorial válida.";
                } else {
                  return null;
                }
              },
            ),
            TextFormField(
              controller: regionController,
              decoration: const InputDecoration(labelText: 'Região'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Digite uma região válida.";
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                  Coffee updatedCoffee = Coffee(nameController.text, double.parse(priceController.text), roastController.text, sensoryController.text, regionController.text );
                  CoffeeHelper().updateCoffee(updatedCoffee);

                  
                  print(updatedCoffee.id);
                  print(updatedCoffee.name);
                  print(updatedCoffee.region);
                  print(updatedCoffee.roast);

                  
                  
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TelaHome()
                    ),
    );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Café atualizado com sucesso!'),
                    ),
                  );
              },
              child: const Text('Confirmar'),
            ), 
            
          ],
        ),
      ),
    );
  }

}
