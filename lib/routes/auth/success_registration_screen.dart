import 'package:flutter/material.dart';
import 'package:chekinapp/core/providers/auth_provider.dart';
import 'package:chekinapp/export.dart';

String getAccountType(BuildContext context, UserType userType) {
  switch (userType) {
    case UserType.normal:
      return context.loc.user;

    case UserType.biz:
      return context.loc.businessOwner;
  }
}

class SuccessRegistrationScreen extends StatelessWidget {
  const SuccessRegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    final accountType =
        context.select((AuthProvider provider) => provider.accountType);
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
        child: SizedBox(
          height: context.heightPx - 65,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                        context.loc.congratulations,
                        style: TextStyles.h5.txtColor(Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const VSpace(48),
              Align(
                alignment: Alignment.centerRight,
                child: Transform.scale(
                  scaleX: 0.95,
                  scaleY: 0.95,
                  child: IntroImage(
                    height: 291,
                    onboardImg: R.png.girlsWithCart.imgPng,
                  ),
                ),
              ),
              const VSpace(30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.sp(40)),
                child: RichText(
                    textAlign: TextAlign.center,
                    textScaleFactor: MediaQuery.textScaleFactorOf(context),
                    text:
                        TextSpan(style: const TextStyle(height: 1), children: [
                      TextSpan(
                        text: context.loc.welcome,
                        style: TextStyles.body1
                            .copyWith(color: Colors.white70, fontSize: 24),
                      ),
                      TextSpan(
                        text: "${R.S.userName} !",
                        style: TextStyles.body1
                            .copyWith(color: Colors.white, fontSize: 24),
                      ),
                    ])),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.sp(40)),
                child: RichText(
                    textAlign: TextAlign.center,
                    textScaleFactor: MediaQuery.textScaleFactorOf(context),
                    text: TextSpan(
                        style: const TextStyle(height: 1.2),
                        children: [
                          TextSpan(
                            text: "${context.loc.your} ",
                            style: TextStyles.h6.copyWith(
                              color: Colors.white70,
                            ),
                          ),
                          TextSpan(
                            text: getAccountType(context, accountType),
                            style: TextStyles.h6
                                .copyWith(color: Colors.white, fontSize: 15),
                          ),
                          TextSpan(
                            text: context.loc.accountIsSet,
                            style: TextStyles.h6
                                .copyWith(color: Colors.white70, fontSize: 15),
                          ),
                        ])),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(
                  right: 27.0,
                  left: 27,
                  bottom: context.sp(50),
                ),
                child: PrimaryButton(
                  onPressed: () {
                    // SharedPrefs.setBool('isFirstTime', false);

                    // context.push(const AccountCreationScreen());
                  },
                  label: context.loc.getIn,
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
      ),
    );
  }
}
