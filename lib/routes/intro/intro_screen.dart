import 'package:chekinapp/core/commands/bootstrap_cmd.dart';
import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

import 'oboarding/onboarding_main_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 2), () {
        BootStrapCmd(context).bootStrap();
      });
    });
  }

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
          context.pushOff(const OnBoardingScreen());
        }),
      ),
    );
  }
}
