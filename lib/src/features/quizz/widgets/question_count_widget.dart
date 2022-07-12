import 'package:flutter/material.dart';
import 'package:flutter_home_assignment/src/features/quizz/controllers/quizz_controller.dart';

class QuestionCountWidget extends StatelessWidget {
  const QuestionCountWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final QuizzController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 95,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: const BorderRadius.all(
          Radius.circular(2),
        ),
      ),
      child: Center(
        child: Text(
          'Question ${controller.questionIndex + 1}',
          style: const TextStyle(
            inherit: true,
            fontSize: 15.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                  // bottomLeft
                  offset: Offset(-1, -1),
                  color: Colors.black54),
              Shadow(
                  // bottomRight
                  offset: Offset(1, -1),
                  color: Colors.black54),
              Shadow(
                  // topRight
                  offset: Offset(1, 1),
                  color: Colors.black54),
              Shadow(
                  // topLeft
                  offset: Offset(-1, 1),
                  color: Colors.black54),
            ],
          ),
        ),
      ),
    );
  }
}
