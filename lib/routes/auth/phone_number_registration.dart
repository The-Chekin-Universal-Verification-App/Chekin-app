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
    extends State<PhoneNumberRegistrationWidget> {
  String initialCountry = 'NG';

  PhoneNumber? number = PhoneNumber();
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VSpace(15),
              Text(
                context.loc.enterYourPhone,
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
                    style:
                        TextStyles.body1.copyWith(fontWeight: FontWeight.w900),
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
                  // print(number.phoneNumber); //
                },
                onInputValidated: (bool value) {
                  // print(value);
                },
                selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                ),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: TextStyle(color: Colors.black),
                initialValue: number,
                textFieldController: controller,
                formatInput: true,
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                inputBorder: OutlineInputBorder(),
                onSaved: (number) {
                  print('On Saved: $number');
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
                // print("${context.heightPx} height");
                // print("${context.widthPx} width");
              },
              label: context.loc.conti,
              radius: 20,
              fullWidth: true,
              color: Colors.transparent,
              textColor: theme.black,
              borderColor: theme.primary.withOpacity(0.48),
              contentPadding: const EdgeInsets.symmetric(vertical: 18),
            ),
          )
        ],
      ),
    );
  }
}
