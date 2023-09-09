import 'package:chekinapp/export.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'settings.dart';
import '../../components/input/base_text_input.dart';

class EditUserProfileScreen extends StatefulWidget {
  const EditUserProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditUserProfileScreen> createState() => _EditUserProfileScreenState();
}

class _EditUserProfileScreenState extends State<EditUserProfileScreen>
    with FormMixin {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _middleName = TextEditingController();
  final TextEditingController _emailAddress = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();

  PhoneNumber? number = PhoneNumber();

  @override
  void initState() {
    super.initState();
    AuthProvider auth = Provider.of(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _firstName.text = auth.user.firstName;
      _lastName.text = auth.user.lastName;
      _middleName.text = auth.user.middleName;
      _emailAddress.text = auth.user.email;
      _phoneNumber.text = auth.user.phoneNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    UserModel model =
        context.select((AuthProvider provider) => provider.userCopy);
    return Scaffold(
      appBar: CustomAppBar(
        titleWidget: Text(
          context.loc.editProfile,
          style: TextStyles.h5
              .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const UserProfileImageItem(),

                    const VSpace(20),
                    Row(
                      children: [
                        Text(
                          context.loc.name,
                          style: TextStyles.body1
                              .copyWith(fontWeight: FontWeight.w900),
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
                      controller: _firstName,
                      hintText: context.loc.noEmojis,
                      onChange: (firstName) {
                        context.read<AuthProvider>().updateUser =
                            model.copyWith(firstName: firstName);
                      },
                      isRequired: false,
                    ),
                    const VSpace(20),
                    Row(
                      children: [
                        Text(
                          context.loc.lastName,
                          style: TextStyles.body1
                              .copyWith(fontWeight: FontWeight.w900),
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
                      controller: _lastName,
                      hintText: context.loc.noEmojis,
                      onChange: (lastName) {
                        context.read<AuthProvider>().updateUser =
                            model.copyWith(lastName: lastName);
                      },
                      isRequired: false,
                    ),
                    const VSpace(20),
                    Row(
                      children: [
                        Text(
                          context.loc.middleName,
                          style: TextStyles.body1
                              .copyWith(fontWeight: FontWeight.w900),
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
                    // VSpace(context.sp(5)),
                    CustomFormTextField(
                      controller: _middleName,
                      hintText: context.loc.noEmojis,
                      onChange: (middleName) {
                        context.read<AuthProvider>().updateUser =
                            model.copyWith(middleName: middleName);
                      },
                      isRequired: false,
                    ),
                    const VSpace(20),
                    Row(
                      children: [
                        Text(
                          context.loc.emailAddress,
                          style: TextStyles.body1
                              .copyWith(fontWeight: FontWeight.w900),
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
                      controller: _emailAddress,
                      hintText: R.S.emailExample,
                      onChange: (email) {
                        context.read<AuthProvider>().updateUser =
                            model.copyWith(email: email);
                      },
                      isRequired: false,
                    ),
                    const VSpace(20),
                    Row(
                      children: [
                        Text(
                          context.loc.phoneNumber,
                          style: TextStyles.body1
                              .copyWith(fontWeight: FontWeight.w900),
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
                    InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {
                        context.read<AuthProvider>().updateUser = model
                            .copyWith(phoneNumber: number.phoneNumber ?? "");
                      },
                      onInputValidated: (bool value) {
                        setState(() {});
                        // print(value);
                      },
                      validator: (val) {
                        if (val!.isNotEmpty && val.length < 10) {
                          return 'Enter a valid number';
                        }
                        return null;
                      },
                      selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                      ),
                      ignoreBlank: true,
                      autoValidateMode: AutovalidateMode.disabled,
                      selectorTextStyle: const TextStyle(color: Colors.black),
                      initialValue: number,
                      textFieldController: _phoneNumber,
                      formatInput: true,
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      inputBorder: const UnderlineInputBorder(),
                      onSaved: (number) {
                        // print('On Saved: $number');
                      },
                    ),
                  ],
                ),
                const VSpace(50),
                Container(
                  padding: const EdgeInsets.only(
                    bottom: 20.0,
                  ),
                  child: PrimaryButton(
                    onPressed: () {
                      validate(() {
                        load(() =>
                            UserCommand(context).updateUserProfile(model, ''));
                      });
                    },
                    label: context.loc.save,
                    radius: 20,
                    fullWidth: true,
                    textColor: Colors.white,
                    loading: isLoading,
                    borderColor: theme.primary.withOpacity(0.48),
                    contentPadding: const EdgeInsets.symmetric(vertical: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
