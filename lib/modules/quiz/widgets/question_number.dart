import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_home_assignment/constants/test_styles.dart';
import 'package:flutter_home_assignment/modules/quiz/cubit/quiz_cubit.dart';

class QuestionNumber extends StatelessWidget {
  const QuestionNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit, QuizState>(
      builder: (context, state) {
        return Text(
          state is QuizCompleted
              ? "Questions Over"
              : "Question ${BlocProvider.of<QuizCubit>(context).currentIndex + 1}",
          style: questionStyle.copyWith(fontSize: 16, shadows: const [
            Shadow(
                // bottomLeft
                offset: Offset(-.05, -.05),
                color: Colors.black),
            Shadow(
                // bottomRight
                offset: Offset(.05, -.05),
                color: Colors.black),
            Shadow(
                // topRight
                offset: Offset(.05, .05),
                color: Colors.black),
            Shadow(
                // topLeft
                offset: Offset(-.05, .05),
                color: Colors.black),
          ]),
        );
      },
    );
  }
}
