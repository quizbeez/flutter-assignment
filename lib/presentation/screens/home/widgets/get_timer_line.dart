import 'package:flutter/material.dart';
import 'package:flutter_home_assignment/presentation/res/res.dart';

class TimerSeparator extends StatelessWidget {
  const TimerSeparator({
    Key? key,
    required this.value,
    required this.finalValue,
  }) : super(key: key);

  final int value;
  final int finalValue;

  @override
  Widget build(BuildContext context) {
    double ratio = value / finalValue;
    return Container(
      color: colors.white,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: sizes.heightRatio * 6,
                decoration: BoxDecoration(
                  color: colors.greyLite.withOpacity(0.5),
                ),
              ),
              Material(
                child: AnimatedContainer(
                  height: sizes.heightRatio * 6,
                  width: sizes.width * ratio,
                  duration: const Duration(
                    milliseconds: 600,
                  ),
                  decoration: BoxDecoration(
                    color: ratio < 0.1
                        ? colors.deepOrange
                        : ratio < 0.2
                            ? colors.amber
                            : ratio < 0.3
                                ? colors.green
                                : ratio < 0.4
                                    ? colors.cyan
                                    : ratio < 0.5
                                        ? colors.deepPurple
                                        : ratio < 0.6
                                            ? colors.purple
                                            : ratio < 0.7
                                                ? colors.red
                                                : ratio < 0.8
                                                    ? colors.pink
                                                    : ratio < 0.9
                                                        ? colors.brwon
                                                        : colors.appColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
