import 'package:equatable/equatable.dart';

import '../model/question_model.dart';

abstract class QuestionsState extends Equatable {
  const QuestionsState();
}

class QuestionInitial extends QuestionsState {
  @override
  List<Object> get props => [];
}

class QuestionLoading extends QuestionsState {
  @override
  List<Object> get props => [];
}

class QuestionSuccess extends QuestionsState {
  final List<QuestionModel> questions;

  const QuestionSuccess({required this.questions});

  @override
  List<Object> get props => [];
}

class NextQuestionSuccess extends QuestionsState {
  final int selectedQuestion;

  const NextQuestionSuccess({required this.selectedQuestion});

  @override
  List<Object> get props => [];
}

class ScoreSuccess extends QuestionsState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class QuestionFailure extends QuestionsState {
  final String error;

  const QuestionFailure({required this.error});

  @override
  List<Object> get props => [];
}
