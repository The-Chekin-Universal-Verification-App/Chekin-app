import 'package:chekinapp/export.dart';
import 'package:chekinapp/routes/auth/auth.dart';
import 'package:flutter/material.dart';

import '../../routes/intro/oboarding/onboarding_main_screen.dart';

class BootStrapCmd extends BaseCommand {
  BootStrapCmd(super.c);

  AuthProvider get store => getProvider<AuthProvider>();

  void _setUser() async {
    Map<String, dynamic> userDetails = await SharedPrefs.getMap('user');
    String token = await SharedPrefs.getString('token');
    store.setUser = userDetails;

    store.setUserToken = token;
  }

  bootStrap() {
    BuildContext context = rootNav!.context;

    Future.delayed(2.seconds, () async {
      bool? isFirstTimeUser = await SharedPrefs.getBool('isFirstTime');
      log('is a first time user? $isFirstTimeUser in BootstrapCmd class. ln19...>>');
      Map<String, dynamic> user = await SharedPrefs.getMap('user');

      if (isFirstTimeUser != null && isFirstTimeUser == false) {
        ///means user is not using the app for the first time, then route to welcome screen

        // log("$token in BootstrapCmd class. ln25...>>");
        _setUser();
        if (user != {}) {
          Navigator.pushReplacement(
              context, RouteHelper.slide(() => const LogInScreen()));
        } else {
          Navigator.pushReplacement(
              context, RouteHelper.slide(() => const LogInScreen()));
        }
      } else {
        ///todo:route to onboard screen
        SharedPrefs.setBool('isFirstTime', true);

        Navigator.pushReplacement(
            context, RouteHelper.slide(() => const OnBoardingScreen()));
      }
    });
  }
}
