import 'package:chekinapp/export.dart';
import 'package:flutter/material.dart';

import '../../components/input/base_text_input.dart';

class EditUserProfileScreen extends StatefulWidget {
  const EditUserProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditUserProfileScreen> createState() => _EditUserProfileScreenState();
}

class _EditUserProfileScreenState extends State<EditUserProfileScreen> {
  TextEditingController _name = TextEditingController();
  TextEditingController _emailAddress = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  void initState() {
    super.initState();
    _name.addListener(() {
      setState(() {});
    });
    _emailAddress.addListener(() {
      setState(() {});
    });
    _phoneNumber.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Scaffold(
      appBar: CustomAppBar(title: context.loc.editProfile),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ConstrainedBox(
          constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - 120),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Stack(children: [
                    CircleAvatar(
                      radius: context.sp(40),
                    ),
                    Positioned(
                      right: 3,
                      bottom: 5,
                      child: CircleAvatar(
                        backgroundColor: theme.greenButton,
                        radius: context.sp(10),
                      ),
                    )
                  ]),
                  const VSpace(40),
                  Row(
                    children: [
                      Text(
                        context.loc.name,
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
                    controller: _name,
                    suffix: _name.text.isNotEmpty
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
                  VSpace(context.sp(5)),
                  CustomFormTextField(
                    controller: _emailAddress,
                    suffix: _emailAddress.text.isNotEmpty
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
                        context.loc.phoneNuber,
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
                    controller: _phoneNumber,
                    suffix: _phoneNumber.text.isNotEmpty
                        ? Icon(
                            Icons.cancel,
                            color: theme.black,
                          )
                        : const SizedBox.shrink(),
                    hintText: '07050298246',
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(
                  bottom: 20.0,
                ),
                child: PrimaryButton(
                  onPressed: () {},
                  label: context.loc.save,
                  radius: 20,
                  fullWidth: true,
                  color: Colors.transparent,
                  textColor: theme.black,
                  borderColor: theme.primary.withOpacity(0.48),
                  contentPadding: const EdgeInsets.symmetric(vertical: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditBizProfileScreen extends StatefulWidget {
  const EditBizProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditBizProfileScreen> createState() => _EditBizProfileScreenState();
}

class _EditBizProfileScreenState extends State<EditBizProfileScreen> {
  TextEditingController _bizName = TextEditingController();

  TextEditingController _bizEmailAddress = TextEditingController();

  TextEditingController _bizPhoneNumber = TextEditingController();

  void initState() {
    super.initState();
    _bizName.addListener(() {
      setState(() {});
    });
    _bizEmailAddress.addListener(() {
      setState(() {});
    });
    _bizPhoneNumber.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Scaffold(
      appBar: CustomAppBar(title: context.loc.editProfile),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ConstrainedBox(
          constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - 120),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Stack(children: [
                    CircleAvatar(
                      radius: context.sp(40),
                    ),
                    Positioned(
                      right: 3,
                      bottom: 5,
                      child: CircleAvatar(
                        backgroundColor: theme.greenButton,
                        radius: context.sp(10),
                      ),
                    )
                  ]),
                  const VSpace(40),
                  Row(
                    children: [
                      Text(
                        context.loc.name,
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
                    controller: _bizName,
                    suffix: _bizName.text.isNotEmpty
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
                  VSpace(context.sp(5)),
                  CustomFormTextField(
                    controller: _bizEmailAddress,
                    suffix: _bizEmailAddress.text.isNotEmpty
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
                        context.loc.phoneNuber,
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
                    controller: _bizPhoneNumber,
                    suffix: _bizPhoneNumber.text.isNotEmpty
                        ? Icon(
                            Icons.cancel,
                            color: theme.black,
                          )
                        : const SizedBox.shrink(),
                    hintText: '07050298246',
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(
                  bottom: 20.0,
                ),
                child: PrimaryButton(
                  onPressed: () {},
                  label: context.loc.save,
                  radius: 20,
                  fullWidth: true,
                  color: Colors.transparent,
                  textColor: theme.black,
                  borderColor: theme.primary.withOpacity(0.48),
                  contentPadding: const EdgeInsets.symmetric(vertical: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
