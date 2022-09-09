part of 'questions_bloc.dart';

abstract class QuestionsState extends Equatable {
  const QuestionsState();
  
  @override
  List<Object> get props => [];
}

class QuestionsInitial extends QuestionsState {}

class QuestionsLoaded extends QuestionsState{
  final List<Question> questions;
  final List<String> answers;
  final int currentPage;
  final double factor;

  const QuestionsLoaded({required this.questions, this.answers = const [], this.currentPage = 0, this.factor = 0});

  @override 
  List<Object> get props => [questions,answers,currentPage,factor];
}
