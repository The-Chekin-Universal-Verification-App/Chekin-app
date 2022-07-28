import 'dart:async';
import 'dart:developer';

import 'package:chekin/constants/assets_path.dart';
import 'package:chekin/constants/steps.dart';
import 'package:chekin/routes/app_pages.dart';
import 'package:chekin/services/storage.dart';
import 'package:chekin/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  navigate2() async {
    String step = await Storage.readData("step") ?? "";
    log("step is  $step");

    switch (step) {
      case Steps.ONBOADING:
        Timer(const Duration(seconds: 4), () {
          Get.toNamed(Routes.AUTH_ONBOARDING);
        });
        break;
      case Steps.SIGNUP_SELECT:
        Timer(const Duration(seconds: 4), () {
          Get.toNamed(Routes.SIGNUP_SELECT);
        });
        break;
      case Steps.SIGN_IN:
        Timer(const Duration(seconds: 4), () {
          Get.toNamed(Routes.SIGN_IN);
        });
        break;
      case Steps.PAYMENT_INFO:
        Timer(const Duration(seconds: 4), () {
          Get.toNamed(Routes.PAYMENT_INFO);
        });
        break;

      case Steps.GET_LUX_CODE:
        Timer(const Duration(seconds: 4), () {
          Get.toNamed(Routes.PAYMENT_INFO_TWO);
        });
        break;

      case Steps.DONE:
        Timer(const Duration(seconds: 4), () {
          Get.toNamed(Routes.MAIN_APP);
        });
        break;

      default:
        Timer(const Duration(seconds: 4), () {
          Get.toNamed(Routes.AUTH_ONBOARDING);
        });
        break;
    }
  }

  @override
  void initState() {
    navigate2();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(splashlogo),
            ),
          ),
        ],
      ),
    );
  }
}
