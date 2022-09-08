import 'package:flutter_home_assignment/config/text_styles.dart';
import 'package:flutter/material.dart';

class QuestionView extends StatelessWidget {
  final String questionText;

  const QuestionView({Key? key, required this.questionText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Text(
        questionText,
        style: textStyleBlack5418Bold,
        textAlign: TextAlign.center,
      ),
    );
  }
}
