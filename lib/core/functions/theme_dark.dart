import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ty/core/utils/app_colors.dart';
import 'package:se7ty/core/utils/app_styles.dart';

ThemeData themeDark() {
  return ThemeData(
    brightness: Brightness.dark,
    fontFamily: AppStyles.fontFamily,
    scaffoldBackgroundColor: AppColors.dark,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      surface: AppColors.dark,
      secondary: AppColors.grey,
      surfaceTint: Colors.transparent,
    ),
    textTheme: TextTheme(
      bodyMedium: AppStyles.textRegular14.copyWith(color: AppColors.white),
      labelLarge: AppStyles.textRegular14.copyWith(color: AppColors.primary),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkCard,
      hintStyle: AppStyles.textRegular16.copyWith(color: AppColors.grey),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide.none,
      ),
      prefixIconColor: AppColors.primary,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: AppColors.primary),
      ),
    ),
    appBarTheme: AppBarTheme(elevation: 0, backgroundColor: AppColors.primary),
    cardColor: const Color(0xFF1E1E1E),
  );
}
