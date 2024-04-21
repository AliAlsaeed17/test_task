import 'package:flutter/material.dart';
import 'package:test_task/presentation/resources/app_styles.dart';

class NameTextField extends StatelessWidget {
  const NameTextField({
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
      keyboardType: TextInputType.name,
      textAlign: TextAlign.center,
      decoration: authInputsStyle.copyWith(
        hintText: 'Full Name',
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Full Name required';
        }
        return null;
      },
      onSaved: onSaved,
    );
  }
}
