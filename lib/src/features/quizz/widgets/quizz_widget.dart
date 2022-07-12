import 'package:flutter/material.dart';

import 'package:flutter_home_assignment/src/features/quizz/models/question_model.dart';
import 'package:flutter_home_assignment/src/features/quizz/widgets/answer_widget.dart';
import 'package:flutter_home_assignment/src/features/quizz/widgets/question_widget.dart';

class QuizWidget extends StatelessWidget {
  const QuizWidget(
      {Key? key,
      required this.userAnswer,
      required this.questionIndex,
      required this.questions})
      : super(key: key);
  final Function(int score) userAnswer;
  final int questionIndex;
  final List<QuestionModel> questions;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuestionWidget(
          questionText: questions[questionIndex].question.toString(),
        ),
        ListView.builder(
          itemCount: questions[questionIndex].options!.length,
          shrinkWrap: true,
          itemBuilder: (ctx, index) {
            var option = questions[questionIndex].options![index];
            return AnswerWidget(
              answerText: option.answer.toString(),
              selectHandler: () => userAnswer(option.score!),
            );
          },
        ),
      ],
    );
  }
}
