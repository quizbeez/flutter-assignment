import 'package:flutter/material.dart';
import 'package:flutter_home_assignment/res/app_assets.dart';
import 'package:flutter_home_assignment/res/app_colors.dart';
import 'package:flutter_home_assignment/res/app_strings.dart';
import 'package:flutter_home_assignment/res/text_styles.dart';

class RemainingCoins extends StatelessWidget {
  const RemainingCoins({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width*.22,
            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24), 
              color: AppColors.grey
            ),
            child: Text(
              AppStrings.remainingCoins,
              textAlign: TextAlign.end,
              style: kCoinTextStyle,
            ),
          ),
        ),
        Align(alignment: Alignment.centerLeft,child: Image.asset(AppAssets.coinAsset,height: MediaQuery.of(context).size.width*.1,))
      ],
    );
  }
}