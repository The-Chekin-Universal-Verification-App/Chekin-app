



import 'package:flutter/cupertino.dart';

import '../../../components/spacer.dart';
import '../../../utils/styles/app_style.dart';
import '../../reviews/review_screen.dart';

class ProfilePageFieldItem extends StatelessWidget {
  const ProfilePageFieldItem({
    super.key,
    required this.label,
    required this.text,
  });
  final String label, text;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.h7.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const VSpace(10),
        Text(
          text,
          style: TextStyles.h6.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const ChekInAppDivider(),
        const VSpace(20)
      ],
    );
  }
}
