// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_task/presentation/resources/app_colors.dart';

final AppBarTheme appBarTheme = AppBarTheme(
  elevation: 0.0,
  centerTitle: true,
  backgroundColor: AppColors.primary,
  titleTextStyle: TextStyle(
    color: AppColors.white,
    fontFamily: 'AlexandriaFLF',
    fontSize: 22.sp,
    fontWeight: FontWeight.bold,
  ),
);
