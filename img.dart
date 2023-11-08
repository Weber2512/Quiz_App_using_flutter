import 'package:flutter/material.dart';

class img extends StatelessWidget {
  const img(this.startQuiz,{super.key});
  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Opacity(
          opacity: 0.5,
          child: Image.asset(
            'assests/images/quiz-logo.png',
            width: 300,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Learn Flutter the fun way!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            height: 05,
            color: Colors.white,
          ),
        ),
        OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              'Start Quiz',
            )),
      ],
    );
  }
}
