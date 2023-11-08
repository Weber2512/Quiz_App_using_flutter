import 'package:flutter/material.dart';
import 'package:quiz/data/quiz_answers.dart';
import 'package:quiz/img.dart';
import 'package:quiz/questions.dart';
import 'package:quiz/result.dart';

class  quiz extends StatefulWidget{
  const quiz({super.key});
  @override
    State<quiz> createState(){
      return _quiz();
    }
}

class _quiz extends State<quiz>{
  List<String> selectedAnswers = [];  
  var ActiveScreen = 'img';

  void restartQuiz(){
    setState(() {
      selectedAnswers = [];
      ActiveScreen = 'questions';
    });
  }
  void select(String answers){
    selectedAnswers.add(answers);

    if(selectedAnswers.length == question.length) 
    {
      setState(() {
        ActiveScreen = 'result';
      });
    }
  }

  void ChangeScreen(){
    setState(() {
      ActiveScreen ='questions';
    });
  }
  
  @override
  Widget build(context)
  {
    Widget screenWidget  = img(ChangeScreen);
    if(ActiveScreen == 'questions'){
      screenWidget = questions(onSelectAnswer: select,);
    }
    if(ActiveScreen == 'result')
    {
      screenWidget = ResultScreen(choosenAnswers: selectedAnswers, onRestart: restartQuiz ,);
    }
    return MaterialApp(
      home: Scaffold(
       body: Container(
        decoration:  const BoxDecoration(
          gradient: LinearGradient(
         colors: [
          Color.fromARGB(255, 78, 13, 151),
          Color.fromARGB(255, 78, 13, 151),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        ),
       ),
       child: Center(
        child: screenWidget,
        ),
       ),
       ),
      );
  }
}