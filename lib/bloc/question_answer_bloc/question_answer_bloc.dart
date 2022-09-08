import 'package:flutter_home_assignment/data/response_model/all_response_model.dart';
import 'package:flutter_home_assignment/mock_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'question_answer_event.dart';

part 'question_answer_state.dart';

class QuestionAnswerBloc extends Bloc<QuestionAnswerEvent, QuestionAnswerState> {
  QuestionAnswerBloc() : super(QuestionAnswerInitialState()) {
    on<LoadQuizEvent>((event, emit) async {
      try {
        List<QuestionAnswerModel> questionsModels = [];
        for (var data in kQuestions) {
          questionsModels.add(QuestionAnswerModel.fromJson(data));
        }
        emit(SuccessState(questionsModels));
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });

    on<LoadNextQuestionEvent>((event, emit) async {
      try {
        List<QuestionAnswerModel> questionsModels = event.data ?? [];
        int index = event.index ?? 0;
        emit(NextQuestionState(questionsModels[index]));
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });
  }
}
