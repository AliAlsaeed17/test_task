import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:test_task/presentation/resources/app_styles.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({
    super.key,
    required this.controller,
    this.countryCode = 'AE',
    required this.onSaved,
  });

  final TextEditingController controller;
  final String countryCode;
  final void Function(PhoneNumber?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialCountryCode: countryCode,
      showDropdownIcon: false,
      disableLengthCheck: true,
      flagsButtonPadding: const EdgeInsets.only(left: 14),
      decoration: authInputsStyle.copyWith(
        hintText: '55994435',
      ),
      validator: (value) {
        if (value!.number.isEmpty) {
          return 'Phone Number required';
        }
        return null;
      },
      onSaved: onSaved,
    );
  }
}
