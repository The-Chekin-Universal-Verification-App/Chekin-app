import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

import '../../../components/input/base_text_input.dart';
import '../../../core/models/user_signup_model.dart';

class UserDetailView extends StatefulWidget {
  const UserDetailView({Key? key}) : super(key: key);

  @override
  State<UserDetailView> createState() => _UserDetailViewState();
}

class _UserDetailViewState extends State<UserDetailView> with FormMixin {
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _middleName = TextEditingController();
  @override
  void initState() {
    super.initState();
    _firstName.addListener(() {
      setState(() {});
    });
    _lastName.addListener(() {
      setState(() {});
    });
    _middleName.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    UserSignUpModel model =
        context.select((AuthProvider provider) => provider.userSignUpModel);
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
                  Text(
                    context.loc.whatIsYourName,
                    style: TextStyles.h5,
                  ),
                  const VSpace(5),
                  Text(
                    context.loc.tellUsYourName,
                    style: TextStyles.body1,
                  ),
                  const VSpace(42),
                  Row(
                    children: [
                      Text(
                        context.loc.firstName,
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
                    controller: _firstName,
                    onChange: (firstName) {
                      context.read<AuthProvider>().addToUserInfo =
                          model.copyWith(firstName: firstName);
                    },
                    hintText: context.loc.noEmojis,
                  ),
                  const VSpace(25),
                  Row(
                    children: [
                      Text(
                        context.loc.middleName,
                        style: TextStyles.body1
                            .copyWith(fontWeight: FontWeight.w900),
                      ),
                      Text(
                        ' ',
                        style: TextStyles.h5.copyWith(
                            height: 1.5,
                            color: theme.redButton,
                            fontWeight: FontWeight.w900),
                      )
                    ],
                  ),
                  VSpace(context.sp(5)),
                  CustomFormTextField(
                    controller: _middleName,
                    onChange: (lastName) {
                      context.read<AuthProvider>().addToUserInfo =
                          model.copyWith(middleName: lastName);
                    },
                    hintText: context.loc.noEmojis,
                  ),
                  const VSpace(25),
                  Row(
                    children: [
                      Text(
                        context.loc.lastName,
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
                    controller: _lastName,
                    onChange: (lastName) {
                      context.read<AuthProvider>().addToUserInfo =
                          model.copyWith(lastName: lastName);
                    },
                    suffix: _lastName.text.isNotEmpty
                        ? Icon(
                            Icons.cancel,
                            color: theme.black,
                          )
                        : const SizedBox.shrink(),
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
                      context.read<AuthProvider>().setSignUpPageIndex = 2;
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
