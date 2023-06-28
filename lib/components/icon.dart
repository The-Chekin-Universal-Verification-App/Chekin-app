import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon(this.icon, {this.size, this.color, this.isSvg = true, Key? key})
      : super(key: key);
  final String icon;
  final Color? color;
  final double? size;
  final bool isSvg;

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return isSvg == true
        ? SvgPicture.asset(
            icon,
            color: color ?? theme.txt,
            height: size ?? Sizes.iconMed,
            width: size ?? Sizes.iconMed,
            fit: BoxFit.contain,
          )
        : ImageIcon(
            AssetImage(icon.trim()),
            color: color ?? theme.txt,
            size: size,
          );
  }
}
