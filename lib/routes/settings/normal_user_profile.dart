import 'package:chekinapp/export.dart';
import 'package:flutter/material.dart';
import 'settings.dart';

class NormalUserAccountProfile extends StatelessWidget {
  const NormalUserAccountProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    UserModel user = context.select((AuthProvider provider) => provider.user);
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
                text: "${user.firstName} ${user.middleName} ${user.lastName}",
              ),
              ProfilePageFieldItem(
                label: context.loc.emailAddress,
                text: user.email,
              ),
              ProfilePageFieldItem(
                label: context.loc.phoneNumber,
                text: user.phoneNumber,
              ),
              ProfilePageFieldItem(
                label: context.loc.phoneNumber,
                text: user.nationality,
              ),
            ],
          ),
        ));
  }
}
