import 'package:flutter_home_assignment/src/features/quizz/models/answer_model.dart';

class QuestionModel {
  String? question;
  List<AnswerModel>? options;

  QuestionModel({this.options, this.question});
}
