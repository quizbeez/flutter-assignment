import 'package:flutter/material.dart';
import 'package:flutter_home_assignment/style/dimensions.dart';

class RoundedButton extends StatelessWidget {
  final String buttonName;
  final Color color;
  final Color textColor;
  final VoidCallback? onTap;

  const RoundedButton(
      {Key? key,
      required this.color,
      required this.onTap,
      required this.buttonName,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Dimensions.screenWidth,
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            buttonName,
            style: TextStyle(
                fontSize: 18, color: textColor, fontWeight: FontWeight.bold),
          ),
        )),
      ),
    );
  }
}
