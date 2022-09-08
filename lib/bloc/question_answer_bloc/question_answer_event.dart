part of 'question_answer_bloc.dart';

@immutable
abstract class QuestionAnswerEvent extends Equatable {
  const QuestionAnswerEvent();
}

class LoadQuizEvent extends QuestionAnswerEvent {
  @override
  List<Object> get props => [];
}

class LoadNextQuestionEvent extends QuestionAnswerEvent {
  final List<QuestionAnswerModel>? data;
  final int? index;

  const LoadNextQuestionEvent({this.data, this.index});

  @override
  List<Object> get props => [data ?? [], index ?? 0];
}