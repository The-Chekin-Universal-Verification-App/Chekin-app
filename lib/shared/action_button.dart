import 'package:chekin/constants/value.dart';
import 'package:chekin/shared/custom_text.dart';
import 'package:chekin/utils/colors.dart';
import 'package:chekin/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class ActionButton extends StatelessWidget {
  final String text;
  final VoidCallback callback;
  final Color? color;
  final Color? textColor;
  final bool? load;
  final FontWeight? fontWeight;

  const ActionButton({
    Key? key,
    required this.text,
    required this.callback,
    this.color,
    this.textColor,
    this.load = false,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: heightSize(40),
        width: size.width,
        decoration: BoxDecoration(
            color: color ?? kPrimaryColor,
            borderRadius: BorderRadius.circular(Values().buttonRadius)),
        child: Center(
          child: load == true
              ? const SpinKitDoubleBounce(
                  color: kWhiteColor,
                  size: 45,
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: CText(
                    text: text,
                    fontWeight: fontWeight ?? FontWeight.w400,
                    size: 18,
                    color: textColor ?? kWhiteColor,
                    // letterSpacing: 2,
                  ),
                ),
        ),
      ),
    );
  }
}
