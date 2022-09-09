import 'package:flutter/material.dart';
import 'package:flutter_home_assignment/res/app_colors.dart';
import 'package:flutter_home_assignment/res/text_styles.dart';
import 'package:flutter_home_assignment/views/questions/questions_view.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "deniz-123",
      home: Builder(
        builder: (context) {
          return Scaffold(
            body: Center(
              child: InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const QuestionsView())),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: AppColors.purple,
                  ),
                  child: Text(
                    "Questions",
                    style: kAnswerTextStyle,
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}