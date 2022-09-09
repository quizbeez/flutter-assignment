import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_home_assignment/style/dimensions.dart';

import '../style/color_constants.dart';

class UiUtils {
  Widget gapWidget({double? height = 0, double? width = 0}) {
    return SizedBox(
      height: height,
      width: width,
    );
  }

  text_style(double fontSize, Color fontColor, FontWeight fontWeight) {
    return TextStyle(
        fontSize: fontSize,
        color: fontColor,
        //  fontFamily: fontFamily,
        fontWeight: fontWeight);
  }

  Widget widgetText(
      String text, double fontSize, Color fontColor, FontWeight fontWeight) {
    return Text(text, style: text_style(fontSize, fontColor, fontWeight));
  }

  Widget widgetButtonWithIcon(String text, Color textColor, String icon,
      Color bgColor, Color borderColor, GestureTapCallback? onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: double.infinity,
          height: 48, //Dimensions.screenHeight / 14,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(48.0),
            color: bgColor,
            border: Border.all(
              color: borderColor,
              width: .5,
            ),
          ),
          child: Stack(
            children: [
              // Padding(
              //   padding: const EdgeInsets.only(left: 15),
              //   child: Align(
              //     alignment: Alignment.center,
              //     child: SvgPicture.asset(
              //       icon,
              //     ),
              //   ),
              // ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: SvgPicture.asset(
                            icon,
                          ),
                        ),
                        widgetText(text, 16, ColorConstants.gray7A, FontWeight.bold),
                      ],
                    )),
              ),
            ],
          )),
    );
  }

  Widget loadingWidget() {
    return const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(ColorConstants.blue11),
    );
  }

  Widget appButton(
      {required VoidCallback? onPressFunction,
      String? buttonText,
      Color? buttonFillColor,
      Color? buttonBorderColor,
      Color? buttonTextColor}) {
    return Container(
      height: 56,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(buttonFillColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: buttonBorderColor!)))),
          onPressed: () {
            onPressFunction != null ? onPressFunction() : null;
          },
          child: Center(
              child: Text(
            buttonText ?? "N/A",
            style: TextStyle(
                fontSize: Dimensions.screenWidth / 18,
                fontWeight: FontWeight.w500,
                color: buttonTextColor,
                decoration: TextDecoration.none),
          ))),
    );
  }

  EdgeInsets setDiffPadding(
      {double left = 0, double top = 0, double right = 0, double bottom = 0}) {
    return EdgeInsets.fromLTRB(left, top, right, bottom);
  }

  EdgeInsets setAllPadding(double value) {
    return EdgeInsets.all(value);
  }

  Widget appTextButton(
      {required VoidCallback onPressFunction,
      String? buttonText,
      Color? buttonTextColor,
      bool? isLinkText = false}) {
    return TextButton(
        onPressed: () {
          onPressFunction();
        },
        child: Text(buttonText ?? "N/A",
            style: TextStyle(
                color: buttonTextColor,
                fontSize: Dimensions.screenWidth / 22,
                letterSpacing: 0.25,
                fontWeight: FontWeight.w500,
                decoration: isLinkText == false
                    ? TextDecoration.none
                    : TextDecoration.underline)));
  }

  showLogMessage({
    required var className,
    required String functionName,
    required String message,
  }) {
    if (message.isNotEmpty && kDebugMode) {
      return debugPrint(
          "className : $className , functionName: $functionName , message :$message");
    }
  }

  Widget dividerWidget() {
    return const Divider(
      color: ColorConstants.black44,
      thickness: 1.0,
    );
  }
}
