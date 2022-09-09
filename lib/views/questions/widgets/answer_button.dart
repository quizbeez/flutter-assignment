import 'package:flutter/material.dart';
import 'package:flutter_home_assignment/res/app_colors.dart';
import 'package:flutter_home_assignment/res/text_styles.dart';

class AnswerButton extends StatelessWidget {
  final String answer;
  final Function() onTap;
  const AnswerButton({super.key, required this.answer, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          color: AppColors.purple,
          borderRadius: BorderRadius.circular(6)
        ),
        child: Center(
          child: Text(
            answer,
            maxLines: null,
            textAlign: TextAlign.center,
            style: kAnswerTextStyle,
          ),
        ),
      ),
    );
  }
}