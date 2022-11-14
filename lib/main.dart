import 'package:flutter/material.dart';
import 'package:flutter_home_assignment/src/features/quizz/bindings/quizz_bindings.dart';
import 'package:flutter_home_assignment/src/features/quizz/screens/quizz_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: QuizzBindings(),
      debugShowCheckedModeBanner: false,
      title: 'Quizz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const QuizzScreen(),
    );
  }
}
