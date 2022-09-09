import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_home_assignment/modules/quiz/cubit/home_cubit.dart';
import 'package:flutter_home_assignment/modules/quiz/cubit/home_state.dart';
import 'package:flutter_home_assignment/modules/quiz/cubit/timer_cubit.dart';
import 'package:flutter_home_assignment/res/app_color.dart';
import 'package:flutter_home_assignment/res/app_icon.dart';
import 'package:flutter_home_assignment/res/app_string.dart';
import 'package:flutter_home_assignment/res/size_config.dart';
import 'package:flutter_home_assignment/res/text_style.dart';

class ResultView extends StatelessWidget {
  const ResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 50.w),
              padding: EdgeInsets.symmetric(vertical: 15.h),
              decoration: BoxDecoration(
                color: AppColor.backGroundColor,
                borderRadius: BorderRadius.circular(10.w),
              ),
              child: Column(
                children: [
                  Text(
                    AppString.gameOver,
                    style: semiBoldTextStyle(
                        fontSize: 24.sp, fontFamily: 'carbono'),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      return state is QuestionCompleted
                          ? Column(
                              children: [
                                Image.asset(
                                  AppIcon.trophyIcon,
                                  height: 30.h,
                                ),
                                Text(
                                  "You Scored  ${BlocProvider.of<HomeCubit>(context).score}",
                                  textAlign: TextAlign.center,
                                  style: mediumTextStyle(fontSize: 16.sp),
                                ),
                                SizedBox(
                                  height: 24.w,
                                ),
                                Text(
                                  "Questions you answered correctly!",
                                  textAlign: TextAlign.center,
                                  style: mediumTextStyle(fontSize: 12.sp),
                                ),
                                SizedBox(
                                  height: 6.w,
                                ),
                                Text(
                                  "${BlocProvider.of<HomeCubit>(context).currentAnsTotal}/${BlocProvider.of<HomeCubit>(context).questionList.length}",
                                  textAlign: TextAlign.center,
                                  style: boldTextStyle(fontSize: 20.sp),
                                ),
                              ],
                            )
                          : const SizedBox();
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 14.h,
            ),
            
            playAgainButton(context),
          ],
        ),
      ),
    );
  }
  
  
  Widget playAgainButton(BuildContext context){
    return GestureDetector(
      onTap: () {
        BlocProvider.of<HomeCubit>(context).resetQuiz();
        BlocProvider.of<TimerCubit>(context).startTimer();
      },
      child: Container(
        height: 34.h,
        margin: EdgeInsets.symmetric(horizontal: 80.w),
        decoration: BoxDecoration(
          color: AppColor.buttonColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Text(
            AppString.playAgain.toUpperCase(),
            style: mediumTextStyle(
              fontSize: 13.sp,
              txtColor: AppColor.white,
            ),
          ),
        ),
      ),
    );
  }
}
