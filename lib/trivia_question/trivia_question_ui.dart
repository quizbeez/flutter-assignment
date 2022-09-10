import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_home_assignment/button_widgets/button_widget.dart';
import 'package:flutter_home_assignment/trivia_question/bloc/trivia/trivia_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TriviaHomePage extends StatefulWidget {
  const TriviaHomePage({Key? key}) : super(key: key);

  @override
  State<TriviaHomePage> createState() => _TriviaHomePageState();
}

class _TriviaHomePageState extends State<TriviaHomePage> {
  late Timer queTime;
  var time = 10;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() {
    queTime = Timer.periodic(const Duration(seconds: 1), (t) {
      if (time > 0) {
        setState(() {
          time--;
        });
      } else {
        BlocProvider.of<TriviaBloc>(context).add(TriviaEvent.timeout());
        setState(() {
          time = 10;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TriviaBloc, TriviaState>(
      listenWhen: (p, c) => p.answerState != c.answerState,
      listener: (context, state) {
        state.answerState.maybeWhen(
          orElse: () {},
          inCorrect: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Incorrect answer'),
              ),
            );
          },
          correct: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Correct answer'),
              ),
            );
          },
          unAnswered: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Timeout!'),
              ),
            );
          },
        );
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      20.r,
                      15.r,
                      20.r,
                      8.r,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.clear,
                          size: 30.r,
                        ),
                        Spacer(),
                        Image.asset("assets/images.png", width: 30),
                        Container(
                          height: 20.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.shade200,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.zero,
                              topRight: Radius.circular(20.0.r),
                              bottomLeft: Radius.zero,
                              bottomRight: Radius.circular(20.0.r),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "100",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 17,
                                  color: Colors.blueGrey.shade900),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0.r),
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.green.shade200,
                      color: Colors.green,
                      value: time / 10,
                      semanticsLabel: 'Linear progress indicator',
                    ),
                  ),
                  Image.asset("assets/human-brain-removebg-preview.png",
                      width: 50.sw),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                      width: 1 * 0.70.sw,
                      child: Text(
                        state.questions[state.index]["text"],
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w900,
                            color: Colors.blueGrey.shade700),
                      )),
                  SizedBox(height: 30.h),
                  Column(
                    children: List<Widget>.generate(4, (index) {
                      var options = [
                        ...state.questions[state.index]['incorrect'],
                        state.questions[state.index]['correct']
                      ];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            height: 50.h,
                            width: 1 * 0.80.sw,
                            child: AnswerButtons(
                              text: options[index],
                              onTap: () {
                                setState(() {
                                  time = 10;
                                });
                                BlocProvider.of<TriviaBloc>(context)
                                    .add(TriviaEvent.answer(options[index]));
                              },
                            )),
                      );
                    }),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
