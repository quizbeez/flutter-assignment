import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_home_assignment/core/model/question.dart';
import 'package:flutter_home_assignment/core/repository/questions_repository.dart';



class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizEmptyState()) {
    on<QuizEvent>(_handleEvent);
    nextQuestion();
  }

  final QuestionsRepository _repository = QuestionsRepository();
  Question? _question;

  void nextQuestion() {
    final question = _repository.nextQuestion();
    if (question != null) {
      _question = question;
      return emit(QuizQuestionState(question));
    } else {
      return emit(QuizEmptyState());
    }
  }

  void submitAnswer(String answer) {
    final question = _question!;
    emit(QuizAnswerState(question, question.correct == answer));
  }

  FutureOr<void> _handleEvent(QuizEvent event, Emitter<QuizState> emit) {
    if (event is QuizSubmitAnswerEvent) {
      submitAnswer(event.answer);
    }
  }
}



@immutable
abstract class QuizState {
  final Question? question;
  final bool? isCorrect;
  const QuizState({this.question, this.isCorrect});
}

class QuizEmptyState extends QuizState {}

class QuizQuestionState extends QuizState {
  const QuizQuestionState(question) : super(question: question);
}

class QuizAnswerState extends QuizState {
  const QuizAnswerState(question, isCorrect) : super(question: question, isCorrect: isCorrect);
}

class QuizErrorState extends QuizState {
  final Exception error;
  const QuizErrorState(this.error);
}



@immutable
abstract class QuizEvent {}

class QuizSubmitAnswerEvent extends QuizEvent {
  final String answer;
  QuizSubmitAnswerEvent(this.answer);
}

// import 'dart:async';
//
// import 'package:bloc/bloc.dart';
// import 'package:flutter_home_assignment/core/model/question.dart';
// import 'package:meta/meta.dart';
//
// part 'quiz_event.dart';
// part 'quiz_state.dart';
//
// class QuizBloc extends Bloc<QuizEvent, QuizState> {
//   QuizBloc() : super(QuizEmptyState()) {
//     on<QuizEvent>(_onQuizEvent);
//   }
//
//   Future<void> _onQuizEvent(QuizEvent event, Emitter<QuizState> emit) async {
//   }
// }
