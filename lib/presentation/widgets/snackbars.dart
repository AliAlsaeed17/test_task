import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/presentation/resources/app_colors.dart';
import 'package:test_task/presentation/resources/app_styles.dart';

class SnackBars {
  static void showSuccess(message) {
    Get.rawSnackbar(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        borderRadius: 15,
        titleText: Text(
          'Success',
          style: titleTextStyle.copyWith(color: AppColors.white),
        ),
        messageText: Text(
          message,
          style: normalTextStyle.copyWith(color: AppColors.white),
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: AppColors.green);
  }

  static void showError(message) {
    Get.rawSnackbar(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        padding: const EdgeInsets.symmetric(vertical: 15),
        borderRadius: 15,
        titleText: Text(
          'Failure',
          style: titleTextStyle.copyWith(color: AppColors.white),
        ),
        messageText: Text(
          message,
          style: normalTextStyle.copyWith(color: AppColors.white),
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: AppColors.red);
  }

  static void showWarning(message) {
    Get.rawSnackbar(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        padding: const EdgeInsets.symmetric(vertical: 15),
        borderRadius: 15,
        messageText: Text(
          message,
          style: normalTextStyle,
          textAlign: TextAlign.center,
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: AppColors.lightGrey);
  }
}
