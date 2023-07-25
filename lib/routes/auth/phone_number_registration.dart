import 'package:chekinapp/core/models/business_signup_model.dart';
import 'package:chekinapp/core/models/user_signup_model.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:chekinapp/export.dart';

class PhoneNumberRegistrationWidget extends StatefulWidget {
  const PhoneNumberRegistrationWidget({
    super.key,
  });

  @override
  State<PhoneNumberRegistrationWidget> createState() =>
      _PhoneNumberRegistrationWidgetState();
}

class _PhoneNumberRegistrationWidgetState
    extends State<PhoneNumberRegistrationWidget> with FormMixin {
  String initialCountry = 'NG';

  PhoneNumber? number = PhoneNumber();
  final TextEditingController controller = TextEditingController();
  bool formValid = false;
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    //normal account
    UserSignUpModel model =
        context.select((AuthProvider provider) => provider.userSignUpModel);
    // business account
    BusinessSignUpModel businessModel =
        context.select((AuthProvider provider) => provider.businessSignUpModel);

    UserType accountType =
        context.select((AuthProvider provider) => provider.accountType);
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: context.heightPx - 120),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VSpace(15),
                  Text(
                    context.loc.phoneNumber,
                    style: TextStyles.h5,
                  ),
                  const VSpace(5),
                  Text(
                    context.loc.pickCountryCode,
                    style: TextStyles.body1,
                  ),
                  const VSpace(42),
                  Row(
                    children: [
                      Text(
                        context.loc.enterYourPhone,
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
                  VSpace(context.sp(30)),
                  InternationalPhoneNumberInput(
                    onInputChanged: (PhoneNumber number) {
                      ///write data to business model if ACCOUNT TYPE is biz
                      if (accountType == UserType.biz) {
                        context.read<AuthProvider>().addToBusinessInfo =
                            businessModel.copyWith(
                                phoneNumber: number.phoneNumber ?? "");
                      } else {
                        ///write data to normal user model if ACCOUNT TYPE is normal user

                        context.read<AuthProvider>().addToUserInfo = model
                            .copyWith(phoneNumber: number.phoneNumber ?? "");
                      }
                    },
                    onInputValidated: (bool value) {
                      formValid = value;
                      setState(() {});
                      // print(value);
                    },
                    validator: (val) {
                      if (val!.length < 10) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    selectorConfig: const SelectorConfig(
                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                    ),
                    ignoreBlank: false,
                    autoValidateMode: AutovalidateMode.disabled,
                    selectorTextStyle: const TextStyle(color: Colors.black),
                    initialValue: number,
                    textFieldController: controller,
                    formatInput: true,
                    keyboardType: const TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                    inputBorder: const UnderlineInputBorder(),
                    onSaved: (number) {
                      // print('On Saved: $number');
                    },
                  ),
                  const VSpace(50),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 42.0,
                ),
                child: PrimaryButton(
                  onPressed: () {
                    validate(() {
                      ///write data to business model if ACCOUNT TYPE is biz
                      if (accountType == UserType.biz) {
                        context
                            .read<AuthProvider>()
                            .setBusinessSignUpPageIndex = 1;
                      } else {
                        ///write data to normal user model if ACCOUNT TYPE is normal user

                        context.read<AuthProvider>().setSignUpPageIndex = 1;
                      }
                    });
                  },
                  label: context.loc.conti,
                  radius: 20,
                  fullWidth: true,
                  color: formValid ? theme.primary : Colors.transparent,
                  textColor: formValid ? Colors.white : theme.black,
                  borderColor: theme.primary.withOpacity(0.48),
                  contentPadding: const EdgeInsets.symmetric(vertical: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
