import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/bussiness/controllers/user_controller.dart';
import 'package:test_task/core/router/get_routes.dart';
import 'package:test_task/presentation/Widgets/information_list_tile.dart';
import 'package:test_task/presentation/Widgets/settings_list_tile.dart';
import 'package:test_task/presentation/widgets/custom_app_bar.dart';
import 'package:test_task/presentation/widgets/spacer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Home Page'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              children: [
                GetBuilder<UserController>(
                  builder: (controller) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      children: [
                        InformationListTile(
                          text: userController.user != null
                              ? userController.user!.name
                              : '',
                          icon: Icons.person,
                        ),
                        InformationListTile(
                          text: userController.user != null
                              ? userController.user!.countryCode +
                                  userController.user!.phone
                              : '',
                          icon: Icons.phone_android,
                        ),
                        InformationListTile(
                          text: userController.user != null
                              ? userController.user!.email
                              : '',
                          icon: Icons.email_outlined,
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    SettingsListTile(
                      titleText: 'Update Information',
                      onTap: () => Get.toNamed(
                        AppRoutes.updateInformationScreen,
                        arguments: userController.user,
                      ),
                    ),
                    const SpacerHeight(),
                    SettingsListTile(
                      titleText: 'Change Password',
                      onTap: () {},
                    ),
                    const SpacerHeight(),
                    SettingsListTile(
                      titleText: 'Delete Account',
                      onTap: () {},
                    ),
                    const SpacerHeight(),
                    SettingsListTile(
                      titleText: 'Logout',
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
