import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_task/bussiness/controllers/auth_controller.dart';
import 'package:test_task/core/router/get_routes.dart';
import 'package:test_task/presentation/Widgets/accept_button.dart';
import 'package:test_task/presentation/resources/app_assets.dart';
import 'package:test_task/presentation/resources/app_colors.dart';
import 'package:test_task/presentation/resources/app_styles.dart';
import 'package:test_task/presentation/widgets/email_text_field.dart';
import 'package:test_task/presentation/widgets/password_text_field.dart';
import 'package:test_task/presentation/widgets/spacer.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                  SpacerHeight(height: 20.h),
                  const Text(
                    'Login',
                    style: headerTextStyle,
                  ),
                ],
              ),
              SpacerHeight(height: 20.h),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    EmailTextField(
                      controller: emailController,
                      onSaved: (value) {
                        authController.email = value!;
                      },
                    ),
                    SpacerHeight(height: 20.h),
                    PasswordTextField(controller: passwordController),
                    SpacerHeight(height: 30.h),
                    AcceptButton(
                      buttonText: 'Login',
                      buttonStyle: acceptButtonStyle,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          await authController.login();
                        }
                      },
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account? ',
                    style: normalTextStyle,
                  ),
                  InkWell(
                    onTap: () => Get.toNamed(AppRoutes.registerScreen),
                    child: Text(
                      'Register',
                      style: normalTextStyle.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
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
