import 'package:chekinapp/export.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/input/base_text_input.dart';
import '../../core/models/business_signup_model.dart';
import '../../core/models/user_signup_model.dart';
import '../country_state_city_picke/csc_picker.dart';

class CountryPickerScreen extends StatefulWidget {
  const CountryPickerScreen({Key? key}) : super(key: key);

  @override
  State<CountryPickerScreen> createState() => _CountryPickerScreenState();
}

class _CountryPickerScreenState extends State<CountryPickerScreen>
    with FormMixin {
  TextEditingController _country = TextEditingController();
  @override
  void initState() {
    super.initState();

    _country.addListener(() {
      setState(() {});
    });
  }

  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    UserSignUpModel model =
        context.select((AuthProvider provider) => provider.userSignUpModel);

    // business account
    BusinessSignUpModel businessModel =
        context.select((AuthProvider provider) => provider.businessSignUpModel);

    UserType accountType =
        context.select((AuthProvider provider) => provider.accountType);
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
                    children: [
                      Text(
                        context.loc.nationality,
                        style: TextStyles.h5,
                      ),
                    ],
                  ),
                  const VSpace(5),
                  Text(
                    context.loc.selectCountry,
                    style: TextStyles.body1,
                  ),
                  const VSpace(42),
                  Row(
                    children: [
                      Text(
                        context.loc.nationality,
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
                  CSCPicker(
                    layout: Layout.vertical,
                    showCities: false,
                    onCityChanged: (c) {},
                    onCountryChanged: (c) {},
                    onStateChanged: (s) {},
                    onLgaChanged: (l) {
                      print(l);
                    },
                  ),
                  CustomFormTextField(
                    controller: _country,
                    enabled: false,
                    hintText: context.loc.tapToSelect,
                    suffix: UnconstrainedBox(
                      child: CustomContainer(
                        height: 30,
                        width: 50,
                        borderRadius: Corners.s5Border,
                        color: Colors.transparent,
                        // border: Border.all(color: theme.greyWeak),
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 25,
                        ),
                      ),
                    ),
                  ).clickable(() {
                    showCountryPicker(
                        context: context,
                        countryListTheme: CountryListThemeData(
                          flagSize: 25,
                          backgroundColor: Colors.white,
                          textStyle: const TextStyle(
                              fontSize: 16, color: Colors.blueGrey),
                          bottomSheetHeight:
                              500, // Optional. Country list modal height
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          //Optional. Styles the search field.
                          inputDecoration: InputDecoration(
                            labelText: context.loc.search,
                            hintText: context.loc.typeToSearch,
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color(0xFF8C98A8).withOpacity(0.2),
                              ),
                            ),
                          ),
                        ),
                        // onSelect: (Country value) {},
                        onSelect: (Country country) {
                          _country.text = country.name;
// print(country.)
                          ///write data to business model if ACCOUNT TYPE is biz
                          if (accountType == UserType.biz) {
                            context.read<AuthProvider>().addToBusinessInfo =
                                businessModel.copyWith(
                                    nationality: country.name);
                          } else {
                            ///write data to normal user model if ACCOUNT TYPE is normal user

                            context.read<AuthProvider>().addToUserInfo =
                                model.copyWith(nationality: country.name);
                          }
                        });
                  }),
                  const VSpace(50),
                ],
              ),
              Container(
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
                            .setBusinessSignUpPageIndex = 3;
                      } else {
                        ///write data to normal user model if ACCOUNT TYPE is normal user

                        context.read<AuthProvider>().setSignUpPageIndex = 4;
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
