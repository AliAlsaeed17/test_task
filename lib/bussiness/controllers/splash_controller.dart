import 'package:get/get.dart';
import 'package:test_task/bussiness/controllers/user_controller.dart';
import 'package:test_task/core/router/get_routes.dart';
import 'package:test_task/data/data_sources/local/user_local_data_source.dart';

class SplashController extends GetxController {
  final UserLocalDataSource _localDataSource = Get.find<UserLocalDataSource>();
  final UserController _userController = Get.find<UserController>();

  Future<void> checkAuth() async {
    String? token = await _localDataSource.getUserToken();
    if (token != null) {
      int? id = await _localDataSource.getUserId();
      bool userState = await _userController.getUser(id, token);
      if (userState) {
        Future.delayed(const Duration(seconds: 3))
            .then((value) => Get.offAndToNamed(AppRoutes.homeScreen));
      } else {
        //exit(0);
      }
    } else {
      Future.delayed(const Duration(seconds: 3))
          .then((value) => Get.offAndToNamed(AppRoutes.welcomeScreen));
    }
  }

  @override
  void onInit() async {
    await checkAuth();
    super.onInit();
  }
}
