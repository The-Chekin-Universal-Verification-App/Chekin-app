import 'package:chekinapp/export.dart';
import 'package:flutter/material.dart';

class ColorBox extends StatelessWidget {
  const ColorBox(
      {super.key,
      this.color,
      required this.onTap,
      required this.child,
      this.boxConstrains,
      this.colorOpacity = .15,
      this.borderRadius,
      this.padding});
  final Color? color;
  final Widget child;
  final Function() onTap;
  final BoxConstraints? boxConstrains;
  final double colorOpacity;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: boxConstrains,
      padding: padding ?? const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? Corners.s8Border,
        color: color?.withOpacity(colorOpacity),
      ),
      child: child.clickable(onTap),
    );
  }
}
