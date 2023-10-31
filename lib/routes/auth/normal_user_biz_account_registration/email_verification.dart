import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key, required this.email})
      : super(key: key);

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
  final String email;
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen>
    with FormMixin {
  bool loading = false;
  bool resending = false;
  @override
  void initState() {
    super.initState();
  }

  EmailVerificationModel model = EmailVerificationModel();

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
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: Insets.l),
          child: SizedBox(
            height: context.heightPx - 120,
            child: Consumer<AuthProvider>(
              builder: (BuildContext context, store, child) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const VSpace(150),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        context.loc.verifyMail.capitalize(),
                        style: TextStyles.h5.txtColor(Colors.white),
                      ),
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
                    SizedBox(
                      width: context.widthPx * 0.8,
                      child: Pinput(
                        onChanged: (pins) {
                          model =
                              model.copyWith(code: pins, email: widget.email);
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
                    const Spacer(),
                    PrimaryButton(
                      onPressed: () async {
                        validate(() {
                          load(() => AuthCommand(context).verifyEmail(model));
                        });
                      },
                      label: context.loc.verify,
                      color: theme.background,
                      textColor: theme.primary,
                      fullWidth: true,
                      radius: Corners.s20,
                      loading: isLoading,
                    ),
                    const VSpace(40),
                    resending
                        ? Wrap(
                            children: [
                              Text(
                                "Wait ",
                                style: TextStyles.h7.txtColor(Colors.white60),
                              ),
                              Text(
                                'Resending...',
                                style:
                                    TextStyles.h7.copyWith(color: Colors.white),
                              ),
                            ],
                          )
                        : Wrap(
                            children: [
                              Text(
                                context.loc.notGetMail,
                                style: TextStyles.h7.txtColor(Colors.white60),
                              ),
                              const HSpace(5),
                              Text(
                                context.loc.reSend,
                                style:
                                    TextStyles.h7.copyWith(color: Colors.white),
                              ),
                            ],
                          ).rippleClick(
                            () async {
                              resending = true;
                              setState(() {});
                              await AuthCommand(context)
                                  .resendVerificationOTP(widget.email);
                              resending = false;
                              setState(() {});
                            },
                          ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
