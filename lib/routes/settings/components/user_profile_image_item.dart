import 'package:chekinapp/export.dart';
import 'package:flutter/material.dart';

class UserProfileImageItem extends StatelessWidget {
  const UserProfileImageItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    UserModel user = context.select((AuthProvider provider) => provider.user);

    return Stack(children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: CircleAvatar(
          backgroundColor: theme.primary.withOpacity(0.1),
          radius: context.sp(40),
          child: Image.network(
            user.profileImageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(
        right: 2,
        bottom: 10,
        child: CircleAvatar(
          backgroundColor: theme.greenButton,
          radius: context.sp(9),
        ),
      )
    ]);
  }
}
