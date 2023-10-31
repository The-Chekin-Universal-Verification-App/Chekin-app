import 'package:chekinapp/core/commands/business_command.dart';
import 'package:chekinapp/export.dart';
import 'package:chekinapp/routes/settings/settings_screen.dart';
import 'package:flutter/material.dart';

import '../../components/input/base_text_input.dart';
import '../auth/normal_user_biz_account_registration/biz_account/components/biz_email_section.dart';
import '../auth/phone_number_registration.dart';
import '../country_state_city_picke/csc_picker.dart';
import '../reviews/review_screen.dart';

import 'package:chekinapp/routes/auth/normal_user_biz_account_registration/biz_account/social_media_handle.dart';

class EditBizProfileScreen extends StatefulWidget {
  const EditBizProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditBizProfileScreen> createState() => _EditBizProfileScreenState();
}

class _EditBizProfileScreenState extends State<EditBizProfileScreen> {
  TextEditingController _bizName = TextEditingController();

  TextEditingController _bizEmailAddress = TextEditingController();

  TextEditingController _bizPhoneNumber = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Scaffold(
      appBar: CustomAppBar(title: context.loc.editProfile),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VSpace(10),
            SettingsItem(
              onItemTap: () {
                // navigate to account switcher class between user and biz account
                context.push(const EditBusinessInfoDetailScreen());
              },
              title: 'Business information',
              imagePath: R.png.personIcon.svg,
            ),
            // ChekInAppDivider(
            //   color: theme.greyWeak,
            // ),
            // const VSpace(10),
            // SettingsItem(
            //   onItemTap: () {
            //     // navigate to account switcher class between user and biz account
            //     // context.push(const EditBusinessInfoDetailScreen());
            //   },
            //   title: 'Address and location',
            //   imagePath: R.png.personIcon.svg,
            // ),
            ChekInAppDivider(
              color: theme.greyWeak,
            ),
            const VSpace(10),
            SettingsItem(
              onItemTap: () {
                // navigate to account switcher class between user and biz account
                context.push(const EditSocialMediaHandleScreen());
              },
              title: 'Business social handle',
              imagePath: R.png.personIcon.svg,
            ),
            ChekInAppDivider(
              color: theme.greyWeak,
            ),
            const VSpace(10),
            SettingsItem(
              onItemTap: () {
                context.push(const EditBusinessContactInfoScreen());
              },
              title: 'Contact information',
              imagePath: R.png.personIcon.svg, //
            ),
            ChekInAppDivider(
              color: theme.greyWeak,
            ),
          ],
        ),
      ),
    );
  }
}

///
///
///
///

class EditBusinessInfoDetailScreen extends StatefulWidget {
  const EditBusinessInfoDetailScreen({Key? key}) : super(key: key);

  @override
  State<EditBusinessInfoDetailScreen> createState() =>
      _EditBusinessInfoDetailScreenState();
}

class _EditBusinessInfoDetailScreenState
    extends State<EditBusinessInfoDetailScreen> with FormMixin {
  int formIndex = 0;
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    // business account
    BusinessSignUpModel businessModel =
        context.select((AuthProvider provider) => provider.businessSignUpModel);
    return Scaffold(
      appBar: CustomAppBar(
        onTapLeadingIcon: () {
          Navigator.of(context).pop();
          context.read<AuthProvider>().clearBusinessInfo();
        },
        titleWidget: Text(
          'Edit business information',
          style: TextStyles.h5
              .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
        ),
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
                    const VSpace(42),
                    IndexedStack(
                      index: formIndex,
                      children: [
                        const EditBusinessNamesSection(),
                        formIndex == 1
                            ? const EditBusinessAddressAndLocationSection()
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
                          validateFields(businessModel, onFieldValidAction: () {
                            load(() => BusinessCommand(context)
                                .updateBusiness(businessModel));
                          });
                        }
                      });
                    },
                    label:
                        formIndex == 1 ? context.loc.save : context.loc.conti,
                    radius: 20,
                    fullWidth: true,
                    loading: isLoading,
                    color: isFormValid == true
                        ? theme.primary
                        : Colors.transparent,
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
      ),
    );
  }

  validateFields(BusinessSignUpModel businessModel,
      {required Function() onFieldValidAction}) {
    if (businessModel.businessDescription == '' &&
        businessModel.dateEstablished == '' &&
        businessModel.businessName == '' &&
        businessModel.nearestLandmark == '' &&
        businessModel.lgaOfBusiness == '' &&
        businessModel.stateOfBusiness == '' &&
        businessModel.cityOfBusiness == '' &&
        businessModel.businessName == '') {
      DialogServices.messageModalFromTop(context,
          message:
              'You can not update profile with empty details, file at least one of the field to update.',
          notificationType: NotificationType.error);
    } else {
      onFieldValidAction();
    }
  }
}

///the name section begins here
class EditBusinessNamesSection extends StatefulWidget {
  const EditBusinessNamesSection({Key? key}) : super(key: key);

  @override
  State<EditBusinessNamesSection> createState() =>
      _EditBusinessNamesSectionState();
}

class _EditBusinessNamesSectionState extends State<EditBusinessNamesSection> {
  TextEditingController _bizName = TextEditingController();
  TextEditingController _controllerDOB = TextEditingController();
  TextEditingController _description = TextEditingController();
  @override
  void initState() {
    super.initState();
    _bizName.text = AuthCommand(context).auth.business.name;
    _controllerDOB.text = AuthCommand(context).auth.business.dateEstablished;
    _description.text = AuthCommand(context).auth.business.description;
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
              '',
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
              '',
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
              '',
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
class EditBusinessAddressAndLocationSection extends StatefulWidget {
  const EditBusinessAddressAndLocationSection({Key? key}) : super(key: key);

  @override
  State<EditBusinessAddressAndLocationSection> createState() =>
      _EditBusinessAddressAndLocationSectionState();
}

class _EditBusinessAddressAndLocationSectionState
    extends State<EditBusinessAddressAndLocationSection> {
  final TextEditingController _landMark = TextEditingController();
  @override
  initState() {
    super.initState();
    _landMark.text = AuthCommand(context).auth.business.nearestLandmark;
  }

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

///business contact info
///
class EditBusinessContactInfoScreen extends StatefulWidget {
  const EditBusinessContactInfoScreen({Key? key}) : super(key: key);

  @override
  State<EditBusinessContactInfoScreen> createState() =>
      _EditBusinessContactInfoScreenState();
}

class _EditBusinessContactInfoScreenState
    extends State<EditBusinessContactInfoScreen> with FormMixin {
  int formIndex = 0;
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    BusinessSignUpModel businessModel =
        context.select((AuthProvider provider) => provider.businessSignUpModel);

    return Scaffold(
      appBar: CustomAppBar(
        onTapLeadingIcon: () {
          Navigator.of(context).pop();
          context.read<AuthProvider>().clearBusinessInfo();
        },
        titleWidget: Text(
          'Edit business contact',
          style: TextStyles.h5
              .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
        ),
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
                          context.loc.contactInfo,
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
                      formIndex == 0
                          ? context.loc.enterYourPhone
                          : context.loc.enterYourMailAddress,
                      style: TextStyles.h7.weight(FontWeight.bold),
                    ),
                    const VSpace(50),

                    ///
                    IndexedStack(
                      index: formIndex,
                      children: [
                        const BizPhoneNumberInfo(
                          fieldRequired: false,
                        ),
                        formIndex == 1
                            ? const EmailSection(
                                fieldRequired: false,
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ],
                ),

                ///for the button
                Container(
                  padding: const EdgeInsets.only(
                    bottom: 60.0,
                  ),
                  child: PrimaryButton(
                    onPressed: () {
                      validate(() {
                        if (formIndex == 0) {
                          formIndex = 1;
                          setState(() {});
                        } else if (formIndex == 1) {
                          if (businessModel.phoneNumber1 == '' &&
                              businessModel.email1 == '') {
                            DialogServices.messageModalFromTop(context,
                                message:
                                    'You can not update profile with empty details',
                                notificationType: NotificationType.error);
                          } else {
                            load(() => BusinessCommand(context)
                                .updateBusiness(businessModel));
                          }
                        } //
                      });
                    },
                    label:
                        formIndex == 1 ? context.loc.save : context.loc.conti,
                    radius: 20,
                    fullWidth: true,
                    loading: isLoading,
                    color: isFormValid == true
                        ? theme.primary
                        : Colors.transparent,
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
      ),
    );
  }
}
