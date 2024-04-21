// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_task/presentation/resources/app_colors.dart';
import 'package:test_task/presentation/resources/app_styles.dart';

class AcceptButton extends StatelessWidget {
  AcceptButton({
    super.key,
    required this.buttonText,
    required this.buttonStyle,
    this.textColor = AppColors.white,
    required this.onPressed,
  });

  String buttonText;
  ButtonStyle buttonStyle;
  Color textColor;
  Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: buttonStyle,
      child: SizedBox(
        width: Get.width,
        height: 50.h,
        child: Center(
          child: Text(
            buttonText,
            style: buttonTextStyle.copyWith(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
