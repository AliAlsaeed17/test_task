import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:test_task/bussiness/controllers/user_controller.dart';
import 'package:test_task/core/classes/failures.dart';
import 'package:test_task/core/router/get_routes.dart';
import 'package:test_task/data/models/user_model.dart';
import 'package:test_task/data/repositories/auth_repository.dart';
import 'package:test_task/presentation/widgets/snackbars.dart';

class AuthController extends GetxController {
  String name = '';
  String countryCode = '';
  String phone = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  final AuthRepository _repository = AuthRepository();
  final UserController _userController = Get.find<UserController>();
  final isLoading = false.obs;

  Future<void> login() async {
    isLoading.value = true;
    final Either<Failure, (String, User)> result =
        await _repository.login(email: email, password: password);
    isLoading.value = false;
    result.fold(
      (failure) {
        SnackBars.showError(failure.message);
      },
      (userData) {
        _userController.user = userData.$2;
        SnackBars.showSuccess(userData.$1);
        Get.offAndToNamed(AppRoutes.homeScreen);
      },
    );
  }

  Future<void> logout() async {
    //Logout Api Call
    Get.offAllNamed(AppRoutes.welcomeScreen);
  }

  Future<void> register() async {
    isLoading.value = true;
    final Either<Failure, (String, User)> result = await _repository.register(
        name: name,
        countryCode: countryCode,
        phone: phone,
        email: email,
        password: password,
        confirmPassword: confirmPassword);
    isLoading.value = false;
    result.fold(
      (failure) {
        SnackBars.showError(failure.message);
      },
      (userData) {
        _userController.user = userData.$2;
        SnackBars.showSuccess(userData.$1);
        Get.offAndToNamed(AppRoutes.homeScreen);
      },
    );
  }
}
