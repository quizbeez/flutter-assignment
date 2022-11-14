import 'dart:async';
import 'dart:developer';

import 'package:flutter_home_assignment/src/features/quizz/models/answer_model.dart';
import 'package:flutter_home_assignment/src/features/quizz/models/question_model.dart';
import 'package:get/get.dart';

class QuizzController extends GetxController {
  var _questionIndex = 0.obs;
  final _totalScore = 0.obs;
  final _seconds = 10.0.obs;
  late Timer timer;

  final _questionsList = <QuestionModel>[
    QuestionModel(
      question: 'What is one potential environmental concern about Web 3.0?',
      options: [
        AnswerModel(
          answer: 'Machine learning causes global warming',
          score: 0,
          correct: false,
        ),
        AnswerModel(
          answer: 'Unsecure networks lead to terrorist attacks',
          score: 0,
          correct: false,
        ),
        AnswerModel(
          answer: 'NFTs contribute to poaching of animals',
          score: 0,
          correct: false,
        ),
        AnswerModel(
          answer: 'Blockchains can use a lot of energy',
          score: 10,
          correct: true,
        ),
      ],
    ),
    QuestionModel(
      question:
          'Which of the following is an example of a trustless transaction that takes place on Web 3.0?',
      options: [
        AnswerModel(
          answer: 'Paying someone through PayPal',
          score: 0,
          correct: false,
        ),
        AnswerModel(
          answer: 'Buying something on Amazon.com',
          score: 0,
          correct: false,
        ),
        AnswerModel(
          answer: 'Taking a screenshot of an NFT',
          score: 0,
          correct: false,
        ),
        AnswerModel(
          answer: 'Sending Bitcoin to someone else',
          score: 10,
          correct: true,
        ),
      ],
    ),
  ].obs;

  List<QuestionModel> get questionsList => _questionsList;
  int get questionIndex => _questionIndex.value;
  int get totalScore => _totalScore.value;
  double get seconds => _seconds.value;
  String get resultPhrase {
    String resultText;
    if (_totalScore.value >= 20) {
      resultText = 'You are awesome!';
    } else if (_totalScore.value >= 10) {
      resultText = 'Pretty likeable!';
    } else {
      resultText = 'This is a poor score!';
    }
    return resultText;
  }

  resetQuiz() {
    _questionIndex(0);
    _totalScore(0);
    // resetTimer();
    if (_questionIndex.value < _questionsList.length) {
      startTimer();
    } else {
      stopTimer();
      resetTimer();
    }
  }

  userAnswer(int score) {
    if (timer.isActive) {
      stopTimer();
    }
    _totalScore.value += score;
    _questionIndex += 1;
    // resetTimer();
    if (_questionIndex.value < _questionsList.length) {
      startTimer();
    } else {
      stopTimer();
      resetTimer();
    }
    log('Current questionIndex: ${_questionIndex.value}');
  }

  resetTimer() => _seconds.value = 10;

  stopTimer() => {timer.cancel()};

  startTimer() {
    resetTimer();
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        if (_seconds.value > 0) {
          _seconds.value--;
        } else {
          stopTimer();
          userAnswer(0);
        }
      },
    );
  }

  @override
  void onReady() {
    startTimer();
    super.onReady();
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }
}
