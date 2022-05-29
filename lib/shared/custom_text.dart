import 'package:chekin/utils/colors.dart';
import 'package:chekin/utils/sizes.dart';
import 'package:flutter/material.dart';




class CText extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;
  final double? wordSpacing;
  final VoidCallback? onClick;
  final String? fontFamily;
  final double? letterSpacing;
  final TextAlign? textAlign;
  final double? height;
  final bool? allowOverflow;
  const CText({
    Key? key,
    required this.text,
    this.size,
    this.fontWeight,
    this.color,
    this.wordSpacing,
    this.onClick,
    this.fontFamily,
    this.letterSpacing,
    this.textAlign,
    this.height,
    this.allowOverflow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: onClick == null
          ? Text(
              text,
              textAlign: textAlign ?? TextAlign.start,
              overflow: allowOverflow == false ? null : TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: fontSize(size ?? 14),
                fontWeight: fontWeight ?? FontWeight.w400,
                fontFamily: fontFamily ?? 'Poppins-Regular',
                color: color ?? kBlackColor, //Colors.grey
                wordSpacing: wordSpacing,
                letterSpacing: letterSpacing ?? 0,
                height: height ?? 1,
              ),
            )
          : TextButton(
              onPressed: () => onClick?.call(),
              child: Text(
                text,
                textAlign: textAlign ?? TextAlign.start,
                overflow: allowOverflow == false ? null : TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: fontSize(size ?? 16),
                  fontWeight: fontWeight ?? FontWeight.w400,
                  fontFamily: fontFamily ?? 'Poppins-Regular',
                  color: color ?? kPrimaryColor, //Colors.grey
                  wordSpacing: wordSpacing,
                  letterSpacing: letterSpacing ?? 0,
                  height: height ?? 1,
                ),
              ),
            ),
    );
  }
}
