// Elevated Button Styles
import 'package:flutter/material.dart';
import 'package:test_task/presentation/resources/app_colors.dart';

final acceptButtonStyle = ButtonStyle(
  elevation: const MaterialStatePropertyAll(0),
  backgroundColor: const MaterialStatePropertyAll<Color>(AppColors.primary),
  shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(13),
    ),
  ),
  // minimumSize: const MaterialStatePropertyAll<Size>(
  //   Size(double.infinity, 56),
  // ),
);

final acceptButtonWithBorderStyle = acceptButtonStyle.copyWith(
  elevation: const MaterialStatePropertyAll(0),
  backgroundColor: const MaterialStatePropertyAll<Color>(AppColors.white),
  shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(13),
      side: const BorderSide(width: 1, color: AppColors.primary),
    ),
  ),
  // minimumSize: const MaterialStatePropertyAll<Size>(
  //   Size(double.infinity, 56),
  // ),
);

const headerTextStyle = TextStyle(
  color: AppColors.primary,
  fontFamily: 'AlexandriaFLF',
  fontSize: 30,
  fontWeight: FontWeight.bold,
);
const titleTextStyle = TextStyle(
  color: AppColors.primary,
  fontFamily: 'AlexandriaFLF',
  fontSize: 18,
  fontWeight: FontWeight.bold,
);
const buttonTextStyle = TextStyle(
  fontFamily: 'AlexandriaFLF',
  fontSize: 22,
  fontWeight: FontWeight.bold,
);

const normalTextStyle = TextStyle(
  fontFamily: 'AlexandriaFLF',
  fontSize: 15,
);

// Input Styles
final authInputsStyle = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
  border: OutlineInputBorder(
    borderSide: const BorderSide(
      width: 1,
      color: AppColors.grey,
    ),
    borderRadius: BorderRadius.circular(13),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      width: 1,
      color: AppColors.red,
    ),
    borderRadius: BorderRadius.circular(13),
  ),
  hintStyle: normalTextStyle.copyWith(
    color: AppColors.lightGrey,
    fontWeight: FontWeight.bold,
  ),
  labelStyle: normalTextStyle.copyWith(
    color: AppColors.primary,
    fontWeight: FontWeight.bold,
  ),
);
