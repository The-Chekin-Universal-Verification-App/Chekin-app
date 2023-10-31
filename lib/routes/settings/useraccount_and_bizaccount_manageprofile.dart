import 'package:chekinapp/export.dart';
import 'package:flutter/material.dart';
import 'settings.dart';

class UserTypeProfileAccountSwitcher extends StatelessWidget {
  const UserTypeProfileAccountSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserType userType =
        context.select((AuthProvider provider) => provider.accountType);
    if (userType == UserType.biz) {
      return const BusinessAccountProfile();
      // return const NormalUserAccountProfile();
    } else {
      return const NormalUserAccountProfile();
    }
  }
}
