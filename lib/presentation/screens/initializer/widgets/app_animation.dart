import 'package:flutter/material.dart';
import 'package:flutter_home_assignment/presentation/res/assets.dart';
import 'package:flutter_home_assignment/presentation/res/res.dart';
import 'package:lottie/lottie.dart';

Widget getAppAnimation() => Container(
      height: sizes.heightRatio * 100,
      width: sizes.widthRatio * 100,
      child: Lottie.asset(
        AppAssets.appAnimation,
        repeat: true,
      ),
    );
