import 'package:flutter/material.dart';
import 'package:chekinapp/core/providers/app_provider.dart';
import 'package:chekinapp/export.dart';
import 'package:chekinapp/res/language_and_emojis.dart';
import 'package:chekinapp/routes/intro/select_usertype/set_a_user_type.dart';
import 'package:tuple/tuple.dart';
import '../../../components/msc/app_bar.dart';
import '../../../components/msc/chekiapp_logo_icon_item.dart';
import '../../../components/msc/container.dart';
import '../../../components/msc/terms_and_conditions_widget.dart';
import '../../../components/primary_btn.dart';
import '../../../utils/helpers/app_language.dart';
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