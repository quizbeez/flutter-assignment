import 'package:flutter/material.dart';

import '../../../res/res.dart';


Widget getProgressBar() {
  return Container(
    margin: EdgeInsets.symmetric(
      horizontal: sizes.width * 0.3,
    ),
    child: LinearProgressIndicator(
      backgroundColor: colors.white.withOpacity(0.2),
      valueColor: AlwaysStoppedAnimation<Color>(
        colors.white,
      ),
    ),
  );
}