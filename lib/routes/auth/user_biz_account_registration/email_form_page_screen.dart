import 'package:chekinapp/core/commands/sign_up_command.dart';
import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

import '../../../components/input/base_text_input.dart';
import '../../../core/models/user_signup_model.dart';
import '../success_registration_screen.dart';

class EmailEntryScreen extends StatefulWidget {
  const EmailEntryScreen({Key? key}) : super(key: key);

  @override
  State<EmailEntryScreen> createState() => _EmailEntryScreenState();
}

class _EmailEntryScreenState extends State<EmailEntryScreen> with FormMixin {
  TextEditingController _firstName = TextEditingController();
  @override
  void initState() {
    super.initState();
    _firstName.addListener(() {
      setState(() {});
    });
  }

  int pageIndex = 0;
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
                    context.loc.emailLastly,
                    style: TextStyles.h5,
                  ),
                  const VSpace(5),
                  Text(
                    context.loc.wantToReachOut,
                    style: TextStyles.body1,
                  ),
                  const VSpace(42),
                  Row(
                    children: [
                      Text(
                        context.loc.emailAddress,
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
                    controller: _firstName,
                    onChange: (email) {
                      context.read<AuthProvider>().addToUserInfo =
                          model.copyWith(email: email);
                    },
                    suffix: _firstName.text.isNotEmpty
                        ? Icon(
                            Icons.cancel,
                            color: theme.black,
                          )
                        : const SizedBox.shrink(),
                    hintText: R.S.emailExample,
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(
                  bottom: 42.0,
                ),
                child: PrimaryButton(
                  onPressed: () {
                    validate(() {
                      load(
                          () => SignUpCommand(context).normalUserSignUp(model));
                    });
                    // context.push(const SuccessRegistrationScreen());
                  },
                  label: context.loc.submit,
                  radius: 20,
                  fullWidth: true,
                  loading: isLoading,
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
