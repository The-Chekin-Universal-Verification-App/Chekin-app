import 'package:chekin/shared/custom_text.dart';
import 'package:chekin/utils/colors.dart';
import 'package:chekin/utils/sizes.dart';
import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  final String title;
  final int index;
  const SlidingText({
    Key? key,
    required this.title,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CText(
          text: title,
          size: 14,
          height: 1.2,
        ),
        SizedBox(height: heightSize(9)),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            rowItem(color: index == 0 ? kBlackColor : kGreyColor),
            rowItem(color: index == 1 ? kBlackColor : kGreyColor),
            rowItem(color: index == 2 ? kBlackColor : kGreyColor),
          ],
        ),
      ],
    );
  }

  rowItem({required Color color}) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      child: CircleAvatar(
        radius: 3,
        backgroundColor: color,
      ),
    );
  }
}
