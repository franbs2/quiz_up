import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String texto;

  const TitleWidget({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: const TextStyle(fontSize: 45, color: Color(0xf7595487)),
    );
  }
}
