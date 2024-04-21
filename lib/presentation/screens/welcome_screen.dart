import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_task/core/router/get_routes.dart';
import 'package:test_task/presentation/Widgets/accept_button.dart';
import 'package:test_task/presentation/resources/app_assets.dart';
import 'package:test_task/presentation/resources/app_colors.dart';
import 'package:test_task/presentation/resources/app_styles.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 40.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 150.w,
                    height: 150.h,
                    child: Image.asset(AppAssets.appLogo),
                  ),
                  SizedBox(height: 20.h),
                  const Text(
                    'Welcome to the app',
                    style: headerTextStyle,
                  ),
                ],
              ),
              Column(
                children: [
                  AcceptButton(
                    onPressed: () => Get.toNamed(AppRoutes.loginScreen),
                    buttonText: 'Login',
                    buttonStyle: acceptButtonStyle,
                  ),
                  SizedBox(height: 15.h),
                  AcceptButton(
                    onPressed: () => Get.toNamed(AppRoutes.registerScreen),
                    buttonText: 'Register',
                    textColor: AppColors.primary,
                    buttonStyle: acceptButtonWithBorderStyle,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                    flex: 2,
                    child: Text(
                      'Designed & Developes by ',
                      style: normalTextStyle,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        'Ali Fouad',
                        style: normalTextStyle.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
