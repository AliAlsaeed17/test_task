import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_task/core/helpers/hive_helper.dart';
import 'package:test_task/core/router/get_pages.dart';
import 'package:test_task/core/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveHelper.initHive();
  runApp(const TestTaskApp());
}

class TestTaskApp extends StatelessWidget {
  const TestTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        title: 'Mobile Test Task',
        getPages: getPages,
      ),
    );
  }
}
