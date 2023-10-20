import 'package:flutter/material.dart';
import 'package:quizz_app/questions_screen.dart';
import 'package:quizz_app/result_screen.dart';
import 'package:quizz_app/screen.dart';

import 'data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswed = [];
  var activeScreen = "start-screen";

  switchScreen() {
    setState(() {
      activeScreen = "question-screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswed.add(answer);

    if (selectedAnswed.length == questions.length) {
      setState(() {
        activeScreen = "result-screen";
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswed.clear();
      activeScreen = 'questions-screen';
    });
  }


  @override
  Widget build(context) {
    Widget screeWidget = StartScreen(switchScreen);

    if (activeScreen == "question-screen") {
      screeWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == "result-screen") {
      screeWidget = ResultsScreen(chosenAnswers: selectedAnswed,  onRestart: restartQuiz,);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screeWidget,
        ),
      ),
    );
  }
}
