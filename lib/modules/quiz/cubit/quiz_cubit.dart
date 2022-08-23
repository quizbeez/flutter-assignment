import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_home_assignment/mock_data.dart';
import 'package:flutter_home_assignment/models/questions.dart';
import 'package:meta/meta.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizLoading()) {
    loadQuestions();
  }
  List<Questions> questions = [];
  int currentIndex = 0;
  int score = 0;

  void loadQuestions() async {
    emit(QuizLoading());
    for (var que in kQuestions) {
      questions.add(Questions.fromJson(que));
    }
    if (questions.isNotEmpty) {
      emit(QuizLoaded(questions: questions));
    } else {
      emit(QuizFailed());
    }
  }

  void nextQuestion({required isCorrect}) async {
    emit(QuizAnswer());
    if (isCorrect) {
      score += 10;
    }
    await Future.delayed(const Duration(milliseconds: 700));

    ++currentIndex;
    if (currentIndex == questions.length) {
      emit(QuizCompleted());
    } else {
      emit(QuizLoaded(questions: questions));
    }
  }

  void resetQuiz() {
    emit(QuizLoading());
    score = 0;
    currentIndex = 0;
    if (questions.isNotEmpty) {
      emit(QuizLoaded(questions: questions));
    } else {
      emit(QuizFailed());
    }
  }
}
