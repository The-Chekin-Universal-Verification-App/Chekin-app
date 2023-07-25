import 'package:chekinapp/export.dart';
import 'package:flutter/material.dart';
import 'settings.dart';

class NormalUserAccountProfile extends StatelessWidget {
  const NormalUserAccountProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Scaffold(
        appBar: CustomAppBar(
          titleWidget: Text(
            context.loc.manageAccount,
            style: TextStyles.h5
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: Insets.l),
          child: Column(
            children: [
              const UserProfileImageItem(),
              const VSpace(8),
              EditProfileButton(onPressed: () {
                context.push(const EditUserProfileScreen());
              }),
              const VSpace(20),
              ProfilePageFieldItem(
                label: context.loc.name,
                text: R.S.userName,
              ),
              ProfilePageFieldItem(
                label: context.loc.emailAddress,
                text: R.S.emailExample,
              ),
              ProfilePageFieldItem(
                label: context.loc.phoneNumber,
                text: '07050298246',
              ),
            ],
          ),
        ));
  }
}
