import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

import '../../../../components/input/base_text_input.dart';
import '../../../../core/models/business_signup_model.dart';
import '../../../country_state_city_picke/csc_picker.dart';
import 'package:chekinapp/core/models/user_signup_model.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class BusinessInfoDetailScreen extends StatefulWidget {
  const BusinessInfoDetailScreen({Key? key}) : super(key: key);

  @override
  State<BusinessInfoDetailScreen> createState() =>
      _BusinessInfoDetailScreenState();
}

class _BusinessInfoDetailScreenState extends State<BusinessInfoDetailScreen>
    with FormMixin {
  int formIndex = 0;
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    // business account
    BusinessSignUpModel businessModel =
        context.select((AuthProvider provider) => provider.businessSignUpModel);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ConstrainedBox(
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height - 120),

        ///the 120 is the estimated appbar height and the page index indicator  taking them of allows the rest part of the screens to show up in the visible area
        child: Form(
          key: formKey,
          onChanged: () {
            validate(() {}, shouldUnFocus: false);
            // print(isFormValid);
          }, //
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VSpace(23),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context.loc.businessInfo,
                        style: TextStyles.h5,
                      ),
                      Text(
                        '${formIndex == 1 ? '<<' : ''} ${formIndex + 1}/2',
                        style: TextStyles.h5.copyWith(
                            color: formIndex == 1 ? theme.primary : null),
                      ).clickable(() {
                        formIndex = 0;
                        setState(() {});
                      }),
                    ],
                  ),
                  const VSpace(5),
                  Text(
                    context.loc.aboutBusiness,
                    style: TextStyles.h7.weight(FontWeight.bold),
                  ),
                  const VSpace(5),
                  Text(
                    context.loc.toGetPotentialBuyers,
                    style: TextStyles.body1,
                  ),
                  const VSpace(42),
                  IndexedStack(
                    index: formIndex,
                    children: [
                      const BusinessNamesSection(),
                      formIndex == 1
                          ? const BusinessAddressAndLocationSection()
                          : const SizedBox(),
                    ],
                  ),
                  if (formIndex == 1) ...[const VSpace(50)],
                ],
              ),

              ///for the button
              Container(
                padding: const EdgeInsets.only(
                  bottom: 20.0,
                ),
                child: PrimaryButton(
                  onPressed: () {
                    validate(() {
                      if (formIndex == 0) {
                        formIndex = 1;
                        setState(() {});
                      } else if (formIndex == 1) {
                        ///todo: move the business account creation flow index to the next page
                        context
                            .read<AuthProvider>()
                            .setBusinessSignUpPageIndex = 4;
                      }
                    });
                  },
                  label: context.loc.conti,
                  radius: 20,
                  fullWidth: true,
                  color:
                      isFormValid == true ? theme.primary : Colors.transparent,
                  textColor: isFormValid == true ? Colors.white : theme.black,
                  borderColor: theme.primary.withOpacity(0.48),
                  contentPadding: const EdgeInsets.symmetric(vertical: 18),
                ),
              ),
              // VSpace(20),
            ], //
          ),
        ),
      ),
    );
  }
}

///the name section begins here
class BusinessNamesSection extends StatefulWidget {
  const BusinessNamesSection({Key? key}) : super(key: key);

  @override
  State<BusinessNamesSection> createState() => _BusinessNamesSectionState();
}

class _BusinessNamesSectionState extends State<BusinessNamesSection> {
  TextEditingController _bizName = TextEditingController();
  TextEditingController _controllerDOB = TextEditingController();
  TextEditingController _description = TextEditingController();
  @override
  void initState() {
    super.initState();
    _bizName.addListener(() {
      setState(() {});
    });
    _controllerDOB.addListener(() {
      setState(() {});
    });
    _description.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    // business account
    BusinessSignUpModel businessModel =
        context.select((AuthProvider provider) => provider.businessSignUpModel);

    return Column(
      children: [
        Row(
          children: [
            Text(
              context.loc.businessName,
              style: TextStyles.body1.copyWith(fontWeight: FontWeight.w900),
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
          controller: _bizName,
          // type: InputType.txt,
          // validator: Validator.string(minLength: 2),
          hintText: R.S.nameExample,
          onChange: (bizName) {
            context.read<AuthProvider>().addToBusinessInfo =
                businessModel.copyWith(businessName: bizName);
          },
        ),
        const VSpace(25),
        Row(
          children: [
            Text(
              context.loc.dateOfEstablishment,
              style: TextStyles.body1.copyWith(fontWeight: FontWeight.w900),
            ),
            Text(
              '*',
              style: TextStyles.h5.copyWith(
                  height: 1.5,
                  color: Colors.transparent,
                  fontWeight: FontWeight.w900),
            )
          ],
        ),
        Stack(
          children: [
            CustomFormTextField(
              hintText: R.S.dateExample,
              // validator: Validator.string(minLength: 2),
              controller: _controllerDOB,
            ),
            const CustomContainer(
              height: 54,
              color: Colors.transparent,
            ).clickable(() async {
              _controllerDOB.text =
                  await DateFormatter.customDatePickerFormat(context: context);

              context.read<AuthProvider>().addToBusinessInfo =
                  businessModel.copyWith(dateEstablished: _controllerDOB.text);
            }) //
          ],
        ),
        const VSpace(20),
        Row(
          children: [
            Text(
              context.loc.businessDescription,
              style: TextStyles.body1.copyWith(fontWeight: FontWeight.w900),
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
        VSpace(context.sp(5)),
        CustomFormTextField(
          controller: _description,
          // validator: Validator.string(minLength: 2),
          maxLines: 4,
          hintText: R.S.descriptionExample,
          onChange: (desc) {
            context.read<AuthProvider>().addToBusinessInfo =
                businessModel.copyWith(businessDescription: desc);
          },
        ),
      ],
    );
  }
}

//

///the country state and local government starts here as well
class BusinessAddressAndLocationSection extends StatefulWidget {
  const BusinessAddressAndLocationSection({Key? key}) : super(key: key);

  @override
  State<BusinessAddressAndLocationSection> createState() =>
      _BusinessAddressAndLocationSectionState();
}

class _BusinessAddressAndLocationSectionState
    extends State<BusinessAddressAndLocationSection> {
  TextEditingController _landMark = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    // business account
    BusinessSignUpModel businessModel =
        context.select((AuthProvider provider) => provider.businessSignUpModel);
    return Column(
      children: [
        CSCPicker(
          layout: Layout.vertical,
          dropdownDecoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: theme.greyWeak, width: .6))),
          defaultCountry: CscCountry.Nigeria,
          countryFieldTitle: context.loc.countryOfBusiness,
          stateFieldTitle: context.loc.stateOfBusiness,
          cityFieldTitle: context.loc.cityOfBusiness,
          lgaFieldTitle: context.loc.lgaOfBusiness,
          showLga: true,
          showCities: true,
          onCountryChanged: (country) {},
          onStateChanged: (state) {
            if (state != null) {
              context.read<AuthProvider>().addToBusinessInfo =
                  businessModel.copyWith(stateOfBusiness: state);
            } else {
              null;
            }
          },
          onCityChanged: (city) {
            if (city != null) {
              context.read<AuthProvider>().addToBusinessInfo =
                  businessModel.copyWith(cityOfBusiness: city);
            } else {
              null;
            }
          },
          onLgaChanged: (lga) {
            if (lga != null) {
              context.read<AuthProvider>().addToBusinessInfo =
                  businessModel.copyWith(lgaOfBusiness: lga);
            } else {
              null;
            }
          },
        ),
        const VSpace(20), //
        Row(
          children: [
            Text(
              context.loc.nearestLandMark,
              style: TextStyles.body1.copyWith(fontWeight: FontWeight.w900),
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
          controller: _landMark,
          onChange: (landMark) {
            context.read<AuthProvider>().addToBusinessInfo =
                businessModel.copyWith(nearestLandmark: landMark);
          },
          hintText: R.S.landmarkExample,
        ),
        const VSpace(20),
      ],
    );
  }
}

class PhoneNumberContactWidget extends StatefulWidget {
  const PhoneNumberContactWidget({
    super.key,
  });

  @override
  State<PhoneNumberContactWidget> createState() =>
      _PhoneNumberContactWidgetState();
}

class _PhoneNumberContactWidgetState extends State<PhoneNumberContactWidget>
    with FormMixin {
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
