import 'package:flutter_home_assignment/data/response_model/question_answer_model.dart';

import 'package:flutter/material.dart';

import '../question_answer_screen.dart';

class QuizView extends StatelessWidget {
  final QuestionAnswerModel model;
  final Function? loadNextQuestion;

  const QuizView({Key? key, required this.model, required this.loadNextQuestion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> allAnswer = [];

    allAnswer.add(model.correct);

    for (var element in model.incorrect) {
      allAnswer.add(element);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        QuestionView(
          questionText: model.text,
        ),
        ListView.builder(
          itemCount: allAnswer.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (ctx, index) {
            return AnswerView(
              answerText: allAnswer[index],
              selectHandler: () {
                if (loadNextQuestion != null) {
                  loadNextQuestion!(index, context);
                }
              },
            );
          },
        ),
      ],
    );
  }
}
