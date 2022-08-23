import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_home_assignment/constants/colors.dart';
import 'package:flutter_home_assignment/constants/test_styles.dart';
import 'package:flutter_home_assignment/models/questions.dart';
import 'package:flutter_home_assignment/modules/quiz/cubit/quiz_cubit.dart';
import 'package:flutter_home_assignment/modules/quiz/widgets/answer_button.dart';
import 'package:flutter_home_assignment/modules/quiz/widgets/question_number.dart';

class QuizView extends StatelessWidget {
  const QuizView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          BlocBuilder<QuizCubit, QuizState>(
            builder: (context, state) {
              return Container(
                child: Center(
                  child: Text(
                    BlocProvider.of<QuizCubit>(context).score.toString(),
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w900),
                  ),
                ),
                margin: const EdgeInsets.all(16.0),
                height: 40,
                width: 70,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20)),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        primary: true,
        child: SafeArea(
          child: SizedBox(
            child: Column(children: [
              DecoratedBox(
                decoration: BoxDecoration(
                    color: AppColor.offWhite,
                    borderRadius: BorderRadius.circular(8)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: QuestionNumber(),
                ),
              ),
              Center(
                child: Image.asset(
                  'assets/images/brain.png',
                  height: 300,
                ),
              ),
              BlocBuilder<QuizCubit, QuizState>(
                builder: (quizContext, state) {
                  if (state is QuizLoaded || state is QuizAnswer) {
                    Questions question;
                    question = BlocProvider.of<QuizCubit>(quizContext)
                            .questions[
                        BlocProvider.of<QuizCubit>(quizContext).currentIndex];
                    return Column(
                      children: [
                        QuestionWidget(question: question.text!),
                        const SizedBox.square(
                          dimension: 6,
                        ),
                        ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: question.answers!.length,
                          itemExtent: 80,
                          itemBuilder: (context, index) {
                            return AnswerWidget(
                              text: question.answers![index],
                              color: state is QuizAnswer
                                  ? question.correct == question.answers![index]
                                      ? AppColor.green
                                      : Colors.redAccent
                                  : AppColor.button,
                              onTap: () {
                                if (question.correct ==
                                    question.answers![index]) {
                                  BlocProvider.of<QuizCubit>(quizContext)
                                      .nextQuestion(isCorrect: true);
                                } else {
                                  BlocProvider.of<QuizCubit>(quizContext)
                                      .nextQuestion(isCorrect: false);
                                }
                              },
                            );
                          },
                        ),
                      ],
                    );
                  }
                  // When completed.
                  if (state is QuizCompleted) {
                    return Center(
                      child: Column(
                        children: [
                          Text(
                            "You Scored\n${BlocProvider.of<QuizCubit>(quizContext).score}",
                            style: questionStyle.copyWith(fontSize: 42),
                            textAlign: TextAlign.center,
                          ),
                          AnswerWidget(
                            text: "Restart",
                            onTap: () {
                              BlocProvider.of<QuizCubit>(quizContext)
                                  .resetQuiz();
                            },
                          )
                        ],
                      ),
                    );
                  }
                  // When no data loaded.
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
