import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import '../../../config/all_config.dart';
import '../../../data/response_model/all_response_model.dart';
import '../question_answer_screen.dart';

class BodyView extends StatelessWidget {
  final QuestionAnswerModel? nextModel;
  final Function? loadNextQuestion;

  const BodyView(this.nextModel, this.loadNextQuestion, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (nextModel == null) {
      return const SizedBox();
    }
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const TimerView(seconds: 3),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Lottie.asset(imgQuiz, height: 100, fit: BoxFit.cover),
          ),
          QuizView(
            model: nextModel!,
            loadNextQuestion: loadNextQuestion,
          )
        ],
      ),
    );
  }
}
