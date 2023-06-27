import 'package:flutter/material.dart';

///switch between two screen size large screen or small screen
class OnBoardingScreenViewSwitcher extends StatelessWidget {
  const OnBoardingScreenViewSwitcher(
      {Key? key, this.largeScreenView, required this.smallScreenView})
      : super(key: key);

  final Widget? largeScreenView;
  final Widget smallScreenView;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, constraints) {
      if (constraints.maxWidth > 600) {
        return largeScreenView ??
            smallScreenView; //always return small screen when large screen is null
      } else {
        return smallScreenView;
      }
    });
  }
}
