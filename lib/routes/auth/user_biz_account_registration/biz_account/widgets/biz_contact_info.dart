import 'package:chekinapp/routes/auth/user_biz_account_registration/biz_account/social_media_handle.dart';
import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

import '../../../../../components/input/base_text_input.dart';

class BusinessContactInfoScreen extends StatefulWidget {
  const BusinessContactInfoScreen({Key? key}) : super(key: key);

  @override
  State<BusinessContactInfoScreen> createState() =>
      _BusinessContactInfoScreenState();
}

class _BusinessContactInfoScreenState extends State<BusinessContactInfoScreen> {
  TextEditingController _firstMail = TextEditingController();
  TextEditingController _secondMail = TextEditingController();

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
                      context.loc.contactInfo,
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
                  context.loc.enterYourMailAddress,
                  style: TextStyles.h7.weight(FontWeight.bold),
                ),
                const VSpace(5),
                Text(
                  context.loc.yourCustomerShouldContactYou,
                  style: TextStyles.body1,
                ),
                const VSpace(42),
                Row(
                  children: [
                    Text(
                      context.loc.firstEmail,
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
                  controller: _firstMail,
                  suffix: _firstMail.text.isNotEmpty
                      ? Icon(
                          Icons.cancel,
                          color: theme.black,
                        )
                      : const SizedBox.shrink(),
                  hintText: R.S.emailExample,
                ),
                const VSpace(25),
                Row(
                  children: [
                    Text(
                      context.loc.secondEmail,
                      style: TextStyles.body1
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
                VSpace(context.sp(5)),
                CustomFormTextField(
                  controller: _secondMail,
                  suffix: _secondMail.text.isNotEmpty
                      ? Icon(
                          Icons.cancel,
                          color: theme.black,
                        )
                      : const SizedBox.shrink(),
                  hintText: R.S.emailExample,
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
                  context.push(const SocialMediaHandleScreen());
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
