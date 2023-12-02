import 'package:flutter/material.dart';

class TelaSobre extends StatelessWidget {
  const TelaSobre({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre'),
        backgroundColor: const Color(0xFFe38542),
      ),
      body: const Center(
        child: Card(
          margin: EdgeInsets.all(16.0),
          elevation: 5.0,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Desenvolvido por: nahkra',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Time de Desenvolvimento:',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'João Nahmias é filho, amigo de Deus, natural do Amazonas, mas descobriu sua paixão pela programação em terras Potiguares. Especialista em Análise de Imagens, se arrisca na programação para dispositivos móveis.',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Guilherme Kramer é apenas um rapaz, latino americando sem dinheiro no banco, e vindo do interior ',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
