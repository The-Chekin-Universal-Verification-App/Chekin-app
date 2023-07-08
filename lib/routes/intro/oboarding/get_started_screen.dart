import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

import '../../../core/providers/auth_provider.dart';
import '../../auth/user_biz_account_registration/account_creation_main_screen.dart';
import '../../auth/user_biz_account_registration/biz_account/biz_account_creation_main_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    var accountType = context.read<AuthProvider>().accountType;

    return Scaffold(
      backgroundColor: theme.primary,
      appBar: CustomAppBar(
        backgroundColor: theme.primary,
        // onTapLeadingIcon: () {},
        leadingIcon: LogoIconItem(
          iconUrl: R.png.appLogo.imgPng,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const VSpace(30),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.loc.letGetStarted,
                      style: TextStyles.h5.txtColor(Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const VSpace(48),
            IntroImage(
              height: 291,
              onboardImg: R.png.man.imgPng,
            ),
            const VSpace(30),
            Text(
              context.loc.letGetYouStarted(context.loc.ceo),
              style: TextStyles.h6.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2),
            ),
            const VSpace(25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 43.0),
              child: RichText(
                  textAlign: TextAlign.center,
                  text:
                      TextSpan(style: const TextStyle(height: 1.5), children: [
                    TextSpan(
                      text: context.loc.yourSignUpProcess,
                      style: TextStyles.body1
                          .copyWith(color: Colors.white70, fontSize: 15),
                    ),
                    TextSpan(
                      text: context.loc.three.toUpperCase(),
                      style: TextStyles.body1
                          .copyWith(color: Colors.white, fontSize: 15),
                    ),
                    TextSpan(
                      text: context.loc.yourSignUpProcessSecondPart,
                      style: TextStyles.body1
                          .copyWith(color: Colors.white70, fontSize: 15),
                    ),
                    TextSpan(
                      text: context.loc.fun.toUpperCase(),
                      style: TextStyles.body1
                          .copyWith(color: Colors.white, fontSize: 15),
                    ),
                  ])),
            ),
            const VSpace(106),
            Padding(
              padding: const EdgeInsets.only(right: 27.0, left: 27, bottom: 45),
              child: PrimaryButton(
                onPressed: () {
                  if (accountType.name == UserType.normal.name) {
                    context.push(const AccountCreationScreen());
                  } else {
                    context.push(const BusinessAccountCreationMainScreen());
                  }
                },
                label: context.loc.getStarted,
                radius: 20,
                fullWidth: true,
                color: theme.background,
                textColor: theme.primary,
                borderColor: theme.primary.withOpacity(0.48),
                contentPadding: const EdgeInsets.symmetric(vertical: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
