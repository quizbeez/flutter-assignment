import 'package:flutter/material.dart';
import 'package:flutter_home_assignment/constants/colors.dart';
import 'package:flutter_home_assignment/constants/test_styles.dart';

class AnswerWidget extends StatelessWidget {
  final String text;
  final Function() onTap;
  final Color color;
  const AnswerWidget(
      {Key? key,
      required this.text,
      required this.onTap,
      this.color = AppColor.button})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 20,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          textStyle: questionStyle.copyWith(color: Colors.white),
          primary: color,
        ),
        onPressed: () {
          onTap();
        },
        child: Text(
          text,
        ),
      ),
    );
  }
}

class QuestionWidget extends StatelessWidget {
  final String question;
  const QuestionWidget({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Text(
        question,
        style: questionStyle,
      ),
    );
  }
}
