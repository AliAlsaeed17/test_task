import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/bussiness/controllers/auth_controller.dart';
import 'package:test_task/presentation/resources/app_styles.dart';

class PasswordTextField extends StatelessWidget {
  PasswordTextField({super.key, required this.controller});

  final TextEditingController controller;
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.visiblePassword,
      textAlign: TextAlign.center,
      obscureText: true,
      decoration: authInputsStyle.copyWith(
        hintText: 'Password',
        suffixIcon: const Icon(Icons.visibility),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Password required';
        }
        return null;
      },
      onSaved: (value) {
        authController.password = value!;
      },
    );
  }
}
