import 'package:get/get.dart';
import 'package:test_task/bussiness/controllers/auth_controller.dart';
import 'package:test_task/bussiness/controllers/user_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.find<UserController>();
    Get.find<AuthController>();
  }
}
