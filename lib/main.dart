import 'package:flutter/material.dart';
import 'package:flutter_home_assignment/question_screen/question_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(374, 812),
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            title: 'Flutter App Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const QuestionScreen(),
          );
        });
  }
}
