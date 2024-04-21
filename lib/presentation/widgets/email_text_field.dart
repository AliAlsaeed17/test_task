import 'package:flutter/material.dart';
import 'package:test_task/presentation/resources/app_styles.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
    required this.controller,
    required this.onSaved,
  });

  final TextEditingController controller;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.emailAddress,
      textAlign: TextAlign.center,
      decoration: authInputsStyle.copyWith(
        hintText: 'Email Address',
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Email required';
        }
        return null;
      },
      onSaved: onSaved,
    );
  }
}
