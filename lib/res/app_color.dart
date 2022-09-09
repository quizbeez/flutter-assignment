
import 'package:flutter/material.dart';
import 'package:flutter_home_assignment/res/hex_color.dart';

class AppColor{
  static Color transparent = Colors.transparent;
  static Color white = Colors.white;
  static Color black = Colors.black;
  static Color gray = HexColor("#F5F6FA");
  static Color green = HexColor("#69BE5A");
  static Color red = HexColor("#E13435");
  static Color buttonColor = HexColor("#6152D9");
  static Color textColor = HexColor("#5F5F73");
  static Color progressBgColor = HexColor("#E4E6F5");
  static Color backGroundColor = HexColor("#F6F9FF");

  static const progressGradient = LinearGradient(
    colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

}