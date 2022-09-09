part of 'questions_bloc.dart';

abstract class QuestionsEvent extends Equatable {
  const QuestionsEvent();

  @override
  List<Object> get props => [];
}

class LoadQuestions extends QuestionsEvent{
  
}

class AddAnswer extends QuestionsEvent{
  final String answer;

  const AddAnswer({required this.answer});

  @override 
  List<Object> get props => [answer];
}

class AddFactor extends QuestionsEvent{
  final double factor;

  const AddFactor({required this.factor});

  @override
  List<Object> get props => [factor];
}

class EndQuestions extends QuestionsEvent{}