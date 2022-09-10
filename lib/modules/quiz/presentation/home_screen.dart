import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_home_assignment/res/app_color.dart';
import 'package:flutter_home_assignment/res/app_icon.dart';

import 'package:flutter_home_assignment/res/app_string.dart';
import 'package:flutter_home_assignment/res/size_config.dart';
import 'package:flutter_home_assignment/modules/quiz/cubit/home_cubit.dart';
import 'package:flutter_home_assignment/modules/quiz/cubit/home_state.dart';
import 'package:flutter_home_assignment/modules/quiz/cubit/timer_cubit.dart';
import 'package:flutter_home_assignment/modules/quiz/cubit/timer_state.dart';
import 'package:flutter_home_assignment/modules/quiz/widget/question_view.dart';
import 'package:flutter_home_assignment/modules/quiz/widget/result_view.dart';
import 'package:flutter_home_assignment/res/text_style.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColor.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Material(
        child: SafeArea(
          child: Container(
            color: AppColor.white,
            child: Column(
              children: [
                appBar(),
                Expanded(
                  child: BlocListener<TimerCubit, TimerState>(
                    listener: (context, state) {
                      if (state is TimerFinish) {
                        goToNextQuestion(context, false);
                      }
                    },
                    child: BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        if(state is QuestionCompleted){
                          BlocProvider.of<TimerCubit>(context).stopTimer();
                          return const ResultView();
                        }else {
                          return const QuestionView();
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return SizedBox(
      height: 56.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          children: [
            Image.asset(
              AppIcon.closeIcon,
              width: 18.w,
              color: AppColor.black,
            ),
            const Spacer(),
            Image.asset(
              AppIcon.coinIcon,
              width: 22.w,
            ),
            SizedBox(
              width: 9.w,
            ),
            Text(
              AppString.totalCoin,
              style: boldTextStyle(fontSize: 18.sp, txtColor: AppColor.black),
            )
          ],
        ),
      ),
    );
  }


  void goToNextQuestion(BuildContext context, bool isCorrect) {
    BlocProvider.of<HomeCubit>(context).nextQuestion(isCorrect: isCorrect);
    BlocProvider.of<TimerCubit>(context).stopTimer();
  }

}
