import 'package:flutter/material.dart';

class QuestionsWidget extends StatelessWidget {
  final String question;
  const QuestionsWidget({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Text(
      question,
      style: const TextStyle(
        fontSize: 24,
      ),
      softWrap: true,
      textAlign: TextAlign.center,
    );
  }
}
