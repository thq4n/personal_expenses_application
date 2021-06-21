import 'package:flutter/material.dart';
import 'result.dart';

import 'quiz.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "What's your favorite color?",
      "answers": [
        {"answerText": "Black", "score": 1},
        {"answerText": "Red", "score": 2},
        {"answerText": "Green", "score": 3},
        {"answerText": "White", "score": 4},
      ],
    },
    {
      "questionText": "What's your favorite animal?",
      "answers": [
        {"answerText": "Dog", "score": 1},
        {"answerText": "Cat", "score": 2},
        {"answerText": "Rabbit", "score": 3},
        {"answerText": "Snake", "score": 4},
      ],
    },
    {
      "questionText": "What's your favorite drink?",
      "answers": [
        {"answerText": "Coke", "score": 1},
        {"answerText": "Pepsi", "score": 2},
        {"answerText": "Sting", "score": 3},
        {"answerText": "7UP", "score": 4},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    setState(() {
      _questionIndex = _questionIndex + 1;
      _totalScore += score;
    });
  }

  void _resetQuestion() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My first app"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
              )
            : Result(
                totalScore: _totalScore,
                resetHandler: _resetQuestion,
              ),
      ),
    );
  }
}
