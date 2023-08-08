import 'package:chekinapp/components/input/base_text_input.dart';
import 'package:chekinapp/export.dart';
import 'package:chekinapp/routes/intro/select_usertype/set_a_user_type.dart';
import 'package:flutter/material.dart';
import 'package:chekinapp/routes/auth/forgot_password.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> with FormMixin {
  bool _hidCharacters = false;
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    SignInModel model =
        context.select((AuthProvider provider) => provider.userSignInModel);

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
        child: Form(
          key: formKey,
          onChanged: () {
            validate(() {}, shouldUnFocus: false);
          },
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
                type: InputType.email,
                onChange: (email) {
                  context.read<AuthProvider>().addToUserSignInInfo =
                      model.copyWith(email: email);
                },
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
                type: InputType.pwd,
                onChange: (password) {
                  context.read<AuthProvider>().addToUserSignInInfo =
                      model.copyWith(password: password);
                },
                prefix: UnconstrainedBox(
                  child: SvgIcon(
                    R.png.passwordProtection.svg,
                    size: 20,
                  ),
                ),
                suffix: UnconstrainedBox(
                  child: SvgIcon(
                    _hidCharacters ? R.png.eye.svg : R.png.eyeOpen.svg,
                    size: 20,
                  ).clickable(() {
                    _hidCharacters = !_hidCharacters;
                    setState(() {});
                  }),
                ),
                hintText: context.loc.password,
                obscure: _hidCharacters,
              ),
              const VSpace(10),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  context.loc.forgotPassword,
                  style: TextStyles.body2.copyWith(color: theme.primary),
                ),
              ).rippleClick(() {
                context.push(const ForgotPasswordScreen());
              }),
              const VSpace(62),
              Builder(builder: (context) {
                return PrimaryButton(
                  onPressed: () {
                    validate(() {
                      load(() => AuthCommand(context).signIn(model));
                    });
                  },
                  label: context.loc.signIn,
                  radius: 20,
                  fullWidth: true,
                  color: isFormValid ? theme.primary : theme.background,
                  textColor: isFormValid ? Colors.white : theme.primary,
                  loading: isLoading,
                  borderColor: theme.primary.withOpacity(0.48),
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                );
              }),
              const VSpace(20),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      context.loc.iamNew,
                      style: TextStyles.body2,
                    ),
                    const HSpace(1),
                    Text(
                      context.loc.signUp,
                      style: TextStyles.body2.copyWith(color: theme.primary),
                    ),
                  ],
                ),
              ).rippleClick(() {
                context.push(const SetUserTypeScreen());
              }),
              const VSpace(20),
            ],
          ),
        ),
      ),
    );
  }
}
