part of 'question_bloc.dart';

class QuestionState extends Equatable {
  int currentTimer;
  int currentIndex;
  List mcqList;

  QuestionState({
    this.currentTimer = 0,
    this.currentIndex = 0,
    this.mcqList = const [],
  });

  QuestionState copyWith(
          {int? currentTimer, int? currentIndex, List? mcqList}) =>
      QuestionState(
        currentTimer: currentTimer ?? this.currentTimer,
        currentIndex: currentIndex ?? this.currentIndex,
        mcqList: mcqList ?? this.mcqList,
      );

  @override
  List<Object> get props => [currentTimer, currentIndex, mcqList];
}
