import 'package:flutter/material.dart';
import 'package:quiz/answers_style.dart';
import 'package:quiz/data/quiz_answers.dart';
import 'package:google_fonts/google_fonts.dart';

class questions extends StatefulWidget {
  const questions({super.key,required this.onSelectAnswer});

  final void Function(String answers) onSelectAnswer;
  @override
  State<questions> createState() {
    return _questions();
  }
}

class _questions extends State<questions> {
  var ansquestion = 0;
  void answerquestion(String selectedAnswers){
    widget.onSelectAnswer(selectedAnswers);
    setState(() {
      ansquestion++;
    });
  }
  @override


  Widget build(context) {
    final currentquestion = question[ansquestion];
    return SizedBox(

      width: double.infinity,
      child: Container(
        padding:const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              currentquestion.questions,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ...currentquestion.shuffle().map((answer){
              return answersStyle(answer: answer, onTap: (){
                answerquestion(answer);
              },);
            }),
            
          ],
        ),
      ),
    );
  }
}
