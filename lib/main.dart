import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class CepManager {
  List<String> ceps = [];

  void addCep(String cep) {
    ceps.add(cep);
  }

  List<String> listCeps() {
    return ceps;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CepListScreen(),
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
    );
  }
}

class CepListScreen extends StatefulWidget {
  @override
  _CepListScreenState createState() => _CepListScreenState();
}

class _CepListScreenState extends State<CepListScreen> {
  final CepManager cepManager = CepManager();

  Future<void> addRandomCep() async {
    final randomCep = generateRandomCep();
    cepManager.addCep(randomCep);
    setState(() {}); // Atualiza a interface para refletir a adição do novo CEP
  }

  String generateRandomCep() {
    return 'CEP ${Random().nextInt(100000)}-${Random().nextInt(1000)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de CEPs'),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: ListView(
          children: cepManager.listCeps().map((cep) {
            return ListTile(
              title: Text(cep),
              subtitle: Center(
                child: Text(
                  cep,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addRandomCep,
        child: Icon(Icons.add),
      ),
    );
  }
}
