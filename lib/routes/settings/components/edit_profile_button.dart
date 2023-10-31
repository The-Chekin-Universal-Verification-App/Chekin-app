import 'package:chekinapp/export.dart';
import 'package:flutter/cupertino.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({super.key, required this.onPressed});
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          borderRadius: Corners.s10Border,
          border: Border.all(color: theme.primary)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.loc.editProfile,
            style: TextStyles.body3.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          const HSpace(4),
          SvgIcon(
            R.png.editDoc.svg,
            size: 20,
          ),
        ],
      ).rippleClick(
        onPressed,
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
      ),
    );
  }
}
