import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_home_assignment/res/app_color.dart';
import 'package:flutter_home_assignment/res/app_icon.dart';
import 'package:flutter_home_assignment/res/size_config.dart';
import 'package:flutter_home_assignment/modules/quiz/cubit/home_cubit.dart';
import 'package:flutter_home_assignment/modules/quiz/cubit/home_state.dart';
import 'package:flutter_home_assignment/modules/quiz/cubit/timer_cubit.dart';
import 'package:flutter_home_assignment/modules/quiz/cubit/timer_state.dart';
import 'package:flutter_home_assignment/modules/quiz/model/question_model.dart';
import 'package:flutter_home_assignment/res/text_style.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class QuestionView extends StatelessWidget {
  const QuestionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          progressBar(),

          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Text(
                "Question ${BlocProvider.of<HomeCubit>(context).currentIndex + 1}",
                style: semiBoldTextStyle(
                    fontSize: 16.sp,
                    fontFamily: 'carbono'),
              );
            },
          ),

          Center(
            child: Image.asset(
              AppIcon.brain2,
              height: 200,
            ),
          ),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (quizContext, state) {
              if (state is QuestionLoaded ||
                  state is QuestionAnswer) {
                QuestionModel question;
                question =
                BlocProvider.of<HomeCubit>(
                    quizContext)
                    .questionList[
                BlocProvider.of<HomeCubit>(
                    quizContext)
                    .currentIndex];

                BlocProvider.of<TimerCubit>(context).stopTimer();
                BlocProvider.of<TimerCubit>(context).startTimer();
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 18.w),
                  child: Column(
                    children: [
                      Text(
                        question.text!,
                        style: boldTextStyle(
                            fontSize: 19.sp,
                            txtColor:
                            AppColor.textColor),
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.only(
                            bottom: 16.h),
                        physics:
                        const NeverScrollableScrollPhysics(),
                        itemCount: question
                            .answers!.length,
                        itemBuilder:
                            (context, index) {
                          return questionOption(
                            option: question
                                .answers![index],
                            bgColor: state
                            is QuestionAnswer
                                ? question.correct ==
                                question.answers![
                                index]
                                ? AppColor.green
                                : AppColor.red
                                : AppColor
                                .buttonColor,
                            onTap: () {
                              goToNextQuestion(
                                  quizContext,
                                  question.correct ==
                                      question.answers![
                                      index]);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                );
              }
              // When no data loaded.
              return const Center(
                  child:
                  CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }


  Widget progressBar(){
    return Padding(
      padding: EdgeInsets.only(
          top: 10.h, bottom: 5.h),
      child:
      BlocBuilder<TimerCubit, TimerState>(
          builder: (BuildContext context,
              state) {
            String text = '';
            double progress = 0;
            if (state is CountDown) {
              progress=state.secondRemain.toDouble() /60;
              final String minutesStr =
              ((state.secondRemain / 60) % 60)
                  .floor()
                  .toString()
                  .padLeft(2, '0');
              final String secondsStr =
              (state.secondRemain % 60)
                  .floor()
                  .toString()
                  .padLeft(2, '0');
              text = '$minutesStr:$secondsStr';
            } else {
              text = '';
            }
            return LinearPercentIndicator(
              animation: false,
              lineHeight: 13.h,
              animationDuration: 0,
              percent: progress,
              center: Text(
                text,
                style: mediumTextStyle(
                    fontSize: 12.sp,
                    txtColor: AppColor.white),
              ),
              progressColor: Colors.greenAccent,
              barRadius: const Radius.circular(50),
            );
          }),
    );
  }

  Widget questionOption(
      {required Color bgColor,
        required String option,
        required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.w),
          color: bgColor,
        ),
        margin: EdgeInsets.only(top: 10.h),
        child: Center(
          child: Text(
            option,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: semiBoldTextStyle(fontSize: 13.sp, txtColor: AppColor.white),
          ),
        ),
      ),
    );
  }

  void goToNextQuestion(BuildContext context, bool isCorrect) {
    BlocProvider.of<HomeCubit>(context).nextQuestion(isCorrect: isCorrect);
    BlocProvider.of<TimerCubit>(context).stopTimer();
  }
}
