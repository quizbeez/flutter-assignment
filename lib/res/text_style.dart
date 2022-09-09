
import 'package:flutter/material.dart';
import 'package:flutter_home_assignment/res/app_color.dart';
import 'package:flutter_home_assignment/res/size_config.dart';

const String fontFamilyPoppins = "Poppins";

TextStyle lightTextStyle({required double fontSize,Color? txtColor, String? fontFamily})=>TextStyle(
    fontSize: fontSize.sp,
    color: txtColor ?? AppColor.black,
    fontWeight: FontWeight.w300,
    fontFamily: fontFamily ?? fontFamilyPoppins,
);

TextStyle regularTextStyle({required double fontSize,Color? txtColor, String? fontFamily})=>TextStyle(
    fontSize: fontSize.sp,
    color: txtColor ?? AppColor.black,
  fontFamily: fontFamily ?? fontFamilyPoppins,
);

TextStyle mediumTextStyle({required double fontSize,Color? txtColor,String? fontFamily})=>TextStyle(
    fontSize: fontSize.sp,
    color: txtColor ?? AppColor.black,
    fontWeight: FontWeight.w500,
  fontFamily: fontFamily ?? fontFamilyPoppins,
);

TextStyle semiBoldTextStyle({required double fontSize,Color? txtColor,String? fontFamily})=>TextStyle(
    fontSize: fontSize.sp,
    color: txtColor ?? AppColor.black,
    fontWeight: FontWeight.w600,
  fontFamily: fontFamily ?? fontFamilyPoppins,
);

TextStyle boldTextStyle({required double fontSize,Color? txtColor, String? fontFamily})=>TextStyle(
    fontSize: fontSize.sp,
    color: txtColor ?? AppColor.black,
    fontWeight: FontWeight.w700,
  fontFamily: fontFamily ?? fontFamilyPoppins,
);

TextStyle extraBoldTextStyle({required double fontSize,Color? txtColor, String? fontFamily})=>TextStyle(
    fontSize: fontSize.sp,
    color: txtColor ?? AppColor.black,
    fontWeight: FontWeight.w800,
  fontFamily: fontFamily ?? fontFamilyPoppins,
);