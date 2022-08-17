import 'package:equatable/equatable.dart';

class QuestionsModel extends Equatable {
  QuestionsModel({this.question, this.answer, this.options});

  String? question;
  String? answer;
  List<String>? options;

  QuestionsModel.fromJson(Map<String, dynamic> json) {
    options = json['options'].cast<String>();
    question = json['question'];
    answer = json['answer'];
  }

  @override
  List<Object?> get props => [question, answer, options];
}
