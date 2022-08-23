part of 'quiz_cubit.dart';

@immutable
abstract class QuizState extends Equatable {}

class QuizLoading extends QuizState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class QuizLoaded extends QuizState {
  List<Questions> questions = [];
  QuizLoaded({required this.questions});
  @override
  List<Object> get props => [questions];
}

class QuizFailed extends QuizState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NextQuiz extends QuizState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class QuizAnswer extends QuizState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class QuizCompleted extends QuizState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
