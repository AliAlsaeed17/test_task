import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_task/presentation/resources/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      centerTitle: true,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(
          Icons.arrow_back_ios,
          color: AppColors.white,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).appBarTheme.titleTextStyle!,
      ),
    );
  }

  @override
  Size get preferredSize => Size(ScreenUtil.defaultSize.width, 60.h);
}
