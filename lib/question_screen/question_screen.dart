import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_home_assignment/mock_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'bloc/question_bloc.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestionBloc(),
      child: const QuestionBodyView(),
    );
  }
}

class QuestionBodyView extends StatefulWidget {
  const QuestionBodyView({Key? key}) : super(key: key);

  @override
  State<QuestionBodyView> createState() => _QuestionBodyViewState();
}

class _QuestionBodyViewState extends State<QuestionBodyView> {
  Timer? periodicTimer;
  int currentTimer = 0;
  int currentIndex = 0;
  List mcqList = [];

  List selectedAns = [];

  @override
  void initState() {
    super.initState();
    getQuestion();
    startTimer();
  }

  getQuestion() {
    for (var item in kQuestions) {
      selectedAns.add(null);
    }
  }

  void startTimer() async {
    const oneSec = Duration(seconds: 1);

    mcqList.clear();
    mcqList.addAll(kQuestions[currentIndex]["incorrect"] as List);
    mcqList.add(kQuestions[currentIndex]["correct"].toString());
    mcqList.shuffle();

    if (periodicTimer != null) {
      periodicTimer!.cancel();
    }
    periodicTimer = Timer.periodic(oneSec, (Timer t) {
      if (currentTimer >= 30) {
        t.cancel();
        if (currentIndex < (kQuestions.length - 1)) {
          currentTimer = 0;
          currentIndex++;
          startTimer();
        } else {
          //quiz complete
        }
      } else {
        currentTimer = currentTimer + 1;
      }

      BlocProvider.of<QuestionBloc>(context).add(RefreshDataTimer(
          currentIndex: currentIndex,
          currentTimer: currentTimer,
          mcqList: mcqList));
    });
  }

  ansQuestion(var ans) {
    selectedAns[currentIndex] = ans;

    // uncomment this code if you want to render next question when click the ans

    /*if (currentIndex < (kQuestions.length - 1)) {
      currentTimer = 0;
      currentIndex++;
      startTimer();
      BlocProvider.of<QuestionBloc>(context).add(RefreshDataTimer(
          currentIndex: currentIndex,
          currentTimer: currentTimer,
          mcqList: mcqList));
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(),
        body: bodyVIew(),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: Icon(
        Icons.close,
        color: Colors.grey,
        size: 40.sp,
      ),
      actions: [
        Row(
          children: [
            Image.asset("assets/scoreimg.png", height: 40.sp, width: 40.sp),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 12.h).copyWith(
                right: 10.w,
              ),
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.r),
                    bottomRight: Radius.circular(30.r)),
                color: Colors.grey[200],
              ),
              child: Text(
                "0",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w800,
                  color: Colors.grey[800],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget bodyVIew() {
    return BlocBuilder<QuestionBloc, QuestionState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            LinearProgressIndicator(
              color: Colors.lightGreen,
              backgroundColor: Colors.grey,
              value: state.currentTimer / 30,
            ),
            Container(
              color: Colors.grey[200],
              width: 130,
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 10.h),
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
              child: Text(
                "Question ${state.currentIndex + 1}",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w800,
                  color: Colors.grey[800],
                ),
              ),
            ),
            Image.asset("assets/vector.png",
                height: 200.sp, width: double.infinity),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Column(
                children: [
                  // Question
                  Text(
                    kQuestions[state.currentIndex]["text"].toString(),
                    textAlign: TextAlign.left,
                    maxLines: 4,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),

                  // MCQ'S
                  ...List.generate(state.mcqList.length, (index) {
                    return answerBoxWidget(
                        text: state.mcqList[index],
                        onTaped: () {
                          ansQuestion(state.mcqList[index]);
                        });
                  })
                ],
              ),
            )
          ],
        );
      },
    );
  }

  Widget answerBoxWidget({required var text, required var onTaped}) {
    return InkWell(
      onTap: onTaped,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 20.h,
        ),
        margin: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: selectedAns.contains(text)
              ? Colors.black
              : Colors.deepPurple[400],
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          maxLines: 1,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
