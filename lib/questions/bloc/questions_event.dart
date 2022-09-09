import 'package:equatable/equatable.dart';

abstract class QuestionsEvent extends Equatable {
  const QuestionsEvent();
}

class FirstQuestionEvent extends QuestionsEvent {
  @override
  List<Object?> get props => [];
}

class ScoreEvent extends QuestionsEvent {
  @override
  List<Object?> get props => [];
}

class NextQuestionEvent extends QuestionsEvent {
  const NextQuestionEvent({required this.selectedQuestion});

  final int selectedQuestion;

  @override
  List<Object?> get props => [];
}
