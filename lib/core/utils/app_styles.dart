import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppStyles {
  static String fontFamily = 'Cairo';
  static TextStyle textBold32 = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle textBold16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle textRegular16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle textRegular12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle textRegular14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle textMedium18 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle textMedium16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle textSemiBold24 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
  );
}
