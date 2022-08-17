import 'package:equatable/equatable.dart';

import '../../../common/model/questions_model.dart';

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
  const QuestionSuccess({required this.questions});
  final List<QuestionsModel> questions;
  @override
  List<Object> get props => [questions];
}

class NextQuestionSuccess extends QuestionsState {
  const NextQuestionSuccess({required this.selectedPage});
  final int selectedPage;
  @override
  List<Object> get props => [selectedPage];
}

class IncreaseScoreSuccess extends QuestionsState {
  const IncreaseScoreSuccess();
  @override
  List<Object> get props => [];
}

class QuestionFailure extends QuestionsState {
  const QuestionFailure({required this.error});
  final String error;
  @override
  List<Object> get props => [error];
}
