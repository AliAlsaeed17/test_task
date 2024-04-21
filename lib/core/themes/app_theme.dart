// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:test_task/core/themes/app_bar_theme.dart';
import 'package:test_task/presentation/resources/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.white,
    //colorScheme: colorScheme,
    appBarTheme: appBarTheme,
    //textTheme: textTheme,
    //inputDecorationTheme: inputDecorationTheme,
    //elevatedButtonTheme: elevatedButtonTheme,
  );

  static ThemeData darkTheme = ThemeData.dark();
}
