import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({Key? key, required this.questionText})
      : super(key: key);
  final String questionText;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.grey[850],
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
