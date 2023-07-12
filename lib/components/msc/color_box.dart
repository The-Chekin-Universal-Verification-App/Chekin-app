import 'package:chekinapp/export.dart';
import 'package:flutter/material.dart';

class ColorBox extends StatelessWidget {
  const ColorBox(
      {super.key,
      this.color,
      required this.onTap,
      required this.child,
      this.boxConstrains});
  final Color? color;
  final Widget child;
  final Function() onTap;
  final BoxConstraints? boxConstrains;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: boxConstrains,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: Corners.s8Border,
        color: color?.withOpacity(.15),
      ),
      child: child.clickable(onTap),
    );
  }
}
