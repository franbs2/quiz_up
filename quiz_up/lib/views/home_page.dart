import 'package:flutter/material.dart';
import 'package:quiz_up/widgets/answer_button.dart';
import 'package:quiz_up/widgets/section_questions_widget.dart';

import '../widgets/result_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
} 

class _HomePageState extends State<HomePage> {
  int _perguntaSelecionada = 0;
  int pontuacaoTotal = 0;

  final List<Map<String, Object>> questions = [
    //PERGUNTAS COM 5 RESPOSTAS
    {
      'texto': 'Qual é a capital do Brasil?',
      'resposta': [
        {'texto': 'Brasília', 'pontuacao': 10},
        {'texto': 'Rio de Janeiro', 'pontuacao': 1},
        {'texto': 'São Paulo', 'pontuacao': 1},
        {'texto': 'Belo Horizonte', 'pontuacao': 1},
        {'texto': 'Curitiba', 'pontuacao': 1}
      ]
    },
    {
      'texto': 'Qual o maior oceano do mundo?',
      'resposta': [
        {'texto': 'Pacifico', 'pontuacao': 10},
        {'texto': 'Atlântico', 'pontuacao': 1},
        {'texto': 'Índico', 'pontuacao': 1},
        {'texto': 'Ártico', 'pontuacao': 1},
        {'texto': 'Antártico', 'pontuacao': 1}
      ]
    },
    {
      'texto': 'Qual é o maior planeta do sistema solar?',
      'resposta': [
        {'texto': 'Júpiter', 'pontuacao': 10},
        {'texto': 'Saturno', 'pontuacao': 1},
        {'texto': 'Urano', 'pontuacao': 1},
        {'texto': 'Netuno', 'pontuacao': 1},
        {'texto': 'Terra', 'pontuacao': 1}
      ]
    },
    {
      'texto': 'Qual é o menor país do mundo?',
      'resposta': [
        {'texto': 'Vaticano', 'pontuacao': 10},
        {'texto': 'Mônaco', 'pontuacao': 1},
        {'texto': 'Nauru', 'pontuacao': 1},
        {'texto': 'Tuvalu', 'pontuacao': 1},
        {'texto': 'San Marino', 'pontuacao': 1}
      ]
    },
    {
      'texto': 'Qual é o maior deserto do mundo?',
      'resposta': [
        {'texto': 'Antártico', 'pontuacao': 1},
        {'texto': 'Saara', 'pontuacao': 10},
        {'texto': 'Gobi', 'pontuacao': 1},
        {'texto': 'Kalahari', 'pontuacao': 1},
        {'texto': 'Atacama', 'pontuacao': 1}
      ]
    },
    {
      'texto': 'Qual é o maior rio do mundo?',
      'resposta': [
        {'texto': 'Amazonas', 'pontuacao': 10},
        {'texto': 'Nilo', 'pontuacao': 1},
        {'texto': 'Yangtzé', 'pontuacao': 1},
        {'texto': 'Mississipi', 'pontuacao': 1},
        {'texto': 'Amarelo', 'pontuacao': 1}
      ]
    },
    {
      'texto': 'Qual é o maior lago do mundo?',
      'resposta': [
        {'texto': 'Cáspio', 'pontuacao': 1},
        {'texto': 'Superior', 'pontuacao': 1},
        {'texto': 'Vitória', 'pontuacao': 1},
        {'texto': 'Michigan', 'pontuacao': 1},
        {'texto': 'Baikal', 'pontuacao': 1}
      ]
    },
    {
      'texto': 'Qual é o maior vulcão do mundo?',
      'resposta': [
        {'texto': 'Mauna Loa', 'pontuacao': 10},
        {'texto': 'Krakatoa', 'pontuacao': 1},
        {'texto': 'Vesúvio', 'pontuacao': 1},
        {'texto': 'Kilauea', 'pontuacao': 1},
        {'texto': 'Tambora', 'pontuacao': 1}
      ]
    },
    {
      'texto': 'Qual é o maior arquipélago do mundo?',
      'resposta': [
        {'texto': 'Indonésia', 'pontuacao': 10},
        {'texto': 'Filipinas', 'pontuacao': 1},
        {'texto': 'Havaí', 'pontuacao': 1},
        {'texto': 'Japão', 'pontuacao': 1},
        {'texto': 'Maldivas', 'pontuacao': 1}
      ]
    },
    {
      'texto': 'Qual é o maior golfo do mundo?',
      'resposta': [
        {'texto': 'México', 'pontuacao': 10},
        {'texto': 'Finlândia', 'pontuacao': 1},
        {'texto': 'Guiné', 'pontuacao': 1},
        {'texto': 'Tailândia', 'pontuacao': 1},
        {'texto': 'Bengala', 'pontuacao': 1}
      ]
    }
  ];

  void _responderPergunta(int pontuacao) {
    setState(() {
      _perguntaSelecionada++;
      pontuacaoTotal += pontuacao;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < questions.length - 1;
  }

  @override
  Widget build(BuildContext context) {
    // Acessar pergunta e respostas
    Map<String, Object> currentQuestion = questions[_perguntaSelecionada];
    String pergunta = currentQuestion['texto'] as String;
    List<Map<String, Object>> respostas =
        List<Map<String, Object>>.from(currentQuestion['resposta'] as List);

    // Gerar widgets de resposta
    List<Widget> respostaWidgets = respostas
        .map((resp) => AnswerButtonWidget(
            onPressed: () => _responderPergunta(resp['pontuacao'] as int),
            text: resp['texto'] as String))
        .toList();

    //pegar a pontuação da resposta selecionada qualquer e somar com a pontuação total

    print(pontuacaoTotal);

//Abordagem imperativa
    // List<Widget> resposta = [];

    // for (String textoResp
    //     in questions[_perguntaSelecionada].cast()['resposta']) {
    //   resposta.add(AnswerButtonWidget(
    //     onPressed: _responderPergunta,
    //     text: textoResp,
    //   ));
    // }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.1),
        child: temPerguntaSelecionada
            ? SectionQuestionsWidget(
                question: pergunta,
                resposta: respostaWidgets,
              )
            : ResultWidget(
                pontuacao: pontuacaoTotal,
              ),
      ),
    );
  }
}
