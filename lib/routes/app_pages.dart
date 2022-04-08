// ignore_for_file: constant_identifier_names

import 'package:chekin/screen/auth/view/auth_onboarding.dart';
import 'package:chekin/screen/splash_screen.dart';
import 'package:get/get.dart';


part 'app_routes.dart';

class AppPages {
  static const SPLASHSCREEN = Routes.INITIAL;
  static final routes = [
    GetPage(
      name: SPLASHSCREEN,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.AUTH_ONBOARDING,
      page: () => const AuthOnboarding(),
    ),
    
    
  ];
}
