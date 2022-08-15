import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_home_assignment/presentation/widgets/spacer.dart';

import '../../../res/res.dart';

Widget getActionButton({
  required Function onTap,
  required String text,
}) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.symmetric(
      horizontal: horizontalValue(16),
    ),
    child: FlatButton(
      padding: EdgeInsets.symmetric(
        vertical: verticalValue(16),
      ),
      color: colors.actionButtonColor,
      disabledColor: colors.white,
      splashColor: colors.white,
      focusColor: colors.actionButtonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      onPressed: ()=>onTap(),
      child: Text(
        text,
        style: TextStyle(
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w300,
            fontSize: sizes.fontRatio*16,
            color: Colors.white,
        ),
      ),
    ),
  );
}
