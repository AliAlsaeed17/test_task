import 'package:get/get.dart';
import 'package:test_task/bussiness/Bindings/auth_binging.dart';
import 'package:test_task/bussiness/Bindings/home_binding.dart';
import 'package:test_task/bussiness/bindings/init_binding.dart';
import 'package:test_task/core/router/get_routes.dart';
import 'package:test_task/presentation/screens/login_screen.dart';
import 'package:test_task/presentation/screens/register_screen.dart';
import 'package:test_task/presentation/screens/home_screen.dart';
import 'package:test_task/presentation/screens/splash_screen.dart';
import 'package:test_task/presentation/screens/update_information_screen.dart';
import 'package:test_task/presentation/screens/welcome_screen.dart';

List<GetPage<dynamic>> getPages = [
  GetPage(
    name: AppRoutes.splashScreen,
    page: () => SplashScreen(),
    binding: InitBinding(),
  ),
  GetPage(
    name: AppRoutes.welcomeScreen,
    page: () => const WelcomeScreen(),
  ),
  GetPage(
      name: AppRoutes.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding()),
  GetPage(
      name: AppRoutes.registerScreen,
      page: () => RegisterScreen(),
      binding: AuthBinding()),
  GetPage(
      name: AppRoutes.homeScreen,
      page: () => HomeScreen(),
      binding: HomeBindings()),
  GetPage(
      name: AppRoutes.updateInformationScreen,
      page: () => const UpdateInformationScreen())
];
