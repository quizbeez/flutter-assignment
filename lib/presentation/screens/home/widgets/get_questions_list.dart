import 'package:flutter/material.dart';
import 'package:flutter_home_assignment/presentation/models/questions.dart';

import '../../../res/constants.dart';
import '../../../res/res.dart';
import '../../../widgets/spacer.dart';

class QuestionsList extends StatelessWidget {
  const QuestionsList({
    Key? key,
    required this.questions,
  }) : super(key: key);

  final Questions questions;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalValue(16),
      ),
      child: Text(
        questions.correct ?? AppConstants.brain,
        style: TextStyle(
          decoration: TextDecoration.none,
          fontWeight: FontWeight.w500,
          fontSize: sizes.fontRatio * 16,
          color: Colors.black.withOpacity(0.6),
        ),
      ),
    );
  }
}
