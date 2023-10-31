import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

import '../../../components/input/base_text_input.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen>
    with FormMixin {
  TextEditingController _currentPassword = TextEditingController();
  TextEditingController _newPassword = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height - 58),

            ///the 120 is the estimated appbar height and the page index indicator  taking them of allows the rest part of the screens to show up in the visible area
            child: Form(
              key: formKey, //
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
                          SvgIcon(R.png.arrowLeftIcon.svg).clickable(() {
                            context.pop();
                          }),
                          const HSpace(10),
                          Text(
                            context.loc.password,
                            style: TextStyles.h5,
                          ),
                        ],
                      ),
                      const VSpace(5),
                      Text(
                        context.loc.managePassword,
                        style: TextStyles.body1,
                      ),
                      const VSpace(42),
                      Row(
                        children: [
                          Text(
                            context.loc.currentPassword,
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
                        controller: _currentPassword,
                        hintText: context.loc.noEmojis,
                        isRequired: false,
                      ),
                      const VSpace(25),
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
                      VSpace(context.sp(5)),
                      CustomFormTextField(
                        controller: _newPassword,
                        type: InputType.pwd,
                        validator: Validator.password(),
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
                          if (val == _newPassword.text.trim()) {
                            return null;
                          } else {
                            return 'Password does not match';
                          }
                        },
                        hintText: context.loc.noEmojis,
                      ),
                      const VSpace(50),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      bottom: 20.0,
                    ),
                    child: PrimaryButton(
                      onPressed: () {
                        validate(() {
                          load(() => AuthCommand(context).changePassword(
                              {"password": _newPassword.text.trim()}));
                        });
                      },
                      label: context.loc.updatePassword,
                      radius: 20,
                      fullWidth: true,
                      color: isFormValid ? theme.primary : Colors.transparent,
                      textColor: isFormValid ? Colors.white : theme.black,
                      loading: isLoading,
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
      ),
    );
  }
}
