import 'dart:math';
import 'package:flutter/material.dart';

class CepManager {
  List<String> ceps = [];

  void addCep(String cep) {
    ceps.add(cep);
  }

  List<String> listCeps() {
    return ceps;
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CepManager cepManager = CepManager();

  @override
  void initState() {
    super.initState();
    loadRandomCeps();
  }

  void loadRandomCeps() {
    final random = Random();
    final numberOfCeps = random.nextInt(10) + 1; // Gere de 1 a 10 CEPs aleatórios

    for (int i = 0; i < numberOfCeps; i++) {
      final randomCep = generateRandomCep();
      cepManager.addCep(randomCep);
    }
  }

  String generateRandomCep() {
    return 'CEP ${Random().nextInt(100000)}-${Random().nextInt(1000)}';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CepListScreen(cepManager: cepManager),
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
    );
  }
}

class CepListScreen extends StatelessWidget {
  final CepManager cepManager;

  const CepListScreen({super.key, required this.cepManager});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de CEPs'),
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
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
