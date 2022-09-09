import 'package:equatable/equatable.dart';

class QuestionModel extends Equatable {
  String? questions;
  String? answer;
  List<String>? options;

  QuestionModel({this.questions, this.answer, this.options});

  QuestionModel.fromJson(Map<String, dynamic> json) {
    options = json['options'].cast<String>();
    questions = json['question'];
    answer = json['answer'];
  }

  @override
  // TODO: implement props
  List<Object?> get props => [questions, answer, options];
}
