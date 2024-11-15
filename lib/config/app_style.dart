import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_color.dart';

class AppStyle{
  static TextStyle appBarTitleStyle({double? fontSize,FontWeight? fontWeight ,Color? color, }) {
    return TextStyle(
      fontSize: fontSize ?? 31.sp,
      fontWeight: fontWeight ?? FontWeight.w700,
      color:color ??  Colors.white,
      fontFamily: 'Urbanist',
    );
  }
  static TextStyle tileTextStyle({double? fontSize,FontWeight? fontWeight,}) {
    return TextStyle(
      fontSize: fontSize ?? 15.sp,
      fontWeight: fontWeight ?? FontWeight.w600,
      fontFamily: 'Urbanist',
    );
  }
  static TextStyle textfdTextStyle({Color? color,double? size, FontWeight? fontWeight }) {
    return  TextStyle(
      fontSize: size ?? 17.sp,
      fontWeight: fontWeight ?? FontWeight.w500,
      fontFamily: 'Poppins',
      color:color ?? AppColor.textClr,
    );
  }
  static TextStyle blackClrtxtSyle({double? fontSize,FontWeight? fontWeight,Color? color}) {
    return  TextStyle(
      fontSize: fontSize ?? 20.sp,
      fontWeight: fontWeight ?? FontWeight.w400,
      fontFamily: 'Montserrat',
      color: color ?? AppColor.textblack3A,
    );
  }
  static TextStyle btnStyle({double? fontSize,FontWeight? fontWeight }) {
    return TextStyle(
      fontSize: fontSize ?? 21.sp,
      fontWeight: fontWeight ?? FontWeight.w600,
      color:  Colors.white,
      fontFamily: 'Poppins',
    );
  }



}


