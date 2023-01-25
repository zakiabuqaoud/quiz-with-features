import 'package:flutter/material.dart';
import 'question.dart';
import 'questions_and_answers.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final int questionIndex;
  final Function increaseQuestionIndex;
  Quiz(this.questionIndex, this.increaseQuestionIndex);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [Question(questionsAndAnswers[questionIndex]
    ['questionText'] as String),
          ...(questionsAndAnswers[questionIndex]['answers']
          as List<Map<String, Object>>)
              .map((answer) {
            return Answer(
                answer['answerText'] as String, () => increaseQuestionIndex(answer['score']));
          }).toList(),]
    );
  }
}

