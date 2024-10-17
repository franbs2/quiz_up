import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  final int pontuacao;
  const ResultWidget({super.key, required this.pontuacao});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'Parabéns. Você concluiu o Quiz! Sua pontuação foi: $pontuacao',
      style: const TextStyle(fontSize: 24),
    ));
  }
}
