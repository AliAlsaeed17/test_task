// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:test_task/presentation/resources/app_colors.dart';
import 'package:test_task/presentation/resources/app_styles.dart';
import 'package:test_task/presentation/widgets/spacer.dart';

class SuccessAlert extends StatelessWidget {
  SuccessAlert({super.key, required this.message});

  String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.green,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            'Success',
            style: titleTextStyle.copyWith(
              color: AppColors.white,
            ),
          ),
          const SpacerHeight(),
          Text(
            message,
            style: normalTextStyle,
          )
        ],
      ),
    );
  }
}
