import 'package:flutter/cupertino.dart';

class CommonTextWidget extends StatelessWidget {
  late var text = "";
  var fontWeight;
  double fontSize;
  var fontColor;
  var textAlignment;
  var height;
  var wordSpacing;
  var textDecoration;
  final int? maxLines;
  final TextOverflow? overflow;
  var fontFamily;
  bool hasStroke;
  var strokeColor;
  var decorationthickness;
  CommonTextWidget({
    required this.text,
    this.fontWeight,
    required this.fontSize,
    this.fontColor,
    this.textAlignment,
    this.height,
    this.textDecoration,
    this.wordSpacing,
    this.maxLines,
    this.overflow,
    this.fontFamily,
    required this.hasStroke,
    this.strokeColor,
    this.decorationthickness,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlignment,
        maxLines: maxLines,
        overflow: overflow,
        softWrap: true,
        style: hasStroke? TextStyle(
          height: height ?? 1.0,
          wordSpacing: wordSpacing,
            fontWeight: fontWeight,
            decoration: textDecoration,
            fontFamily: 'SFPro',
            decorationThickness: decorationthickness,
            fontSize: fontSize.toDouble(),
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 2
            ..color = strokeColor,
        ):TextStyle(
            height: height ?? 1.0,
            wordSpacing: wordSpacing,
            color: fontColor,
            fontWeight: fontWeight,
            decoration: textDecoration,
            fontFamily: 'SFPro',
            decorationThickness: decorationthickness,
            fontSize: fontSize.toDouble()));
  }
}
