import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

import '../../../../../components/input/base_text_input.dart';

class SocialMediaHandleScreen extends StatefulWidget {
  const SocialMediaHandleScreen({Key? key}) : super(key: key);

  @override
  State<SocialMediaHandleScreen> createState() =>
      _SocialMediaHandleScreenState();
}

class _SocialMediaHandleScreenState extends State<SocialMediaHandleScreen>
    with FormMixin {
  TextEditingController _instagram = TextEditingController();
  TextEditingController _faceBook = TextEditingController();
  TextEditingController _twitter = TextEditingController();
  TextEditingController _ticTok = TextEditingController();
  TextEditingController _linkedIn = TextEditingController();
  // TextEditingController _whatsApp = TextEditingController();

  int formIndex = 0;
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    BusinessSignUpModel businessModel =
        context.select((AuthProvider provider) => provider.businessSignUpModel);

    return Scaffold(
      appBar: CustomAppBar(
        leading: true,
        titleWidget: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 30),
          child: const LogoIconItem(allRoundPadding: 1),
        ),
        trailing: [
          UnconstrainedBox(
            child: CustomContainer(
              height: 30,
              width: 30,
              padding: const EdgeInsets.all(5),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: theme.primary,
              ),
              child: CircleAvatar(
                backgroundColor: theme.black,
                child: const Icon(
                  Icons.question_mark_rounded,
                  size: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const HSpace(20)
        ],
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
                          context.loc.socials,
                          style: TextStyles.h5,
                        ),
                        Text(
                          context.loc.skip,
                          style: TextStyles.h5,
                        ).rippleClick(() {
                          validate(() {
                            load(() => AuthCommand(context)
                                .bizAccountSignUp(businessModel));
                          });
                        }),
                      ],
                    ),
                    const VSpace(5),
                    Text(
                      context.loc.enterSocialMedia,
                      style: TextStyles.h7.weight(FontWeight.bold),
                    ),
                    const VSpace(5),
                    Text(
                      context.loc.enterYourDifferentSocialMedia,
                      style: TextStyles.body1,
                    ),
                    const VSpace(16),
                    CustomFormTextField(
                      controller: _instagram,
                      onChange: (insta) {
                        context.read<AuthProvider>().addToBusinessInfo =
                            businessModel.copyWith(instagram: insta);
                      },
                      hintText: context.loc.instagram,
                      isRequired: false,
                    ),
                    const VSpace(25),
                    CustomFormTextField(
                      controller: _faceBook,
                      onChange: (facebook) {
                        context.read<AuthProvider>().addToBusinessInfo =
                            businessModel.copyWith(facebook: facebook);
                      },
                      hintText: context.loc.facebook,
                      isRequired: false,
                    ),
                    const VSpace(25),
                    CustomFormTextField(
                      controller: _twitter,
                      onChange: (twitter) {
                        context.read<AuthProvider>().addToBusinessInfo =
                            businessModel.copyWith(twitter: twitter);
                      },
                      hintText: context.loc.twitter,
                      isRequired: false,
                    ),
                    const VSpace(25),
                    CustomFormTextField(
                      controller: _ticTok,
                      onChange: (tickTock) {
                        context.read<AuthProvider>().addToBusinessInfo =
                            businessModel.copyWith(tiktok: tickTock);
                      },
                      hintText: context.loc.ticTok,
                      isRequired: false,
                    ),
                    const VSpace(25),
                    CustomFormTextField(
                      controller: _linkedIn,
                      onChange: (linkedin) {
                        context.read<AuthProvider>().addToBusinessInfo =
                            businessModel.copyWith(linkedIn: linkedin);
                      },
                      hintText: context.loc.linkedIn,
                      isRequired: false,
                    ),
                    // const VSpace(25),
                    // CustomFormTextField(
                    //   controller: _whatsApp,
                    //   onChange: (insta) {
                    //     context.read<AuthProvider>().addToBusinessInfo =
                    //         businessModel.copyWith(: insta);
                    //   },
                    //   hintText: context.loc.whatsApp,
                    // ),
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
                      validate(() {
                        load(() => AuthCommand(context)
                            .bizAccountSignUp(businessModel));
                      }); // context.push(const YouAreAlmostDoneScreen());
                    },
                    label: context.loc.conti,
                    radius: 20,
                    fullWidth: true,
                    loading: isLoading,
                    color: isFormValid == true
                        ? theme.primary
                        : Colors.transparent,
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
      ),
    );
  }
}
