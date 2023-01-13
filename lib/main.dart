import 'package:flutter/material.dart';
import 'package:helloworld/answer.dart';
import 'package:helloworld/question.dart';

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
  var _questIndex = 0;
  void set questIndex(int value) => _questIndex = value;

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        'question': 'Question 1 ?',
        'answers': ['1', '2', '3']
      },
      {
        'question': 'Question 2 ?',
        'answers': ['1', '2', '3', '4']
      },
      {
        'question': 'Question 3 ?',
        'answers': ['1', '2', '3']
      },
      {
        'question': 'Question 4 ?',
        'answers': ['1', '2', '3', '4']
      },
    ];

    void logAns(String ans) {
      setState(() {
        if (_questIndex < questions.length - 1) {
          questIndex = _questIndex + 1;
        } else {
          questIndex = 0;
        }
      });
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Title App'),
        ),
        body: Column(
          children: <Widget>[
            Question(questions[_questIndex]['question'] as String),
            ...(questions[_questIndex]['answers'] as List<String>).map((item) {
              return Answer(item, logAns);
            }).toList(),
            Text.rich(
              TextSpan(
                text: 'Hello', // default text style
                children: <TextSpan>[
                  TextSpan(
                      text: ' beautiful ',
                      style: TextStyle(fontStyle: FontStyle.italic)),
                  TextSpan(
                      text: 'world',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
