import 'package:flutter/material.dart';
import 'package:task9_quiz_app/core/theme/app_colors.dart';

abstract final class AppTheme {
  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.blackColor,
      titleTextStyle: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      elevation: 0,
    ),
  );
}
