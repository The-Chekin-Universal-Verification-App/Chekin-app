
import 'package:chekinapp/export.dart';
import 'package:flutter/material.dart';

class SocialMediaItem extends StatelessWidget {
  const SocialMediaItem({
    super.key,
    required this.mediaHandleName,
    required this.iconPath,
    required this.bgColor,
  });

  final String mediaHandleName;
  final String iconPath;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Padding(
      padding: const EdgeInsets.only(right: 9.0),
      child: Material(
        color: bgColor,
        borderRadius: Corners.s10Border,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3),
          child: Row(
            children: [
              SizedBox(child: SvgPicture.asset(iconPath)),
              const HSpace(3),
              Text(
                mediaHandleName,
                style: TextStyles.body1.copyWith(
                    fontWeight: FontWeight.w500, color: theme.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
