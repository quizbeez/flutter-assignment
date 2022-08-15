import 'package:flutter/material.dart';
import 'package:flutter_home_assignment/presentation/res/assets.dart';
import 'package:flutter_home_assignment/presentation/res/res.dart';
import 'package:lottie/lottie.dart';

import '../../../widgets/spacer.dart';

Widget getAppBar() => Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalValue(16),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.cancel,
          ),
          const Spacer(),
          SizedBox(
            width: sizes.widthRatio * 60,
            height: sizes.heightRatio * 60,
            child: Lottie.asset(
              AppAssets.coinsAnimation,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: verticalValue(8),
              horizontal: horizontalValue(8),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: colors.greyLite.withOpacity(0.2),
            ),
            child: Text(
              '100',
              style: TextStyle(
                fontSize: sizes.fontRatio*14,
                decoration: TextDecoration.none,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
