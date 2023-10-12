import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

import '../../../../components/input/base_text_input.dart';
import '../../../country_state_city_picke/csc_picker.dart';

class BusinessOwnerDetailScreen extends StatefulWidget {
  const BusinessOwnerDetailScreen({Key? key}) : super(key: key);

  @override
  State<BusinessOwnerDetailScreen> createState() =>
      _BusinessOwnerDetailScreenState();
}

class _BusinessOwnerDetailScreenState extends State<BusinessOwnerDetailScreen>
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
            validate(() {
              setState(() {});
            }, shouldUnFocus: false);
          },
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
                        context.loc.personalInfo,
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
                    formIndex == 1
                        ? context.loc.whereAreYouFrom
                        : context.loc.whatIsYourName,
                    style: TextStyles.h7.weight(FontWeight.bold),
                  ),
                  const VSpace(5),
                  Text(
                    formIndex == 1
                        ? context.loc.weLoveToKnowYouBetter
                        : context.loc.asABoss,
                    style: TextStyles.body1,
                  ),
                  const VSpace(42),
                  IndexedStack(
                    index: formIndex,
                    children: const [
                      NamesSection(),
                      AddressAndLocationSection(),
                    ],
                  ),
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
                        if (businessModel.lga != '') {
                          context
                              .read<AuthProvider>()
                              .setBusinessSignUpPageIndex = 2;
                        } else {
                          DialogServices.emptyModalWithNoTitle(context,
                              title: 'please select your city',
                              bgColor: theme.redButton);
                        }
                      }
                    });
                  },
                  label: context.loc.conti,
                  radius: 20,
                  fullWidth: true,
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
    );
  }
}

///the name section begins here
class NamesSection extends StatefulWidget {
  const NamesSection({Key? key}) : super(key: key);

  @override
  State<NamesSection> createState() => _NamesSectionState();
}

class _NamesSectionState extends State<NamesSection> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _middleName = TextEditingController();
  final TextEditingController _personalEmail = TextEditingController();
  @override
  void initState() {
    super.initState();
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
              context.loc.firstName,
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
          controller: _firstName,
          onChange: (firstName) {
            context.read<AuthProvider>().addToBusinessInfo =
                businessModel.copyWith(firstName: firstName);
          },
          hintText: context.loc.noEmojis,
        ),
        const VSpace(25),
        Row(
          children: [
            Text(
              context.loc.middleName,
              style: TextStyles.body1.copyWith(fontWeight: FontWeight.w900),
            ),
          ],
        ),
        CustomFormTextField(
          controller: _middleName,
          onChange: (middleName) {
            context.read<AuthProvider>().addToBusinessInfo =
                businessModel.copyWith(middleName: middleName);
          },
          hintText: context.loc.noEmojis,
          isRequired: false,
        ),
        const VSpace(20),
        Row(
          children: [
            Text(
              context.loc.lastName,
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
          controller: _lastName,
          onChange: (lastName) {
            context.read<AuthProvider>().addToBusinessInfo =
                businessModel.copyWith(lastName: lastName);
          },
          hintText: context.loc.noEmojis,
        ),
        const VSpace(25),
        Row(
          children: [
            Text(
              context.loc.emailAddress,
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
          controller: _personalEmail,
          type: InputType.email,
          validator: (value) => Validator.email(value),
          onChange: (email) {
            context.read<AuthProvider>().addToBusinessInfo =
                businessModel.copyWith(email: email);
          },
          hintText: R.S.emailExample,
        ),
      ],
    );
  }
}

///the country state and local government starts here as well
class AddressAndLocationSection extends StatefulWidget {
  const AddressAndLocationSection({Key? key}) : super(key: key);

  @override
  State<AddressAndLocationSection> createState() =>
      _AddressAndLocationSectionState();
}

class _AddressAndLocationSectionState extends State<AddressAndLocationSection> {
  @override
  void initState() {}

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
          showStates: true,
          showLga: true,
          showCities: false,
          flagState: CountryFlag.SHOW_IN_DROP_DOWN_ONLY,
          onCountryChanged: (country) {
            // print('$country lllllll');
            context.read<AuthProvider>().addToBusinessInfo =
                businessModel.copyWith(nationality: country);
          }, //
          onStateChanged: (state) {
            if (state == null) {
              null;
            } else {
              // print('$state zzzz');
              context.read<AuthProvider>().addToBusinessInfo =
                  businessModel.copyWith(state: state);
            } //
          },
          onLgaChanged: (lga) {
            if (lga == null) {
              null;
            } else {
              context.read<AuthProvider>().addToBusinessInfo =
                  businessModel.copyWith(lga: lga);
            }
          },
          onCityChanged: (d) {
            // print(businessModel.toJson());
          },
        ),
      ],
    );
  }
}
