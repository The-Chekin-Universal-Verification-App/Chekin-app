import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';
import 'package:tuple/tuple.dart';

import '../../../core/providers/app_provider.dart';
import '../../../res/language_and_emojis.dart';
import '../../../utils/helpers/app_language.dart';
import '../../auth/login_screen.dart';
import 'onboarding_small_screen_device.dart';
import '../select_usertype/set_a_user_type.dart';

class OnBoardingLargeScreen extends StatelessWidget {
  const OnBoardingLargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    List onboards = R.M.getOnboards(context);
    return Selector<AppProvider, Tuple2<int, Language>>(
      selector: (_, provider) =>
          Tuple2(provider.onBoardPageIndex, provider.language),
      builder: (_, data, __) => Scaffold(
        appBar: CustomAppBar(
          onTapLeadingIcon: () {},
          leadingIcon: const LogoIconItem(),
          trailing: const [SelectLanguageWidget()],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: Column(children: [
                    Expanded(
                      child: PageView(
                        pageSnapping: true,
                        physics: const BouncingScrollPhysics(),
                        onPageChanged: (val) {
                          context.read<AppProvider>().setOnBoardPageIndex = val;
                        },
                        children: [
                          BoardingPages(
                            onboards: onboards,
                            index: 0,
                          ),
                          BoardingPages(
                            onboards: onboards,
                            index: 1,
                          ),
                          BoardingPages(
                            onboards: onboards,
                            index: 2,
                          ),
                        ],
                      ),
                    ),
                    const VSpace(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        onboards.length,
                        (index) => CustomContainer(
                          height: 5,
                          duration: const Duration(milliseconds: 640),
                          width: data.item1 == index ? 80 : 20,
                          color: data.item1 == index
                              ? theme.primary
                              : Colors.blueGrey[100],
                          borderRadius: BorderRadius.circular(10),
                          margin: const EdgeInsets.only(right: 5),
                        ),
                      ),
                    ),
                    const VSpace(25),
                  ]),
                ),
                const HSpace(10),
                Flexible(
                  child: Column(
                    children: [
                      const VSpace(20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28.0),
                        child: Wrap(
                          runSpacing: 15,
                          children: [
                            PrimaryButton(
                              onPressed: () {
                                SharedPrefs.setBool('isFirstTime', false);
                                context.push(const LogInScreen());
                              },
                              label: context.loc.login,
                              radius: 20,
                              fullWidth: true,
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 18),
                            ),
                            const VSpace(10),
                            PrimaryButton(
                              onPressed: () {
                                SharedPrefs.setBool('isFirstTime', false);

                                context.push(const SetUserTypeScreen());
                              },
                              label: context.loc.singMeUp,
                              radius: 20,
                              fullWidth: true,
                              color: Colors.transparent,
                              textColor: theme.black,
                              borderColor: theme.primary.withOpacity(0.48),
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 18),
                            ),
                            const VSpace(55),
                            const TermsAndConditionWidget()
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
