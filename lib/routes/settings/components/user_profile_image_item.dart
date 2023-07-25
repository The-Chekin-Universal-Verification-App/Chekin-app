import 'package:chekinapp/export.dart';
import 'package:flutter/material.dart';

class UserProfileImageItem extends StatelessWidget {
  const UserProfileImageItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();

    return Stack(children: [
      CircleAvatar(
        backgroundColor: theme.primary.withOpacity(0.1),
        radius: context.sp(50),
        child: Image.asset(R.png.man.imgPng),
      ),
      Positioned(
        right: 10,
        bottom: 10,
        child: CircleAvatar(
          backgroundColor: theme.greenButton,
          radius: context.sp(10),
        ),
      )
    ]);
  }
}
