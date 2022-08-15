import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_home_assignment/mock_data.dart';
import 'package:flutter_home_assignment/presentation/bloc/custom_timer/custom_timer_bloc.dart';
import 'package:flutter_home_assignment/presentation/bloc/custom_timer/custom_timer_event.dart';
import 'package:flutter_home_assignment/presentation/bloc/custom_timer/custom_timer_state.dart';
import 'package:flutter_home_assignment/presentation/models/questions.dart';
import 'package:flutter_home_assignment/presentation/res/constants.dart';
import 'package:flutter_home_assignment/presentation/res/res.dart';
import 'package:flutter_home_assignment/presentation/screens/home/widgets/action_button.dart';
import 'package:flutter_home_assignment/presentation/screens/home/widgets/get_animated_travia.dart';
import 'package:flutter_home_assignment/presentation/screens/home/widgets/get_app_bar.dart';
import 'package:flutter_home_assignment/presentation/screens/home/widgets/get_questions_list.dart';
import 'package:flutter_home_assignment/presentation/screens/home/widgets/get_timer_line.dart';
import 'package:flutter_home_assignment/presentation/widgets/spacer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Questions> questions = [];

  @override
  void initState() {
    super.initState();
    initQuestions();
  }

  void initQuestions() {
    for (int i = 0; i < kQuestions.length; i++) {
      questions.add(
        Questions.fromJson(
          kQuestions[i],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomTimerBloc, CustomTimerState>(
      builder: (context, state) {
        context.read<CustomTimerBloc>().add(
              TimerStarted(
                state.duration,
                state.question,
              ),
            );
        return Container(
          color: colors.white,
          child: Column(
            children: [
              verticalSpacer(32),
              getAppBar(),
              verticalSpacer(6),
              TimerSeparator(
                value: state.duration,
                finalValue: 20,
              ),
              getAnimatedTrivia(),
              verticalSpacer(16),
              QuestionsList(
                questions: questions[state.question],
              ),
              const Spacer(),
              getActionButton(
                onTap: () {},
                text: AppConstants.fifty,
              ),
              verticalSpacer(16),
              getActionButton(
                onTap: () {},
                text: AppConstants.allOfIt,
              ),
              verticalSpacer(16),
              getActionButton(
                onTap: () {},
                text: AppConstants.seventy,
              ),
              verticalSpacer(16),
              getActionButton(
                onTap: () {},
                text: AppConstants.hundred,
              ),
              verticalSpacer(24),
            ],
          ),
        );
      },
    );
  }
}
