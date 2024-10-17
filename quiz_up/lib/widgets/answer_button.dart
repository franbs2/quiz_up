import 'package:flutter/material.dart';

class AnswerButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String text;

  const AnswerButtonWidget(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              padding: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              )),
          onPressed: onPressed,
          child: Text(text,
              style: const TextStyle(fontSize: 18, color: Colors.white)),
        ),
      ),
    );
  }
}
