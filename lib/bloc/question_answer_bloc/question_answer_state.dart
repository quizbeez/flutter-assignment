part of 'question_answer_bloc.dart';

@immutable
abstract class QuestionAnswerState extends Equatable {}

class QuestionAnswerInitialState extends QuestionAnswerState {
  @override
  List<Object?> get props => [];
}

class SuccessState extends QuestionAnswerState {
  final List<QuestionAnswerModel> model;

  SuccessState(this.model);

  @override
  List<Object?> get props => [model];
}

class NextQuestionState extends QuestionAnswerState {
  final QuestionAnswerModel model;

  NextQuestionState(this.model);

  @override
  List<Object?> get props => [model];
}

class ErrorState extends QuestionAnswerState {
  final String error;

  ErrorState(this.error);

  @override
  List<Object?> get props => [error];
}