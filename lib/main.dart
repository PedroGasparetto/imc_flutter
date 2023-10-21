import 'package:flutter/material.dart';
import 'package:imc/Classes/Pessoa.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    theme: ThemeData(
      primaryColor: Colors.purple, // Define a cor primária como lilás.
    ),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<IMC> imcList = [];
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: pesoController,
                  decoration: InputDecoration(labelText: 'Peso (kg)'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
                TextField(
                  controller: alturaController,
                  decoration: InputDecoration(labelText: 'Altura (m)'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
                ElevatedButton(
                  onPressed: () {
                    calcularIMC();
                  },
                  child: Text('Calcular IMC'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: imcList.length,
              itemBuilder: (context, index) {
                final imc = imcList[index];
                final resultado =
                    (imc.peso / (imc.altura * imc.altura)).toStringAsFixed(2);
                return ListTile(
                  title: Text('IMC: $resultado',
                      style: TextStyle(color: Colors.purple, fontSize: 20)),
                  subtitle: Text('Classificação: ${imc.classificacao}',
                      style: TextStyle(fontSize: 16)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void calcularIMC() {
    double peso = double.tryParse(pesoController.text) ?? 0.0;
    double altura = double.tryParse(alturaController.text) ?? 0.0;

    if (peso > 0 && altura > 0) {
      IMC novoIMC = IMC(peso: peso, altura: altura);
      setState(() {
        imcList.add(novoIMC);
      });
      pesoController.clear();
      alturaController.clear();
    }
  }
}
