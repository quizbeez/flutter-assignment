import 'package:flutter_home_assignment/bloc/all_bloc.dart';
import 'package:flutter_home_assignment/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/all_config.dart';
import '../../data/response_model/all_response_model.dart';
import 'question_answer_screen.dart';

class QuestionAnswerPage extends StatefulWidget {
  static const routeName = "/QuestionAnswerPage";

  const QuestionAnswerPage({Key? key}) : super(key: key);

  @override
  State<QuestionAnswerPage> createState() => _QuestionAnswerPageState();
}

class _QuestionAnswerPageState extends State<QuestionAnswerPage> {
  List<QuestionAnswerModel> _allQuestionAnswer = [];
  QuestionAnswerModel? _nextModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorWhite,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const Icon(
            Icons.close,
            color: colorBlack,
          ),
          actions: const [
            ScoreCountView(),
          ],
        ),
        body: BlocProvider(
          create: (context) {
            return QuestionAnswerBloc();
          },
          child: BlocConsumer<QuestionAnswerBloc, QuestionAnswerState>(
            listener: (context, state) {
              if (state is SuccessState) {
                _allQuestionAnswer = state.model;
                BlocProvider.of<QuestionAnswerBloc>(context).add(LoadNextQuestionEvent(data: _allQuestionAnswer, index: 0));
              }
              if (state is NextQuestionState) {
                _nextModel = state.model;
              }
              if (state is ErrorState) {
                printLog("DATA : not found : ${state.error}");
              }
            },
            builder: (context, state) {
              if (state is QuestionAnswerInitialState) {
                BlocProvider.of<QuestionAnswerBloc>(context).add(LoadQuizEvent());
              }

              return SingleChildScrollView(child: BodyView(_nextModel, _loadNextQuestion));
            },
          ),
        ));
  }

  void _loadNextQuestion(int index, BuildContext buildContext) {
    int nextIndex = index + 1;
    if(_allQuestionAnswer.length > nextIndex) {
      BlocProvider.of<QuestionAnswerBloc>(buildContext).add(LoadNextQuestionEvent(data: _allQuestionAnswer, index: nextIndex));
    }
  }
}
