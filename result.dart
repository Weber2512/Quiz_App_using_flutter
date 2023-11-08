import 'package:flutter/material.dart';
// import 'package:quiz/img.dart';
import 'package:quiz/data/quiz_answers.dart';
import 'package:quiz/question_summary/questions_summary.dart';

class ResultScreen extends StatelessWidget{
  const ResultScreen({super.key,required this.choosenAnswers, required this.onRestart});
  final List<String> choosenAnswers;
  final void Function() onRestart;
  List<Map<String,Object>> getSummaryData(){
    List<Map<String,Object>> summary = [];
    for(var i=0;i<choosenAnswers.length;i++){
      summary.add({
        'questions_index' : i,
        'questions' : question[i].questions,
        'correct_answers': question[i].answers[0],
        'user_answers': choosenAnswers[i],
      });
    }
    return summary;

  }
  @override
  Widget build(context)
  {
    final summaryData = getSummaryData();
    final numTotalQuestions=question.length;
    final numCorrectQuestions=summaryData.where((data){
      return data['user_answers'] == data['correct_answers'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin:const EdgeInsets.all(40),
        child:  Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!", style:const TextStyle(fontSize: 18, color: Color.fromARGB(135, 255, 255, 255)),textAlign: TextAlign.center,),
            const  SizedBox(height: 20,),
            QuestionsSummary(summaryData),
            const  SizedBox(height: 20,),
            TextButton.icon(onPressed: onRestart,icon: const Icon(Icons.refresh_sharp), label: const Text("Restart quiz"),)
          ],
        ),
      ),
    );
  }
}