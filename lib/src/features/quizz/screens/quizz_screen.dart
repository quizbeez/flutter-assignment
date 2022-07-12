import 'package:flutter/material.dart';
import 'package:flutter_home_assignment/src/features/quizz/widgets/question_count_widget.dart';
import 'package:flutter_home_assignment/src/features/quizz/widgets/score_count_widget.dart';
import 'package:flutter_home_assignment/src/features/quizz/widgets/timer_widget.dart';
import 'package:get/get.dart';

import 'package:flutter_home_assignment/src/features/quizz/controllers/quizz_controller.dart';
import 'package:flutter_home_assignment/src/features/quizz/widgets/quizz_widget.dart';
import 'package:flutter_home_assignment/src/features/quizz/widgets/result_widget.dart';
import 'package:flutter_home_assignment/src/global/constants/paths.dart';

class QuizzScreen extends GetWidget<QuizzController> {
  const QuizzScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Obx(
      () {
        bool areThereMoreQuestions =
            controller.questionIndex < controller.questionsList.length;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Get.theme.scaffoldBackgroundColor,
            elevation: 0,
            leading: const Center(
              child: Icon(
                Icons.close,
                color: Colors.black87,
                size: 35,
              ),
            ),
            actions: [
              ScoreCountWidget(
                  areThereMoreQuestions: areThereMoreQuestions,
                  controller: controller)
            ],
          ),
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                !areThereMoreQuestions
                    ? const SizedBox.shrink()
                    : Column(
                        children: [
                          TimerWidget(
                            seconds: controller.seconds,
                          ),
                          QuestionCountWidget(controller: controller),
                        ],
                      ),
                Container(
                  height: size.height * 0.32,
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  child: Image.asset(Path.brainImagePath),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: areThereMoreQuestions
                      ? QuizWidget(
                          userAnswer: controller.userAnswer,
                          questionIndex: controller.questionIndex,
                          questions: controller.questionsList,
                        )
                      : ResultWidget(
                          score: controller.totalScore,
                          resetQuiz: controller.resetQuiz,
                          resultPhrase: controller.resultPhrase,
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
