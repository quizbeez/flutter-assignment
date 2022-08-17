import 'package:equatable/equatable.dart';

abstract class QuestionsEvent extends Equatable {
  const QuestionsEvent();
}

class InitialQuestionEvent extends QuestionsEvent {
  @override
  List<Object> get props => [];
}

class IncreaseScoreEvent extends QuestionsEvent {
  @override
  List<Object> get props => [];
}

class NextQuestionEvent extends QuestionsEvent {
  const NextQuestionEvent({required this.selectedPage});
  final int selectedPage;
  @override
  List<Object> get props => [];
}
