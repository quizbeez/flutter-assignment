import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget({
    Key? key,
    required this.score,
    required this.resetQuiz,
    required this.resultPhrase,
  }) : super(key: key);
  final int score;
  final Function() resetQuiz;
  final String resultPhrase;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
          Text(
            'Score ' '$score',
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
          TextButton(
            onPressed: resetQuiz,
            child: const Text(
              'Restart Quiz',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
