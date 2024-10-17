import 'package:flutter/material.dart';
import 'package:quiz_up/widgets/questions_widget.dart';

class SectionQuestionsWidget extends StatelessWidget {
  final String question;
  final List<Widget> resposta;
  const SectionQuestionsWidget(
      {super.key, required this.question, required this.resposta});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text(
          'Duvido você acertar essa pergunta!',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 20),
        QuestionsWidget(question: question),
        const SizedBox(height: 20),
        //...resposta //Abordagem imperativa

        //Abordagem declarativa
        ...resposta
        // ...resposta.map((resp) =>
        //     AnswerButtonWidget(onPressed: _responderPergunta, text: resp)),
      ],
    );
  }
}
