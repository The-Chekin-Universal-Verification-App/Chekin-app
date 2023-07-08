import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';


class VerificationStatusScreen extends StatelessWidget {
  const VerificationStatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Scaffold(
      backgroundColor: theme.primary,
      appBar: CustomAppBar(
        backgroundColor: theme.primary,
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
                      context.loc.verificationPending,
                      style: TextStyles.h5.txtColor(Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const VSpace(48),
            IntroImage(
              height: 291,
              onboardImg: R.png.clock.imgPng,
            ),
            const VSpace(30),
            Text(
              context.loc.oneMoreStep,
              style: TextStyles.h6.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2),
            ),
            const VSpace(25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 43.0),
              child: Text(
                context.loc.weWillSendAgent,
                style: TextStyles.body1
                    .copyWith(color: Colors.white70, fontSize: 15),
              ),
            ),
            const VSpace(5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 43.0),
              child: Text(
                context.loc.thisMayTakeFiveWorkingDays,
                style: TextStyles.h6.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VerificationSuccessScreen extends StatelessWidget {
  const VerificationSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();

    return Scaffold(
      backgroundColor: theme.primary,
      appBar: CustomAppBar(
        backgroundColor: theme.primary,
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
                      context.loc.verificationSuccessful,
                      style: TextStyles.h5.txtColor(Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const VSpace(48),
            IntroImage(
              height: 291,
              onboardImg: R.png.speechBubbleMark.imgPng,
            ),
            const VSpace(30),
            Text(
              context.loc.congratulations,
              style: TextStyles.h6.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2),
            ),
            const VSpace(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 43.0),
              child: Text(
                context.loc.congratNote,
                style: TextStyles.body1
                    .copyWith(color: Colors.white70, fontSize: 15),
              ),
            ),
            const VSpace(20),
            SizedBox(
              height: 60,
              child: FittedBox(
                child: Row(
                  children: [
                    CustomContainer(
                      borderRadius: Corners.s5Border,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Center(
                            child: Text(
                          '1',
                          style: TextStyles.h4,
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const VSpace(106),
            Padding(
              padding: const EdgeInsets.only(right: 27.0, left: 27, bottom: 45),
              child: PrimaryButton(
                onPressed: () {},
                label: context.loc.copyAnContinue,
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
