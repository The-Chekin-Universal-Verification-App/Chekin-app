import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

class Spinner extends StatelessWidget {
  const Spinner({this.color, Key? key}) : super(key: key);
  final Color? color;

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(theme.primary),
        backgroundColor: color ?? theme.background,
      ),
    );
  }
}
