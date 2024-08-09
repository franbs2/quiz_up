import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var perguntaSelecionada = 0;

  final List<String> questions = [
    'Qual é a capital do Brasil?',
    'Qual é o maior planeta do sistema solar?',
    'Qual é o maior animal terrestre?',
    'Qual é o maior oceano do mundo?',
    'Qual é o maior país do mundo?',
    'Qual é o menor planeta do sistema solar?',
    'Qual é o menor país do mundo?',
  ];

  void responderPergunta() {
    setState(() {
      if (perguntaSelecionada < questions.length - 1) {
        perguntaSelecionada++;
      } else {
        perguntaSelecionada = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Up'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Duvido você acertar essa pergunta!',
            ),
            const SizedBox(height: 20),
            Text(questions[perguntaSelecionada]),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: responderPergunta,
              child: const Text('Resposta 1'),
            ),
          ],
        ),
      ),
    );
  }
}
