import 'package:chekin/constants/value.dart';
import 'package:chekin/shared/custom_text.dart';
import 'package:chekin/utils/colors.dart';
import 'package:chekin/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightSize(50),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: klightPrimaryColor.withOpacity(0.8),
        borderRadius: BorderRadius.circular(Values().buttonRadius),
      ),
      child: Row(
        children: [
          const Icon(
            Feather.search,
            color: kBlackColor,
          ),
          SizedBox(width: widthSize(20)),
          const CText(
            text: "Input LUX Code",
            color: kBlackColor,
            size: 14,
          ),
          const Spacer(),
          const Icon(
            Feather.sliders,
            color: kBlackColor,
          )
        ],
      ),
    );
  }
}
