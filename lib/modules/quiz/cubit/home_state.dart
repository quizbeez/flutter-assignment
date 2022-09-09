import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_home_assignment/modules/quiz/model/question_model.dart';

@immutable
abstract class HomeState extends Equatable {}

class QuestionLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class QuestionLoaded extends HomeState {
  List<QuestionModel> questionList = [];
  QuestionLoaded({required this.questionList});
  @override
  List<Object> get props => [questionList];
}

class NextQuestion extends HomeState {
  @override
  List<Object?> get props => [];
}

class QuestionAnswer extends HomeState {
  @override
  List<Object?> get props => [];
}

class QuestionCompleted extends HomeState {
  @override
  List<Object?> get props => [];
}

class QuestionFailed extends HomeState {
  @override
  List<Object?> get props => [];
}










