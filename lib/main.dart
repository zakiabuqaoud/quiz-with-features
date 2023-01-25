import 'package:flutter/material.dart';
import 'package:quiz_with_feature/quiz.dart';
import 'package:quiz_with_feature/result.dart';
import 'color.dart';
import 'questions_and_answers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Quiz App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSwiched = false;
  int questionIndex = 0;
  int totalScore = 0;
  List<int> scoreDuringTesting = [];


  void increaseQuestionIndex(int score) {
    scoreDuringTesting.length = 10;
    if (questionIndex < questionsAndAnswers.length) {
      scoreDuringTesting[questionIndex] = score ;
      totalScore += score;
      setState(() {
        questionIndex++;
      });
    }
  }

  void arrowBack() {
    if (questionIndex == 0 || questionIndex >= questionsAndAnswers.length) {
    } else {
      setState(() {
        questionIndex--;
        totalScore -= scoreDuringTesting[questionIndex];
      });
    }
  }

  void restartApp() {
    totalScore = 0;
    setState(() {
      questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Switch(
              activeColor: Colors.white,
              inactiveThumbColor: Colors.black,
              inactiveTrackColor: Colors.red,
              value: isSwiched,
              onChanged: (value) {
                setState(() {
                  isSwiched = value;
                  if (isSwiched == true) {
                    white = Colors.black;
                    black = Colors.white;
                  } else {
                    white = Colors.white;
                    black = Colors.black;
                  }
                });
              }),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        height: double.infinity,
        width: double.infinity,
        color: white,
        child: Column(children: [
          const Text(
            "اسئلة ثقافية",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w700,
              color: Colors.redAccent,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          questionIndex < questionsAndAnswers.length
              ? Quiz(questionIndex, increaseQuestionIndex)
              : Result(restartApp, totalScore),
        ]),
      ),
      floatingActionButton:
          questionIndex != 0 && questionIndex != questionsAndAnswers.length
              ? FloatingActionButton(
                  onPressed: arrowBack,
                  child: const Icon(Icons.arrow_back, size: 30),
                )
              : FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: white,
                  elevation: 0,
                ),
    );
  }
}
