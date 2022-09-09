import 'package:flutter/material.dart';
import 'package:flutter_home_assignment/res/app_colors.dart';


class QuestionTimer extends StatelessWidget {
  final double factor;
  const QuestionTimer({super.key, required this.factor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 6,
          color: AppColors.grey,
          
        ),
         Container(
          width: MediaQuery.of(context).size.width*factor,
          height: 6,
          color: AppColors.lightGreen,
          
        ),
      ],
    );
  }
}