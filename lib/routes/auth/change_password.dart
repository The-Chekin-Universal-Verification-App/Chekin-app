import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

import '../../../components/input/base_text_input.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController _currentPassword = TextEditingController();
  TextEditingController _newPassword = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  @override
  void initState() {
    super.initState();
    _currentPassword.addListener(() {
      setState(() {});
    });
    _newPassword.addListener(() {
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
                  children: [
                    SvgIcon(R.png.arrowLeftIcon.svg),
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
                  suffix: _currentPassword.text.isNotEmpty
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
                  suffix: _newPassword.text.isNotEmpty
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
                  suffix: _confirmPassword.text.isNotEmpty
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
                bottom: 20.0,
              ),
              child: PrimaryButton(
                onPressed: () {},
                label: context.loc.updatePassword,
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
