import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

import '../../../../components/input/base_text_input.dart';

class BusinessOwnerDetailScreen extends StatefulWidget {
  const BusinessOwnerDetailScreen({Key? key}) : super(key: key);

  @override
  State<BusinessOwnerDetailScreen> createState() =>
      _BusinessOwnerDetailScreenState();
}

class _BusinessOwnerDetailScreenState extends State<BusinessOwnerDetailScreen> {
  int formIndex = 0;
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();

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
                      context.loc.personalInfo,
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
                  context.loc.whatIsYourName,
                  style: TextStyles.h7.weight(FontWeight.bold),
                ),
                const VSpace(5),
                Text(
                  context.loc.asABoss,
                  style: TextStyles.body1,
                ),
                const VSpace(42),
                IndexedStack(
                  index: formIndex,
                  children: [NamesSection(), AddressAndLocationSection()],
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
class NamesSection extends StatefulWidget {
  const NamesSection({Key? key}) : super(key: key);

  @override
  State<NamesSection> createState() => _NamesSectionState();
}

class _NamesSectionState extends State<NamesSection> {
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

///the country state and local government starts here as well
class AddressAndLocationSection extends StatefulWidget {
  const AddressAndLocationSection({Key? key}) : super(key: key);

  @override
  State<AddressAndLocationSection> createState() =>
      _AddressAndLocationSectionState();
}

class _AddressAndLocationSectionState extends State<AddressAndLocationSection> {
  TextEditingController _country = TextEditingController();
  TextEditingController _state = TextEditingController();
  TextEditingController _lga = TextEditingController();
  @override
  void initState() {
    super.initState();
    _country.addListener(() {
      setState(() {});
    });
    _state.addListener(() {
      setState(() {});
    });

    _lga.addListener(() {
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
              context.loc.nationality,
              style: TextStyles.body1.copyWith(fontWeight: FontWeight.w900),
            ),
          ],
        ),
        CustomFormTextField(
          controller: _country,
          suffix: _country.text.isNotEmpty
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
              context.loc.stateOfOrigin,
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
          controller: _state,
          suffix: _state.text.isNotEmpty
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
          suffix: _lga.text.isNotEmpty
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
