import 'package:flutter/material.dart';
import 'package:flutter_home_assignment/src/features/quizz/controllers/quizz_controller.dart';

class ScoreCountWidget extends StatelessWidget {
  const ScoreCountWidget({
    Key? key,
    required this.areThereMoreQuestions,
    required this.controller,
  }) : super(key: key);

  final bool areThereMoreQuestions;
  final QuizzController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 30,
            width: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            padding: const EdgeInsets.only(
              left: 5.0,
            ),
            child: Text(
              areThereMoreQuestions ? '0' : controller.totalScore.toString(),
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Transform.translate(
            offset: const Offset(-37, 0),
            child: Container(
              height: 25,
              width: 45,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 20.0),
              // padding: const EdgeInsets.only(left: 3.0),
              child: Icon(
                Icons.circle_rounded,
                color: Colors.yellow[700],
                size: 45,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
