part of 'question_bloc.dart';

abstract class QuestionEvent extends Equatable {
  const QuestionEvent();

  @override
  List<Object> get props => [];
}

class RefreshDataTimer extends QuestionEvent {
  int currentTimer;
  int currentIndex;
  List mcqList;

  RefreshDataTimer(
      {required this.currentTimer,
      required this.currentIndex,
      required this.mcqList});
}
