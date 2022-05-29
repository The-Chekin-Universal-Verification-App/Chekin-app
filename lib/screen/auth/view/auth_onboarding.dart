import 'dart:async';

import 'package:chekin/constants/value.dart';
import 'package:chekin/routes/app_pages.dart';
import 'package:chekin/screen/auth/view/components/sliding_text_widget.dart';
import 'package:chekin/shared/action_button.dart';
import 'package:chekin/shared/custom_text.dart';
import 'package:chekin/utils/colors.dart';
import 'package:chekin/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthOnboarding extends StatefulWidget {
  const AuthOnboarding({Key? key}) : super(key: key);

  @override
  State<AuthOnboarding> createState() => _AuthOnboardingState();
}

class _AuthOnboardingState extends State<AuthOnboarding> {
  int currentPageValue = 0;
  int previousPageValue = 0;
  int i = 0;
  late PageController controller;
  Timer? timer;
  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  @override
  void initState() {
    super.initState();

    controller = PageController(initialPage: currentPageValue);
    timer =
        Timer.periodic(const Duration(seconds: 4), (Timer t) => animateData());
  }

  animateData() {
    if (i != 2) {
      i++;
      controller.nextPage(duration: _kDuration, curve: _kCurve);
    } else {
      i = 0;
      controller.animateToPage(i, duration: _kDuration, curve: _kCurve);
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Widget> introWidgetsList = const [
      SlidingText(
        title:
            'Hnsdn sndno asdcn kasdcaodc kandsfl \njknacn jasdcn;madcnna jkandc jadnc \njadnckka jadncladc ',
        index: 0,
      ),
      SlidingText(
        title:
            'Hnsdn sndno asdcn kasdcaodc kandsfl \njknacn jasdcn;madcnna jkandc jadnc \njadnckka jadncladc ',
        index: 1,
      ),
      SlidingText(
        title:
            'Hnsdn sndno asdcn kasdcaodc kandsfl \njknacn jasdcn;madcnna jkandc jadnc \njadnckka jadncladc ',
        index: 2,
      ),
    ];
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: LayoutBuilder(builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CText(
                  text: 'Welcome \nto CHEKIN.',
                  color: kPrimaryColor,
                  size: 40,
                  fontFamily: 'Lufga-SemiBold',
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                ),
                SizedBox(height: heightSize(5)),
                SizedBox(
                  height: heightSize(70),
                  child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: introWidgetsList.length,
                    // onPageChanged: (int page) {
                    //   getChangedPageAndMoveBar(page);
                    // },
                    controller: controller,
                    itemBuilder: (context, index) {
                      return introWidgetsList[index];
                    },
                  ),
                ),
                SizedBox(height: heightSize(23)),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.SIGNUP_SELECT);
                        },
                        child: Container(
                          height: heightSize(40),
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius:
                                BorderRadius.circular(Values().buttonRadius),
                          ),
                          child: const Center(
                            child: CText(
                              text: "Sign Up",
                              color: kWhiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: widthSize(19)),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.SIGN_IN);
                        },
                        child: Container(
                          height: heightSize(40),
                          decoration: BoxDecoration(
                            border: Border.all(color: kBlackColor),
                            borderRadius:
                                BorderRadius.circular(Values().buttonRadius),
                          ),
                          child: const Center(
                            child: CText(
                              text: "Sign In",
                              color: kBlackColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
