import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_notes/src/core/constants/colors.dart';

extension FontThemes on TextTheme {
  TextStyle get mainTitle => TextStyle(
        fontSize: 24.sp,
        color: primaryDarkBlue,
        fontWeight: FontWeight.bold,
      );

  TextStyle get menuItemActive => TextStyle(
        fontSize: 14.sp,
        color: primaryPurple,
        fontWeight: FontWeight.bold,
      );

  TextStyle get menuItemNotActive => TextStyle(
        fontSize: 14.sp,
        color: secondaryPurple,
        fontWeight: FontWeight.bold,
      );

  TextStyle get bodyB10 => TextStyle(
        fontSize: 10.sp,
        color: primaryDarkBlue,
        fontWeight: FontWeight.bold,
      );

  TextStyle get bodyB10Purple => TextStyle(
        fontSize: 10.sp,
        color: secondaryPurple,
        fontWeight: FontWeight.bold,
      );

  TextStyle get bodyB10White => TextStyle(
        fontSize: 10.sp,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      );

  TextStyle get bodyB12 => TextStyle(
        fontSize: 12.sp,
        color: primaryDarkBlue,
        fontWeight: FontWeight.bold,
      );

  TextStyle get bodyB12White => TextStyle(
        fontSize: 12.sp,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      );

  TextStyle get bodyB14 => TextStyle(
        fontSize: 14.sp,
        color: primaryDarkBlue,
        fontWeight: FontWeight.bold,
      );

  TextStyle get bodyB14White => TextStyle(
        fontSize: 14.sp,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      );

  TextStyle get bodyB14Grey => TextStyle(
        fontSize: 14.sp,
        color: secondaryPurple,
        fontWeight: FontWeight.bold,
      );

  TextStyle get bodyB16 => TextStyle(
        fontSize: 16.sp,
        color: primaryDarkBlue,
        fontWeight: FontWeight.bold,
      );

  TextStyle get bodyB16White => TextStyle(
        fontSize: 16.sp,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      );

  TextStyle get bodyB20 => TextStyle(
        fontSize: 20.sp,
        color: primaryDarkBlue,
        fontWeight: FontWeight.bold,
      );

  TextStyle get bodyB20Purple => TextStyle(
    fontSize: 20.sp,
    color: primaryPurple,
    fontWeight: FontWeight.bold,
  );

  TextStyle get bodyB20White => TextStyle(
        fontSize: 20.sp,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      );

  TextStyle get body10 => TextStyle(
        fontSize: 10.sp,
        color: primaryDarkBlue,
      );

  TextStyle get body10White => TextStyle(
        fontSize: 10.sp,
        color: Colors.white,
      );

  TextStyle get body12 => TextStyle(
        fontSize: 12.sp,
        color: primaryDarkBlue,
      );

  TextStyle get body12White => TextStyle(
        fontSize: 12.sp,
        color: Colors.white,
      );

  TextStyle get dateStyle => TextStyle(
        fontSize: 7.sp,
        color: secondaryPurple,
      );

  TextStyle get categoryStyle => TextStyle(
        fontSize: 10.sp,
        color: primaryPurple,
        fontWeight: FontWeight.bold,
      );

  TextStyle get paginationFontActive => TextStyle(
        fontSize: 16.sp,
        color: primaryPurple,
        fontWeight: FontWeight.bold,
      );

  TextStyle get paginationFontNotActive => TextStyle(
        fontSize: 16.sp,
        color: secondaryPurple,
        fontWeight: FontWeight.bold,
      );
}
