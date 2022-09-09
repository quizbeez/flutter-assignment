import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_home_assignment/questions/bloc/questions_bloc.dart';
import 'package:flutter_home_assignment/questions/ui/quiz_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestionsBloc(),
      child: const MaterialApp(
        title: 'Question Trivia',
        home: QuizScreen(),
      ),
    );
  }
}
