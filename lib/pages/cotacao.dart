import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CotacaoPage extends StatefulWidget {
  const CotacaoPage({super.key});

  @override
  State<CotacaoPage> createState() => _CotacaoPageState();
}

class _CotacaoPageState extends State<CotacaoPage> {
  Future<Map> getData() async {
    var url =
        Uri.parse('https://api.hgbrasil.com/finance?format=json&key=801a9dce');
    http.Response response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return json.decode(response.body);
  }

  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();
  double dolar = 0.0;
  double euro = 0.0;

  VoidCallback? _realChanged(String text) {
    double real = double.parse(text);
    print('Mudou o valor do real,novo valor eh $real');

    dolarController.text = (real / dolar).toStringAsFixed(2);

    euroController.text = (real / euro).toStringAsFixed(2);
  }

  VoidCallback? _dolarChanged(String text) {
    double dolar = double.parse(text);
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
  }

  VoidCallback? _euroChanged(String text) {
    double euro = double.parse(text);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dolarController.text = (euro * this.euro / dolar).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cotacao page'),
      ),
      body: FutureBuilder<Map>(
        future: getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:

            case ConnectionState.waiting:
              return const Center(
                child: Text(
                  'Loading...',
                  textAlign: TextAlign.center,
                ),
              );
            default:
              if (snapshot.hasError) {
                String? erro = snapshot.error.toString();
                return Center(
                  child: Text(
                    "Ops, houve uma falha ao buscar os dados : $erro",
                    style: const TextStyle(color: Colors.green, fontSize: 25.0),
                    textAlign: TextAlign.center,
                  ),
                );
              } else {
                dolar = snapshot.data!["results"]["currencies"]["USD"]["buy"];
                euro = snapshot.data!["results"]["currencies"]["EUR"]["buy"];

                return SingleChildScrollView(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Icon(Icons.attach_money,
                          size: 180.0, color: Colors.green),
                      campoTexto("Reais", "R\$ ", realController, _realChanged),
                      const Divider(),
                      campoTexto("Euros", "€ ", euroController, _euroChanged),
                      const Divider(),
                      campoTexto(
                          "Dólares", "US\$ ", dolarController, _dolarChanged),
                      const Divider(),
                    ],
                  ),
                );
              }
          }
        },
      ),
    );
  }
}

Widget campoTexto(
    String label, String prefix, TextEditingController c, Function? f) {
  return TextField(
    controller: c,
    decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.green),
        border: const OutlineInputBorder(),
        prefixText: prefix),
    style: const TextStyle(color: Colors.green, fontSize: 25.0),
    onChanged: (value) => {f!(value)},
    keyboardType: const TextInputType.numberWithOptions(decimal: true),
  );
}
