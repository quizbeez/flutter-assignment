import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_home_assignment/mock_data.dart';
import 'package:flutter_home_assignment/modules/quiz/cubit/home_state.dart';
import 'package:flutter_home_assignment/modules/quiz/model/question_model.dart';

class HomeCubit extends Cubit<HomeState> {
  int score = 0;
  int currentIndex = 0;
  int currentAnsTotal = 0;
  List<QuestionModel> questionList = [];

  HomeCubit() : super(QuestionLoading()) {
    loadQuestions();
  }


  void loadQuestions() async {
    emit(QuestionLoading());
    for (var que in kQuestions) {
      questionList.add(QuestionModel.fromJson(que));
    }
    if (questionList.isNotEmpty) {
      emit(QuestionLoaded(questionList: questionList));
    } else {
      emit(QuestionFailed());
    }
  }

  void nextQuestion({required isCorrect}) async {
    emit(QuestionAnswer());
    if (isCorrect) {
      score += 1;
      currentAnsTotal++;
    }
    await Future.delayed(const Duration(seconds: 1));

    currentIndex++;
    if (currentIndex > questionList.length-1) {
      emit(QuestionCompleted());
    } else {
      emit(QuestionLoaded(questionList: questionList));
    }
  }

  void resetQuiz() {
    emit(QuestionLoading());
    currentIndex = 0;
    currentAnsTotal = 0;
    score = 0;
    if (questionList.isNotEmpty) {
      emit(QuestionLoaded(questionList: questionList));
    } else {
      emit(QuestionFailed());
    }
  }
}
