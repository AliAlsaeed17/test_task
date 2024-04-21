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
import 'package:test_task/presentation/widgets/name_text_field.dart';
import 'package:test_task/presentation/widgets/password_text_field.dart';
import 'package:test_task/presentation/widgets/phone_text_field.dart';
import 'package:test_task/presentation/widgets/spacer.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
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
                    'Register',
                    style: headerTextStyle,
                  ),
                ],
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    NameTextField(
                      controller: nameController,
                      onSaved: (value) {
                        authController.name = value!;
                      },
                    ),
                    SpacerHeight(height: 20.h),
                    PhoneTextField(
                      controller: phoneNumberController,
                      onSaved: (value) {
                        authController.phone = value!.number;
                        authController.countryCode = value.countryCode;
                      },
                    ),
                    SpacerHeight(height: 20.h),
                    EmailTextField(
                      controller: emailController,
                      onSaved: (value) {
                        authController.email = value!;
                      },
                    ),
                    SpacerHeight(height: 20.h),
                    PasswordTextField(controller: passwordController),
                    SpacerHeight(height: 20.h),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textAlign: TextAlign.center,
                      obscureText: true,
                      decoration: authInputsStyle.copyWith(
                        hintText: 'Confirm Password',
                        prefix: Container(width: 60),
                        suffixIcon: const Icon(Icons.visibility),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Confirm Password required';
                        } else if (value != passwordController.text) {
                          return 'Password does not match';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        authController.confirmPassword = value!;
                      },
                    ),
                    SpacerHeight(height: 30.h),
                    AcceptButton(
                      buttonText: 'Register',
                      buttonStyle: acceptButtonStyle,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          await authController.register();
                        }
                      },
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account? ',
                    style: normalTextStyle,
                  ),
                  InkWell(
                    onTap: () => Get.toNamed(AppRoutes.loginScreen),
                    child: Text(
                      'Login',
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
