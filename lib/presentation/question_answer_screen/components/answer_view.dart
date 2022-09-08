import 'package:flutter_home_assignment/config/all_config.dart';
import 'package:flutter/material.dart';

class AnswerView extends StatelessWidget {
  const AnswerView({Key? key, required this.answerText, required this.selectHandler}) : super(key: key);
  final Function() selectHandler;
  final String answerText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: GestureDetector(
        onTap: selectHandler,
        child: Container(
          width: double.infinity,
          height: 60,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 10.0),
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: const BoxDecoration(
            color: Colors.deepPurpleAccent,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: Text(
            answerText,
            style: textStyleBlack5418Bold.copyWith(color: colorWhite),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
