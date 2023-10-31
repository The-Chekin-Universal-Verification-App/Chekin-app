import 'package:flutter/material.dart';

import 'onboarding_large_screen_device.dart';
import 'onboarding_screen_view_switcher.dart';
import 'onboarding_small_screen_device.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OnBoardingScreenViewSwitcher(
      smallScreenView: OnBoardingSmallScreen(),
      largeScreenView: OnBoardingLargeScreen(),
    );
  }
}
