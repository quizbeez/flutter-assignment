import 'package:flutter/material.dart';
import 'package:flutter_home_assignment/ui/quiz/quiz_page.dart';

Route? generateRoute(RouteSettings settings) {
  return MaterialPageRoute(
    builder: (BuildContext context) {
      switch (settings.name) {
        default:
          return const QuizPage();
      }
    }
  );
}
