import 'package:first_app/result.dart';
import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  final _questions = const [
    {
      'questionText': 'What\'s your favourite colour ?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Yellow', 'score': 5},
        {'text': 'Orange', 'score': 4},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'what\'s your favourite car ?',
      'answers': [
        {'text': 'Polo', 'score': 12},
        {'text': 'Wagonr', 'score': 15},
        {'text': 'Creta', 'score': 5},
        {'text': 'Seltos', 'score': 2},
      ],
    },
    {
      'questionText': 'who\'s Your favourite Animal ?',
      'answers': [
        {'text': 'Dog', 'score': 3},
        {'text': 'Elephant', 'score': 7},
        {'text': 'Zebra', 'score': 10},
        {'text': 'Panda', 'score': 17},
      ],
    },
  ];
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
