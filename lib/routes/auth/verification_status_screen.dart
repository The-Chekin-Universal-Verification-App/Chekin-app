import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';
import 'package:flutter/services.dart';

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
                  fontSize: 15,
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
                    letterSpacing: 2,
                    fontSize: 15),
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
    List<String> verificationCode = [
      '1',
      '2',
      '3',
      '4',
      '5',
      '4',
      '5',
      '4',
      '5',
      '4',
      '5',
    ];
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 60,
                child: FittedBox(
                  child: Row(
                    children: List.generate(
                        verificationCode.length,
                        (index) => Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: CustomContainer(
                                borderRadius: Corners.s5Border,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4.0, horizontal: 8),
                                  child: Center(
                                      child: Text(
                                    verificationCode[index],
                                    style: TextStyles.h4,
                                  )),
                                ),
                              ),
                            )),
                  ),
                ),
              ),
            ),
            const VSpace(106),
            Padding(
              padding: const EdgeInsets.only(right: 27.0, left: 27, bottom: 45),
              child: PrimaryButton(
                onPressed: () async {
                  debugPrint(verificationCode.join(""));
                  await Clipboard.setData(
                          ClipboardData(text: verificationCode.join("")))
                      .then((value) {
                    DialogServices.emptyModalWithNoTitle(context,
                        showIcon: false,
                        bgColor: theme.primary,
                        fromTop: false,
                        body: SizedBox(
                          height: 20,
                          child: Row(
                            children: [
                              Icon(
                                Icons.check_circle_outline_rounded,
                                color: theme.background,
                                size: 20,
                              ),
                              const HSpace(10),
                              Flexible(
                                child: Text(
                                  'Code  ${verificationCode.join("")}  copied ',
                                  style: TextStyles.body3.copyWith(
                                      color: theme.background,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ),
                        ));
                  });
                },
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
