import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

import '../../../../components/input/base_text_input.dart';
import '../../../../core/models/business_signup_model.dart';

class BusinessInfoDetailScreen extends StatefulWidget {
  const BusinessInfoDetailScreen({Key? key}) : super(key: key);

  @override
  State<BusinessInfoDetailScreen> createState() =>
      _BusinessInfoDetailScreenState();
}

class _BusinessInfoDetailScreenState extends State<BusinessInfoDetailScreen> {
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
                      '${formIndex + 1}/2',
                      style: TextStyles.h5,
                    ),
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
                    BusinessNamesSection(),
                    BusinessAddressAndLocationSection()
                  ],
                ),
                const VSpace(50),
              ],
            ),

            ///for the button
            Container(
              padding: const EdgeInsets.only(
                bottom: 20.0,
              ),
              child: PrimaryButton(
                onPressed: () {
                  if (formIndex == 0) {
                    formIndex = 1;
                    setState(() {});
                  } else if (formIndex == 1) {
                    ///todo: move the business account creation flow index to the next page
                    // context.read<AppProvider>();
                  }
                },
                label: context.loc.conti,
                radius: 20,
                fullWidth: true,
                color: Colors.transparent,
                textColor: theme.black,
                borderColor: theme.primary.withOpacity(0.48),
                contentPadding: const EdgeInsets.symmetric(vertical: 18),
              ),
            ),
            // VSpace(20),
          ], //
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
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  @override
  void initState() {
    super.initState();
    _firstName.addListener(() {
      setState(() {});
    });
    _lastName.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
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
          suffix: _firstName.text.isNotEmpty
              ? Icon(
                  Icons.cancel,
                  color: theme.black,
                )
              : const SizedBox.shrink(),
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
          controller: _firstName,
          suffix: _firstName.text.isNotEmpty
              ? Icon(
                  Icons.cancel,
                  color: theme.black,
                )
              : const SizedBox.shrink(),
          hintText: context.loc.noEmojis,
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
          suffix: _lastName.text.isNotEmpty
              ? Icon(
                  Icons.cancel,
                  color: theme.black,
                )
              : const SizedBox.shrink(),
          hintText: context.loc.noEmojis,
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
  TextEditingController _city = TextEditingController();
  TextEditingController _landMark = TextEditingController();
  TextEditingController _lga = TextEditingController();
  @override
  void initState() {
    super.initState();
    _city.addListener(() {
      setState(() {});
    });
    _landMark.addListener(() {
      setState(() {});
    });

    _lga.addListener(() {
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
              context.loc.cityOfBusiness,
              style: TextStyles.body1.copyWith(fontWeight: FontWeight.w900),
            ),
          ],
        ),
        CustomFormTextField(
          controller: _city,
          onChange: (bizCity) {
            context.read<AuthProvider>().addToBusinessInfo =
                businessModel.copyWith(cityOfBusiness: bizCity);
          },
          suffix: _city.text.isNotEmpty
              ? Icon(
                  Icons.cancel,
                  color: theme.black,
                )
              : const SizedBox.shrink(),
          hintText: R.S.cityExample,
        ),
        const VSpace(25),
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
          suffix: _landMark.text.isNotEmpty
              ? Icon(
                  Icons.cancel,
                  color: theme.black,
                )
              : const SizedBox.shrink(),
          hintText: R.S.landmarkExample,
        ),
        const VSpace(20),
        Row(
          children: [
            Text(
              context.loc.lga,
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
          controller: _lga,
          onChange: (landMark) {
            context.read<AuthProvider>().addToBusinessInfo =
                businessModel.copyWith(nearestLandmark: landMark);
          },
          suffix: _lga.text.isNotEmpty
              ? Icon(
                  Icons.cancel,
                  color: theme.black,
                )
              : const SizedBox.shrink(),
          hintText: R.S.localGovernmentExample,
        ),
      ],
    );
  }
}
