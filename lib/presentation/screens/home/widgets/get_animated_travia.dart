import 'package:flutter/widgets.dart';
import 'package:flutter_home_assignment/presentation/res/assets.dart';
import 'package:flutter_home_assignment/presentation/res/res.dart';
import 'package:lottie/lottie.dart';

Widget getAnimatedTrivia() => Container(
      height: sizes.heightRatio * 170,
      width: sizes.widthRatio * 170,
      child: Lottie.asset(
        AppAssets.brainAnimation,
      ),
    );
