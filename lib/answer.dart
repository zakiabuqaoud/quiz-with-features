import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Function choseAnswer;

  Answer(this.answerText, this.choseAnswer);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 5.0),
      child: ElevatedButton(
        onPressed: () => {choseAnswer()},
        child: Text(
          answerText),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding:
            const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
            textStyle:
            const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
        ),
      ),
    );
  }
}
