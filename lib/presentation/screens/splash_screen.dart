import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/bussiness/controllers/splash_controller.dart';
import 'package:test_task/presentation/resources/app_assets.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final SplashController splashController = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Center(
          child: Image.asset(
            AppAssets.appLogo,
            width: Get.width / 1.4,
          ),
        ),
      ),
    );
  }
}
