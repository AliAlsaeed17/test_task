// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:test_task/presentation/resources/app_colors.dart';
import 'package:test_task/presentation/resources/app_styles.dart';

class InformationListTile extends StatelessWidget {
  InformationListTile({
    super.key,
    required this.text,
    required this.icon,
  });

  IconData icon;
  String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 8,
      leading: Icon(
        icon,
        color: AppColors.primary,
      ),
      title: Text(
        text,
        style: normalTextStyle.copyWith(
            color: AppColors.lightGrey, fontWeight: FontWeight.bold),
      ),
    );
  }
}
