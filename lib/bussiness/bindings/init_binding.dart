import 'package:get/get.dart';
import 'package:test_task/bussiness/controllers/auth_controller.dart';
import 'package:test_task/bussiness/controllers/splash_controller.dart';
import 'package:test_task/bussiness/controllers/user_controller.dart';
import 'package:test_task/data/data_sources/local/user_local_data_source.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserLocalDataSource(), permanent: true);
    Get.put(UserController(), permanent: true);
    Get.put(SplashController());
    Get.lazyPut(() => AuthController());
  }
}
