import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/result.dart';
import 'package:quiz_app/start_screen.dart';

class QuizApp extends StatefulWidget{

  const QuizApp({super.key});

  @override
  State<StatefulWidget> createState() => _QuizApp();
}
class _QuizApp extends State<QuizApp> {
  var activeScreen = "start-screen";
  List<String>answersOfUser=[];


  void switchScreen(){
    setState(() {
      activeScreen = "question-screen";
    });
  }
  void restartQuiz(){
    setState(() {
      activeScreen = "start-screen";
      answersOfUser = [];
    });
  }

  void chooseAnswer(String answer){
    answersOfUser.add(answer);
    if (questions.length == answersOfUser.length){
      setState(() {
        activeScreen = "result_screen";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = StartScreen(switchScreen);

    if (activeScreen == "question-screen"){
      screen = QuestionsScreen(onSelectAnswer:chooseAnswer,);
    }

    if (activeScreen == "result_screen"){
      screen = ResultsScreen(
          chosenAnswers:answersOfUser,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xFFFFFFFF),
                      Color(0xFFE6E8E6),
                      Color(0xFFCED0CE)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight
                )
            ),
            child:screen
        ),
      ),
    );
  }
}