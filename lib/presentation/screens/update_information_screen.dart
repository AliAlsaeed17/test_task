import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_task/bussiness/controllers/user_controller.dart';
import 'package:test_task/core/constants/countries.dart';
import 'package:test_task/data/models/user_model.dart';
import 'package:test_task/presentation/Widgets/accept_button.dart';
import 'package:test_task/presentation/Widgets/custom_app_bar.dart';
import 'package:test_task/presentation/resources/app_styles.dart';
import 'package:test_task/presentation/widgets/email_text_field.dart';
import 'package:test_task/presentation/widgets/name_text_field.dart';
import 'package:test_task/presentation/widgets/phone_text_field.dart';
import '../widgets/spacer.dart';

class UpdateInformationScreen extends StatefulWidget {
  const UpdateInformationScreen({super.key});

  @override
  State<UpdateInformationScreen> createState() =>
      _UpdateInformationScreenState();
}

class _UpdateInformationScreenState extends State<UpdateInformationScreen> {
  final userController = Get.find<UserController>();
  final User user = Get.arguments;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String countryCode = '';
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    nameController.text = user.name;
    phoneNumberController.text = user.phone;
    emailController.text = user.email;
    countryCode = Countries.allCountries.firstWhere(
        (country) => country['dial_code'] == user.countryCode)['code']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Update Information'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 40.h),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                NameTextField(
                  controller: nameController,
                  onSaved: (value) {
                    userController.name = value!;
                  },
                ),
                SpacerHeight(height: 20.h),
                PhoneTextField(
                  controller: phoneNumberController,
                  countryCode: countryCode,
                  onSaved: (value) {
                    userController.phone = value!.number;
                    userController.countryCode = value.countryCode;
                  },
                ),
                SpacerHeight(height: 20.h),
                EmailTextField(
                  controller: emailController,
                  onSaved: (value) {
                    userController.email = value!;
                  },
                ),
                SpacerHeight(height: 20.h),
                AcceptButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      await userController.updateUserInfo();
                    }
                  },
                  buttonText: 'Save',
                  buttonStyle: acceptButtonStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
