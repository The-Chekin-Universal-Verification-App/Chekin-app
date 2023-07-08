import 'package:chekinapp/components/input/base_text_input.dart';
import 'package:chekinapp/export.dart';
import 'package:chekinapp/routes/main/main.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Scaffold(
      appBar: CustomAppBar(
        onTapLeadingIcon: () {},
        leadingIcon: const LogoIconItem(),
        trailing: [
          UnconstrainedBox(
            child: CustomContainer(
              height: 30,
              width: 30,
              padding: const EdgeInsets.all(5),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: theme.primary,
              ),
              child: CircleAvatar(
                backgroundColor: theme.black,
                child: const Icon(
                  Icons.question_mark_rounded,
                  size: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const HSpace(20)
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context.loc.welcomeBack,
                        style: TextStyles.h4.copyWith(fontSize: 32),
                      ),
                    ],
                  ),
                  const VSpace(5),
                  Text(
                    context.loc.checkInAndOut,
                    style: TextStyles.body1,
                  ),
                ],
              ),
            ),
            const VSpace(48),
            IntroImage(
              height: 291,
              onboardImg: R.png.youngManSittingWithLaptop.imgPng,
            ),
            const VSpace(30),
            CustomFormTextFieldWithBorder(
              prefix: UnconstrainedBox(
                child: SvgIcon(
                  R.png.person.svg,
                  size: 20,
                ),
              ),
              hintText: R.S.emailExample,
            ),
            const VSpace(15),
            CustomFormTextFieldWithBorder(
              prefix: UnconstrainedBox(
                child: SvgIcon(
                  R.png.passwordProtection.svg,
                  size: 20,
                ),
              ),
              suffix: UnconstrainedBox(
                child: SvgIcon(
                  R.png.eyeOpen.svg,
                  size: 20,
                ),
              ),
              hintText: context.loc.password,
            ),
            const VSpace(10),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                context.loc.forgotPassword,
                style: TextStyles.body2.copyWith(color: theme.primary),
              ),
            ),
            const VSpace(62),
            PrimaryButton(
              onPressed: () {
                context.push(MainScreen());
              },
              label: context.loc.signIn,
              radius: 20,
              fullWidth: true,
              color: theme.background,
              textColor: theme.primary,
              borderColor: theme.primary.withOpacity(0.48),
              contentPadding: const EdgeInsets.symmetric(vertical: 15),
            ),
          ],
        ),
      ),
    );
  }
}
