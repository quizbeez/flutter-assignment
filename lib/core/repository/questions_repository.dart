import 'package:flutter_home_assignment/core/model/question.dart';
import 'package:flutter_home_assignment/mock_data.dart';

class QuestionsRepository {

  Iterator<Question>? _questions;

  List<Question> questions() {
    return kQuestions
        .map(
          (item) => Question(
            text: item["text"] as String,
            correct: item["correct"] as String,
            incorrect: item["incorrect"] as List<String>,
          ),
        )
        .toList();
  }

  Question? nextQuestion() {
    _questions ??= questions().iterator;
    _questions?.moveNext();
    return _questions?.current;
  }
}
