import 'package:flutter/material.dart';
// import 'package:quiz/data/quiz_answers.dart';

class answersStyle extends StatelessWidget {
  const answersStyle({
    super.key,
    required this.answer,
    required this.onTap,
  });

  final String answer;
  final void Function() onTap;

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding:const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        backgroundColor: const Color.fromARGB(255, 25, 3, 89),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Text(answer, textAlign: TextAlign.center,),
    );
  }
}
