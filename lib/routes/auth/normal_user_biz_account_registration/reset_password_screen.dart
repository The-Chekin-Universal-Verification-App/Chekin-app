import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

import '../../../components/input/base_text_input.dart';
import '../../../core/models/reset_password_model.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
  final String email;
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen>
    with FormMixin {
  @override
  void initState() {
    super.initState();
  }

  final TextEditingController _password = TextEditingController();
  ResetPasswordModel model = ResetPasswordModel();
  int stackedIndex = 0;
  bool showCharacter = false;
  bool resending = false;
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();

    return Scaffold(
      appBar: const CustomAppBar(
        leadingIcon: LogoIconItem(),
      ),
      body: Form(
        key: formKey,
        onChanged: () {
          validate(() {}, shouldUnFocus: false);
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: Insets.l),
          child: SizedBox(
            height: context.heightPx - 120,
            child: Consumer<AuthProvider>(
              builder: (BuildContext context, store, child) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const VSpace(53),
                    Text(
                      context.loc.resetPassword,
                      style: TextStyles.h5,
                    ),
                    const VSpace(5),
                    Text(
                      stackedIndex == 0
                          ? context.loc.pleaseEnterOTP
                          : context.loc.pleaseEnterPassword,
                      style: TextStyles.body1,
                    ),
                    const VSpace(10.0),
                    RichText(
                      textAlign: TextAlign.center,
                      textScaleFactor: MediaQuery.textScaleFactorOf(context),
                      text: TextSpan(
                        style: TextStyles.body1.copyWith(height: 1.7),
                        children: [
                          TextSpan(
                            text: context.loc.followEmailLink,
                          ),
                          TextSpan(
                            text: store.user.email,
                            style: TextStyles.body1.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const VSpace(22.0),
                    IndexedStack(
                      index: stackedIndex,
                      children: [
                        SizedBox(
                          width: context.widthPx * 0.8,
                          child: Pinput(
                            onChanged: (pins) {
                              model = model.copyWith(
                                  code: pins, email: widget.email);
                              // print(model.toJson());
                            },
                            onSubmitted: (pins) {},
                            validator: (val) {
                              if (val != null && val.length == 6) {
                                return null;
                              } else {
                                return 'Properly enter a 6 digit pin.';
                              }
                            },
                            length: 6,
                            obscureText: true,
                            defaultPinTheme: PinTheme(
                              width: 50,
                              height: 50,
                              textStyle: TextStyle(
                                fontSize: 20,
                                color: theme.pinTextColor,
                                fontWeight: FontWeight.w600,
                              ),
                              decoration: BoxDecoration(
                                color: theme.bg2,
                                border: Border.all(
                                    color: theme.primary.withOpacity(0.4)),
                                borderRadius: Corners.s10Border,
                              ),
                            ),
                            focusedPinTheme: PinTheme(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                border: Border.all(color: theme.cyan),
                                borderRadius: Corners.s12Border,
                              ),
                            ),
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                        ),
                        if (stackedIndex == 1) ...[
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    context.loc.newPassword,
                                    style: TextStyles.body1
                                        .copyWith(fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    '*',
                                    style: TextStyles.h5.copyWith(
                                        height: 1.5,
                                        color: theme.redButton,
                                        fontWeight: FontWeight.w900),
                                  )
                                ],
                              ),
                              CustomFormTextField(
                                controller: _password,
                                type: InputType.pwd,
                                validator: Validator.password(),
                                onChange: (password) {
                                  model = model.copyWith(password: password);
                                },
                                suffix: UnconstrainedBox(
                                  child: SvgIcon(
                                    showCharacter
                                        ? R.png.eyeOpen.svg
                                        : R.png.eye.svg,
                                    size: 20,
                                  ).rippleClick(() {
                                    showCharacter = !showCharacter;
                                    setState(() {});
                                  }),
                                ),
                                hintText: context.loc.enterYourPassword,
                                obscure: !showCharacter,
                              ),
                            ],
                          )
                        ]
                      ],
                    ),
                    const VSpace(45),
                    const Spacer(),
                    PrimaryButton(
                      onPressed: () async {
                        validate(() {
                          if (stackedIndex == 1) {
                            //validate and submit form only if new password form is showing
                            load(() =>
                                AuthCommand(context).resetPassword(model));
                          } else {
                            //validate only and move to the new password form when otp pin is showing
                            stackedIndex = 1;
                            setState(() {});
                          }
                        });
                      },
                      label: stackedIndex == 0
                          ? context.loc.conti
                          : context.loc.submit,
                      color: isFormValid ? theme.primary : theme.background,
                      textColor: isFormValid ? Colors.white : theme.black,
                      fullWidth: true,
                      radius: Corners.s20,
                      borderColor: theme.primary,
                      loading: isLoading,
                    ),
                    const VSpace(20),
                    if (stackedIndex == 1) ...[
                      PrimaryButton(
                        onPressed: () async {
                          stackedIndex = 0;
                          setState(() {});
                        },
                        label: context.loc.goBack,
                        color: theme.background,
                        textColor: theme.black,
                        fullWidth: true,
                        radius: Corners.s20,
                        borderColor: theme.primary,
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 15),
                      ),
                      const VSpace(20),
                    ],
                    resending
                        ? Wrap(
                            children: [
                              Text(
                                "Wait ",
                                style: TextStyles.h7,
                              ),
                              Text(
                                'Resending...',
                                style: TextStyles.h7
                                    .copyWith(color: theme.primary),
                              ),
                            ],
                          ).center()
                        : Align(
                            alignment: Alignment.center,
                            child: Wrap(
                              children: [
                                Text(
                                  context.loc.notGetMail,
                                  style: TextStyles.h7,
                                ),
                                const HSpace(5),
                                Text(
                                  context.loc.reSend,
                                  style: TextStyles.h7
                                      .copyWith(color: theme.primary),
                                ),
                              ],
                            ).rippleClick(
                              () async {
                                resending = true;
                                setState(() {});
                                await AuthCommand(context).resendForgotPassword(
                                    EmailVerificationModel(
                                        email: widget.email));
                                resending = false;
                                setState(() {});
                              },
                            ),
                          ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
