import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';
import 'package:chekinapp/routes/intro/oboarding/onboarding_screen_view_switcher.dart';
import 'package:chekinapp/routes/intro/select_usertype/usertype_large_screen_device.dart';
import 'package:chekinapp/routes/intro/select_usertype/usertype_small_screen_device.dart';

class SetUserTypeScreen extends StatelessWidget {
  const SetUserTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OnBoardingScreenViewSwitcher(
      smallScreenView: SetUserTypeSmallScreen(),
      largeScreenView: SetUserTypeLargeScreen(),
    );
  }
}

class UserTypeBoardingPages extends StatelessWidget {
  const UserTypeBoardingPages(
      {Key? key, required this.onboards, required this.index})
      : super(key: key);

  final List onboards;
  final int index;
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Container(
      clipBehavior: Clip.none,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: onboards[index]['page'],
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: Insets.l, right: Insets.l, top: Insets.l),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(minHeight: 20),
                      child: Text(
                        onboards[index]['title'],
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.h4,
                      ),
                    ),
                  ],
                ),
                const VSpace(9),
                SizedBox(
                    // height: 60,
                    child: RichText(
                        textAlign: TextAlign.center,
                        textScaleFactor: MediaQuery.textScaleFactorOf(context),
                        text: TextSpan(
                            style: const TextStyle(height: 1.5),
                            children: [
                              TextSpan(
                                text: index == 0
                                    ? context.loc.meet
                                    : context.loc.a.toUpperCase(),
                                style: TextStyles.body1.copyWith(
                                    color: theme.txt,
                                    height: 1.2,
                                    fontWeight: FontWeight.w400),
                              ),
                              TextSpan(
                                text: index == 0
                                    ? ' "${context.loc.you.toUpperCase()}" '
                                    : ' "${context.loc.ceo.toUpperCase()}" ',
                                style: TextStyles.h6.copyWith(
                                  height: 1.2,
                                  fontWeight: FontWeight.w700,
                                  color: theme.txt,
                                ),
                              ),
                              TextSpan(
                                text: onboards[index]['subtitle'],
                                style: TextStyles.body1.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: theme.txt),
                              ),
                            ]))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
