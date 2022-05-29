// ignore_for_file: constant_identifier_names

import 'package:chekin/screen/app/dashboard/binding/dashboard_binding.dart';
import 'package:chekin/screen/app/global/binding/global_binding.dart';
import 'package:chekin/screen/app/main_app.dart';
import 'package:chekin/screen/app/settings/binding/settings_binding.dart';
import 'package:chekin/screen/app/user/binding/user_binding.dart';
import 'package:chekin/screen/auth/binding/auth_binding.dart';
import 'package:chekin/screen/auth/view/auth_onboarding.dart';
import 'package:chekin/screen/auth/view/pages/business_image.dart';
import 'package:chekin/screen/auth/view/pages/business_one.dart';
import 'package:chekin/screen/auth/view/pages/business_three.dart';
import 'package:chekin/screen/auth/view/pages/business_two.dart';
import 'package:chekin/screen/auth/view/pages/id_confirm.dart';
import 'package:chekin/screen/auth/view/pages/payment_info.dart';
import 'package:chekin/screen/auth/view/pages/payment_two_info.dart';
import 'package:chekin/screen/auth/view/pages/profile_image.dart';
import 'package:chekin/screen/auth/view/pages/signup_select.dart';
import 'package:chekin/screen/auth/view/pages/verification_one.dart';
import 'package:chekin/screen/auth/view/pages/sign_in.dart';
import 'package:chekin/screen/auth/view/pages/verification_two.dart';
import 'package:chekin/screen/splash_screen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const SPLASHSCREEN = Routes.INITIAL;
  static final routes = [
    GetPage(
      name: SPLASHSCREEN,
      page: () => const SplashScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.AUTH_ONBOARDING,
      page: () => const AuthOnboarding(),
    ),
    GetPage(
      name: Routes.SIGNUP_SELECT,
      page: () => const SignupSelect(),
    ),
    GetPage(
      name: Routes.BUSINESS_ONE,
      page: () => const BusinessOne(),
    ),
    GetPage(
      name: Routes.BUSINESS_TWO,
      page: () => const BusinessTwo(),
    ),
    GetPage(
      name: Routes.BUSINESS_THREE,
      page: () => const BusinessThree(),
    ),
    GetPage(
      name: Routes.BUSINESS_IMAGE,
      page: () => const BusinessImage(),
    ),
    GetPage(
      name: Routes.PROFILE_IMAGE,
      page: () => const ProfileImage(),
    ),
    GetPage(
      name: Routes.PAYMENT_INFO,
      page: () => const PaymentInfo(),
    ),
    GetPage(
      name: Routes.PAYMENT_INFO_TWO,
      page: () => const PaymentInfoTwo(),
    ),
    GetPage(
      name: Routes.ID_CONFIRM,
      page: () => const IDConfirm(),
    ),
    GetPage(
      name: Routes.VERIFICATION_ONE,
      page: () => const VerificationOne(),
    ),
    GetPage(
      name: Routes.VERIFICATION_TWO,
      page: () => const VerificationTwo(),
    ),
    GetPage(
      name: Routes.SIGN_IN,
      page: () => const SignIn(),
    ),
    GetPage(
      name: Routes.MAIN_APP,
      page: () => const MainApp(),
      bindings: [
        DashboardBinding(),
        GlobalBinding(),
        UserBinding(),
        SettingsBinding()
      ],
    ),
  ];
}
