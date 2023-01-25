import 'package:flutter/cupertino.dart';
import 'color.dart';

class Question extends StatelessWidget {
  final String question;

  Question(String this.question);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        question,
        style: TextStyle(
          fontSize: 23,
          color: black,
          fontWeight: FontWeight.w800
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
