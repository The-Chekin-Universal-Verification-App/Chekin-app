import 'package:chekinapp/routes/main/main.dart';
import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';
import 'package:chekinapp/routes/intro/oboarding/onboarding_small_screen_device.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();

    return Scaffold(
      backgroundColor: theme.primary,
      body: SizedBox(
        height: context.heightPx,
        width: context.widthPx,
        child: Center(
          child: SizedBox(
              height: 100,
              width: 100,
              child: Image.asset(R.png.appLogo.imgPng)),
        ).clickable(() {
          context.pushOff(const MainScreen());
        }),
      ),
    );
  }
}
