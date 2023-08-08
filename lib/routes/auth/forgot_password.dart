import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

import '../../../components/input/base_text_input.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>
    with FormMixin {
  TextEditingController _email = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  EmailVerificationModel model = EmailVerificationModel.init();
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();

    return Scaffold(
      appBar: CustomAppBar(
        onTapLeadingIcon: () {},
        leadingIcon: const LogoIconItem(),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ConstrainedBox(
          constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - 120),

          ///the 120 is the estimated appbar height and the page index indicator  taking them of allows the rest part of the screens to show up in the visible area
          child: Form(
            key: formKey,
            onChanged: () {
              validate(() {}, shouldUnFocus: false);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const VSpace(23),
                    Text(
                      'Get OTP to reset your account',
                      style: TextStyles.h5,
                    ),
                    const VSpace(5),
                    Text(
                      'Please enter the associated email address so you can restore your account',
                      style: TextStyles.body1,
                    ),
                    const VSpace(42),
                    Row(
                      children: [
                        Text(
                          context.loc.emailAddress,
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
                      controller: _email,
                      type: InputType.email,
                      onChange: (email) {
                        model = model.copyWith(email: email);
                      },
                      validator: (email) => Validator.email(email),
                      hintText: R.S.emailExample,
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(
                    bottom: 22.0,
                  ),
                  child: PrimaryButton(
                    onPressed: () {
                      validate(() {
                        load(() => AuthCommand(context).forgotPassword(model));
                      });
                    },
                    label: context.loc.submit,
                    radius: 20,
                    fullWidth: true,
                    loading: isLoading,
                    color: isFormValid ? theme.primary : Colors.transparent,
                    textColor: isFormValid ? Colors.white : theme.black,
                    borderColor: theme.primary.withOpacity(0.48),
                    contentPadding: const EdgeInsets.symmetric(vertical: 18),
                  ),
                ),
                // VSpace(20),
              ], //
            ),
          ),
        ),
      ),
    );
  }
}
