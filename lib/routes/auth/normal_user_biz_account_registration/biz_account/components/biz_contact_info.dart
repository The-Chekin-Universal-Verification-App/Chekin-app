import 'package:chekinapp/routes/auth/normal_user_biz_account_registration/biz_account/social_media_handle.dart';
import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';
import '../../../phone_number_registration.dart';
import 'biz_email_section.dart';

class BusinessContactInfoScreen extends StatefulWidget {
  const BusinessContactInfoScreen({Key? key}) : super(key: key);

  @override
  State<BusinessContactInfoScreen> createState() =>
      _BusinessContactInfoScreenState();
}

class _BusinessContactInfoScreenState extends State<BusinessContactInfoScreen>
    with FormMixin {
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
                  const VSpace(5),
                  Text(
                    context.loc.yourCustomerShouldContactYou,
                    style: TextStyles.body1,
                  ),
                  // const VSpace(42),

                  ///
                  IndexedStack(
                    index: formIndex,
                    children: [
                      const BizPhoneNumberInfo(),
                      formIndex == 1 ? const EmailSection() : const SizedBox(),
                    ],
                  ),

                  ///
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
                        context.push(const SocialMediaHandleScreen());
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
