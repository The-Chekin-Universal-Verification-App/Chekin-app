import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

import '../../../components/input/base_text_input.dart';
import '../../core/models/business_signup_model.dart';
import '../../core/models/user_signup_model.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key, this.onSuccessIndexPageGoTo})
      : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
  final int? onSuccessIndexPageGoTo;
}

class _PasswordScreenState extends State<PasswordScreen> with FormMixin {
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  @override
  void initState() {
    super.initState();

    _password.addListener(() {
      setState(() {});
    });
    _confirmPassword.addListener(() {
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
                        context.loc.password,
                        style: TextStyles.h5,
                      ),
                    ],
                  ),
                  const VSpace(5),
                  Text(
                    context.loc.createAccountPassword,
                    style: TextStyles.body1,
                  ),
                  const VSpace(42),
                  Row(
                    children: [
                      Text(
                        context.loc.newPassword,
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
                  // VSpace(context.sp(5)),
                  CustomFormTextField(
                    controller: _password,
                    onChange: (password) {
                      ///write data to business model if ACCOUNT TYPE is biz
                      if (accountType == UserType.biz) {
                        context.read<AuthProvider>().addToBusinessInfo =
                            businessModel.copyWith(password: password);
                      } else {
                        ///write data to normal user model if ACCOUNT TYPE is normal user

                        context.read<AuthProvider>().addToUserInfo =
                            model.copyWith(password: password);
                      }
                    },
                    hintText: context.loc.noEmojis,
                  ),

                  const VSpace(25),
                  Row(
                    children: [
                      Text(
                        context.loc.confirmPassword,
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
                  VSpace(context.sp(5)),
                  CustomFormTextField(
                    controller: _confirmPassword,
                    validator: (val) {
                      ///write data to business model if ACCOUNT TYPE is biz
                      if (accountType == UserType.biz) {
                        if (val == businessModel.password) {
                          return null;
                        } else {
                          return 'Password does not match';
                        }
                      } else {
                        ///write data to normal user model if ACCOUNT TYPE is normal user
                        if (val == model.password) {
                          return null;
                        } else {
                          return 'Password does not match';
                        }
                      }
                    },
                    hintText: context.loc.noEmojis,
                  ),
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
                                .setBusinessSignUpPageIndex =
                            widget.onSuccessIndexPageGoTo ?? 3;
                      } else {
                        ///write data to normal user model if ACCOUNT TYPE is normal user

                        context.read<AuthProvider>().setSignUpPageIndex =
                            widget.onSuccessIndexPageGoTo ?? 3;
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
